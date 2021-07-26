# TP Ajout d'un agent puppet dans l'infra puppetserver


## Déclenchement agent

1. Se connecter dans le conteneur cli02.formation.lan

    ```bash
    $ docker exec -it cli02.formation.lan bash
    ```

2. Vérifier la communication vers le puppetserver 
    
    - Conf agent par défaut : puppet

    ```bash
    $ ping puppet
    ```

3. Déclencher l'agent manuellement

     ```bash
    $ /opt/puppetlabs/bin/puppet agent -t
    ```

4. Vérifier et signer le requete de signature de certificat côté puppetserver

    ```bash
    $ puppetserver ca list
    $ puppetserver ca sign --certname cli02.formation.lan
    ```

5. Redéclencher l'agent pour appliquer le catalogue

   ```bash
   $ /opt/puppetlabs/bin/puppet agent -t
   ```


## Contenu manifest :

```puppet
package { 'openssh-server':
  ensure => 'installed',
}
-> augeas { 'conf sshd':
    context => '/files/etc/ssh/sshd_config',
    changes => [ 'set PermitRootLogin no',
                 'set LogLevel DEBUG',
               ],
    #notify  => Service['sshd'],
    #require => Package['openssh-server'],
}
~> service { 'sshd':
  ensure => 'running',
  enable => true,
}
```