# Formation Puppet

## Doc :

https://puppet.com/docs/puppet/7/install_puppet.html#install_puppet

https://puppet.com/docs/puppet/7/server/install_from_packages.html

https://puppet.com/docs/puppet/7/install_agents.html#install_agents

## Puppetserver

- Ensemble de package

- Service puppetserver

    - 1 : Vérifier le status du service
        ```bash
        $ systemctl status puppetserver
        ```
    - 2 : Démarrer le service
        ```bash
        $ sudo systemctl start puppetserver
        ```
    - 3 : Activer le service au boot de la VM Linux
        ```bash
        $ sudo systemctl enable puppetserver
        ```

- Configuration de l'instance puppetserver (JAVA)

    - Fichier : /etc/default/puppetserver
    - Ex : augmenter la taille mémoire de la JVM (par défaut 2Go)

- Configuration puppetserver / puppet-agent :
    - Fichiers et répertoires situés dans : /etc/puppetlabs
    - Par défaut, un serveur puppet est joignable en https sur le port 8140.

- Commandes puppetserver

    - Nécessite des privilèges root
        ```bash
        $ sudo -i
        ```

    - Commande puppetserver pour lister les certificats (correpondants aux agent) en attente de signature

        ```bash
        $ puppetserver ca list
        ```

    - Commande puppetserver pour lister les certificats (correpondants aux agent) signés (authentifiés)

        ```bash
        $ puppetserver ca list --all
        ```

    - Commande puppetserver pour signer manuellement un certificat (nouvel agent)

        ```bash
        $ puppetserver ca sign --certname cli01.formation.lan
        ```

- Etape de siganture des certificats agents :

    - Par défaut manuelle
    - Peut-être automatisée : 
        - https://puppet.com/docs/puppet/7/ssl_autosign.html
        - https://puppet.com/docs/puppet/6/config_file_autosign.html

## Puppet-agent

- Pour la maquette, les agents puppet sont installés dans des conteneurs docker
    - Connexion dans un des conteneurs:
        ```bash
        $ docker container exec -it cli01.formation.lan bash
        ```
    
- Package puppet-agent:
    ```bash
    $ apt list | grep puppet
    ```

- Fichier de configuration de l'agent Puppet :

    - /etc/puppetlabs/puppet/puppet.conf
      - https://puppet.com/docs/puppet/7/config_file_main.html
    - Par défaut un agent puppet cherche à contacter un puppetserver nommé "puppet" dans le réseau d'entreprise
    - Par défaut un agent puppet créé un certificat à partir de son hostname.
    - Par défaut, un agent puppet se situe dans un environnement "production"


- Déclenchement de l'agent

    - Par défaut un agent puppet n'est pas actif (son service est éteint )
    - Il faut le déclencher manuellement avec une commande puppet
        ```bash
        $ /opt/puppetlabs/bin/puppet agent -t
        ```
    - L'agent créé un certificat, et requete de signature de certificat et l'envoi à son puppetserver "puppet"
    - Il attend la signature du certificat
    - Une fois le certificat signé côté puppetserver, le déclenchement de l'agent abouti

- Mode agent service : déclenchement auto

    - Il faut activer et démarrer le service puppet

        ```bash
        $ systemctl enable puppet
        $ systemctl start puppet
        ```
    - Par défaut le runinterval est de 30 minutes

    - On peut le régler dans le fichier de config :

        ```ini
        [main]
        runinterval = 5m
        ```
    
    - Redémarrer le service pour prise en compte

- On peut déclencher un agent en mode dry-run (preview, différence entre l'existant et le catalogue envoyé par puppetserver)

    ```bash
    $ puppet agent -t --noop
    ```

## Code puppet sur puppetserver (orienté production)

- Arborescence de dépose du code par défaut :

    - /etc/puppetlabs/code

- Puppet gere le code par environnements, par defaut un environnement existe : production

```
code
├── environments
│   └── production
│       ├── data
│       ├── environment.conf
│       ├── hiera.yaml
│       ├── manifests
│       └── modules
```

- On dépose notre manifeste, dans l'environnement production et dans le répertoire manifest

  - Sur notre maquette :
    
    ```bash
    $ cd /etc/puppetlabs/code/environments/production/manifests
    $ docker cp cli01.formation.lan:/manage_user.pp .
    ```

- On déclenche l'agent puppet sur cli02.formation.lan

    ```bash
    $ puppet agent -t
    ```

- Validation du code sans déclencher un agent :

    ``bash
    $ puppet parser validate {manifest ou un repertoire qui contient des manifest}
    ```

## Variables et facts 

- variables : https://puppet.com/docs/puppet/6/lang_variables.html

- facts : https://puppet.com/docs/puppet/7/lang_facts_accessing.html

    - on peut les lister sur un agent avec :
        ```bash
        $ puppet facts
        ```

## Conditionnals

https://puppet.com/docs/puppet/7/lang_conditional.html

## Itération - Loops

https://puppet.com/docs/puppet/7/lang_iteration.html


## Modules puppet

 - classe bien rangées
 - Serveur de fichiers (classer les fichiers statics, templates)
 - Arborescence à respecter
 - Outil fourni par puppet : PDK
    - https://puppet.com/try-puppet/puppet-development-kit/
    - https://puppet.com/docs/pdk/2.x/pdk_creating_modules.html
 - Forge puppet : catalogue de module déjà codé et donc téléchargeables et utilisables
    - https://forge.puppet.com/


 - Création d'un module en ligne de commande : 
   
   ```bash
   $ pdk new module bootstrap /etc/puppetlabs/code/environments/production/modules/bootstrap
   ```

 - Arborescence d'un module :

   ```bash
   modules/
   └── bootstrap
       ├── CHANGELOG.md
       ├── Gemfile
       ├── Gemfile.lock
       ├── README.md
       ├── Rakefile
       ├── appveyor.yml
       ├── data
       │   └── common.yaml
       ├── examples
       ├── files
       ├── hiera.yaml
       ├── manifests
       ├── metadata.json
       ├── spec
       │   ├── default_facts.yml
       │   └── spec_helper.rb
       ├── tasks
       └── templates
   ```

## HIERA - Management des variables

- https://puppet.com/docs/puppet/7/hiera_intro.html
- https://puppet.com/docs/puppet/7/hiera.html

- Permet de surcharger, définir des variables utilisées en paramètre de classe
    - Surtout facilite la déclaration pour un node, ou en ensemble de nodes lors de l'appel d'un module

### Astuce environnement de code 

- Copie du répertoire code d'origine dans notre partage (pour pouvoir l'éditer avec vscode)

    ```bash
    $ cp -r /etc/puppetlabs/code /vagrant/
    ```

- Suppression du répertoire d'origine pour créer le lien derrière

    ```bash
    $ cd /etc/puppetlabs
    $ rm -rf code
    $ ln -s /vagrant/code code
    $ ls -l
    ```
