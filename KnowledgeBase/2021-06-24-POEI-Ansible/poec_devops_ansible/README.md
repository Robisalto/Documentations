# Formation Ansible

# Prérequis managed node (deby)

https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#prerequisites

1) Vérifier ssh

2) Vérifier l'interpreteur python :

    ```bash
    $ which python
    $ python
    $ python3
    ```

3) Mettre en place une mécanique d'élévation de privilège : SUDO

- SUDO (package) permet d'attribuer des droits spécifiques (devenir root, lancer une commande spécifique en tant que root)

- Installation en root: 

   ```bash
   $ apt update
   $ apt install sudo
   ```

- Ajout du user stagiaire dans le groupe SUDO

   ```bash
   $ usermod -aG sudo stagiaire
   ```


# Prérequis control node (ansiblectl)

1) Vérifier ssh

2) Vérifier l'interpreteur python :

    ```bash
    $ which python
    $ python
    $ python3
    ```

3) Binaire ansible

  - Prérequis pip :

   ```bash
   $ sudo apt update
   $ sudo apt install python3-pip
   ```

  - Install binaire ansible pour le user stagiaire :

   ```bash
   $ pip3 install ansible
   ```

  - Rechargement (sourcing) du fichier d'environnement utilisateur

  ```bash
  $ . .profile
  ```

  - Test de la version ansible 

  ```bash
  $ ansible --version
  ```

4) Communication SSH

  - Test ping vers deby

   ```bash
   $ ping 192.168.0.24
   ```

  - Test ssh login/mdt

  ```bash
  $ ssh stagiaire@192.168.0.24
  ```

  - Création paire clé public/privée

  ```bash
  $ ssh-keygen -t ed25519 -b 4096
  Generating public/private ed25519 key pair.
   Enter file in which to save the key (/home/stagiaire/.ssh/id_ed25519): 
   Enter passphrase (empty for no passphrase): 
   Enter same passphrase again: 
   Your identification has been saved in /home/stagiaire/.ssh/id_ed25519
   Your public key has been saved in /home/stagiaire/.ssh/id_ed25519.pub
   The key fingerprint is:
   SHA256:ARpiK+1Lw3GdpBy5Vf7j/UZRgWvYhj6VHoJ3BURp5Vw stagiaire@ansiblectl
   The key's randomart image is:
   +--[ED25519 256]--+
   |  o o.o..   o+=oE|
   | o +.B.+     +o.o|
   |. + =oo o . = ++ |
   | + o.    + = X.  |
   |  =     S = B .. |
   | . o     . = ..  |
   |  .       . o.   |
   |             ..  |
   |             ..  |
   +----[SHA256]-----+
   ```

   - Envoi de la clé publique sur le serveur distant 

   ```bash
   stagiaire@ansiblectl:~$ ssh-copy-id -i /home/stagiaire/.ssh/id_ed25519 stagiaire@192.168.0.24
   ```

## Inventaire ansible

https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html

> Inventaire : point d'entrée pour spécifier les machines de mon réseau; les composant à administrer avec ansible

  - élément essentiel : il décrit votre infra
  - plusieurs formats : ini = plat   ou  yaml 
  - déclaration de node ou de groupes qui contiennent des nodes

  - Commande : ansible-inventory

    ```bash
    $ ansible-inventory -i hosts --list -y
    $ ansible-inventory -i hosts --graph
    ```


## Premiers pas ansible : mode "AdHoc"

https://docs.ansible.com/ansible/latest/user_guide/intro_adhoc.html

 - permet du test (module ping, inventaire)

   ```bash
   $ ansible nodes -i inventory -m ping
   ```

 - permet de recolter de l'info

   ```bash
   $ ansible -i inventory -a "df -h" all
   ```

 - permet de déclencher une actions sur les serveurs distants au travers de modules. /!\ Certaines action necessitent une *élévation de privilèges*. On utilisera l'option *become* + *ask-become-pass* si necessaire.

   ```bash
   $ ansible nodes  -m ansible.builtin.apt -a "name=wget state=present" -b --ask-become-pass
   ```

## Config ansible 

https://docs.ansible.com/ansible/latest/reference_appendices/config.html

> Un fichier ansible.cfg peut être lu au lancement d'une commande ansible.

  - Plusieurs chemins possible : on parle de precedence order
  - On peut y deposer des valeurs par défaut utilisée lors du lancement ansible
  - Plusieurs sections à l'intérieur


## Modules ansible :

https://docs.ansible.com/ansible/2.9/modules/list_of_all_modules.html

  - Outils mis à dispo par ansible pour réaliser des actions sur notre parc

  - Ex avec le module user :
    - https://docs.ansible.com/ansible/2.9/modules/user_module.html#user-module

  - Avec la doc, il devient plus facile d'utiliser les modules dans un *playbook* au format YAML => exemples concrets dans la doc du modules

  - Doc YAML : https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html


## Playbook

  - Déclenchement du premier playbook: 

    ```bash
    $ ansible-playbook premier_playbook.yml -b --ask-become-pass
    ```


## Variables : 

> https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html

  - Apportent de la flexibilité au code
  - Améliore les besoins future
  - Permet de faire de la distinction entre groupes, machines pour un même code
  - apporte des structure type liste, dictionnaires pour utilisation dans les modules
  - Une même variable peut être déclarée à plusieurs endroits en même temps


  - Les variables d'inventaire :
    - on peut déclarer des variables dans le fichier d'inventaire
    - On peut déclarer des variables par groupe d'inventaire ou host d'inventaire
    - Les répertoires group_vars et host_vars doivent être à la meme arborescence que leur fichier d'inventaire.

> On va alors prendre en considération la "précédence" des variables

https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable

- Il peut être important de masquer la valeur d'une variable sensible, ou même toute une structure de données popur ne pas donner de piste sur des noms de variable ou la construction d'un fichier yaml
   - Ansible propose la commande ansible-vault
   - https://docs.ansible.com/ansible/latest/user_guide/vault.html

   ```bash
   $ ansible-vault encrypt_string '$6$8DbmPhcJeH0mDpyI$MTb.LSbFm1i7/pl5HyFrTzxuC019KpObyNKm1xn1i8jE67z.0p8geqwQJIhgxw00PtMk4Fmyhywp4i05gS.UC1' --name 'password'
   ```

   - On doit spécifier le mot de passe vault pour encrypter et decrypter

      ```bash
      $ ansible-playbook requirements_playbook.yml --ask-vault-password
      ```

   - On peut s'appuyer sur un fichier qui contient le mot de passe vault :

      ```bash
      $ ansible-vault encrypt_string '$6$8DbmPhcJeH0mDpyI$MTb.LSbFm1i7/pl5HyFrTzxuC019KpObyNKm1xn1i8jE67z.0p8geqwQJIhgxw00PtMk4Fmyhywp4i05gS.UC1' --name 'password' --vault-password-file .vault_password
      $ ansible-playbook requirements_playbook.yml --vault-password-file .vault_password
      ```



## DEBUG et VARIABLES

  - On peut utiliser le module debug (ansible.builtin.debug) pour afficher du texte, le contenu d'une variable
  - Le module debug permet de générer des output suite à l'application de filtre : ex encryption password

    ```bash
    $ ansible -m debug -a "msg={{ 'formation123' | password_hash('sha512') }}" mydebian
    mydebian | SUCCESS => {
    "msg": "$6$H4kPS1lKBCzVYo8x$9Tjk6UCd5mULhlwdhsFuUjCD4FzUbHv.z6TFL6/5vSuJ/PuAlRd.os/34SvDNNftezpcBuH8C6Qfli6bfJd/M0"
    }
    ```

## Conditions et variables :

> Les conditionnals : faire réaliser un task ou non réaliser une task sur condition

  - when :

https://docs.ansible.com/ansible/latest/user_guide/playbooks_conditionals.html#basic-conditionals-with-when


## Itérationd => LOOPS

> https://docs.ansible.com/ansible/latest/user_guide/playbooks_loops.html

> https://docs.ansible.com/ansible/latest/user_guide/playbooks_loops.html#iterating-over-a-dictionary


## Les facts

> Module pour collecter les facts : setup.

  - Module lancé automatiquement lors du déclenchement d'un playbook au travers d'une task **gathering_facts**

  - Le module peut être lancé manuellement en mode "Ad-Hoc" ou au travers d'une task dans un playbook

    ```bash
    $ ansible -m setup nodes
    ```

## Gestion des fichiers :

  - Fichiers statiques (identiques sur toutes les machines)
    - module copy
    - /!\ déclarer tous les paramettres
    - /!\ parametres validate et backup pour controler le contenu avant copie finale

  - Fichier dynamiques => template : vont être modélisé au déclenchement du playbook grace à un mélange de tesxte et de **variables** et de **facts**
    - Ecriture au format **jinja2**
    - https://docs.ansible.com/ansible/latest/collections/ansible/builtin/template_module.html
    - https://docs.ansible.com/ansible/latest/user_guide/playbooks_templating.html


## TAGS / LIMITS :

https://docs.ansible.com/ansible/latest/user_guide/playbooks_tags.html

Ex :
```bash
$ ansible-playbook requirements_playbook.yml --list-tasks
$ ansible-playbook requirements_playbook.yml --tags crea_users
$ ansible-playbook requirements_playbook.yml --skip-tags crea_users
```

## Troubleshooting

  - Options supplémentaires à l'appel du playbook
     - --check (dry-run/preview)
     - --diff (vue sur les changements dans un fichier ou templates)
     - --syntax-check

  - Linter :
     ```bash
     $ pip3 install ansible-lint
     $ ansible-lint requirements_playbook.yml 
     ```


## Roles

https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html

  - Ensemble autonome d'actions ayant un objectif commun
  - Lier les fichiers, structurer l'environnement 
  - Apporte un fonctionnement par defaut qui peut être surcharger via la redéclaration des variables (dans l'inventaire host_vars, group_vars)
  - Un rôle a son propre historique de versionning (release)
  - dédié au partage des tâches
  - principe du lego => plus il est petit plus il sera réutilisable
  

## Handlers 

> Déclenchement d'un task (handlers) sur changement (ex config -> redemarrage)

https://docs.ansible.com/ansible/latest/user_guide/playbooks_handlers.html