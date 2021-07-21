---
title: POEI DevOps - Puppet
author: Pierre SABLE
date: 2021-07-21
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
extensions: 'extra'
---

<link rel="icon" href="favicon.png" type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>



#### Introduction

**Pierre SABLE** Formateur 

Découvrez notre webTV : <http://www.dawan.tv>

---

# Doc Source

<iframe src="2021-07-21-POEI-Puppet/Puppet.pdf" allowfullscreen=true> </iframe>

Document: [Puppet.pdf](2021-07-21-POEI-Puppet/Puppet.pdf)

## Docs officielles

- <https://puppet.com/>
- <https://puppet.com/docs/> & <https://puppet.com/docs/puppet/latest>


## Puppet VS Ansible

<div class=info> **Ansible** et **Puppet** peuvent être utlisés tous les deux dans un même SI.

Il ont des fonctionnalitées, utilisations et résultats différents qui peuvent être **complémentaires**.
</div>


![](https://i1.wp.com/foxutech.com/wp-content/uploads/2017/04/Differences-between-Ansible-and-Puppet.png?resize=696%2C290&ssl=1)

<https://foxutech.com/differences-between-ansible-and-puppet/>


[![Alt text](https://assets.digitalocean.com/articles/alligator/boo.svg)](https://digitalocean.com)


## Fichiers de configuration Puppet

Les fichiers de configurations sont écrits en DSL Ruby: <https://puppet.com/blog/ruby-dsl/>


# Image Vagrant *(Pierre)*

## Installation


## Vérification

On se connecte dans la VM: `vagrant ssh ppmaster.formation.lan`

Puis on vérifie l'installation de **Puppet**:

##### Liste des Paquets *Puppet*

```bash
vagrant@ppmaster:~$ apt list | grep puppet

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

elpa-puppet-mode/focal 0.3+132.g7dee1b5-2 all
etherpuppet/focal 0.3-3.1 amd64
fusiondirectory-plugin-puppet-schema/focal 1.3-2 all
fusiondirectory-plugin-puppet/focal 1.3-2 all
libpuppetlabs-http-client-clojure/focal 0.9.0-1 all
libpuppetlabs-i18n-clojure/focal 0.8.0-1 all
libpuppetlabs-ring-middleware-clojure/focal 1.0.0-2 all
librarian-puppet-simple/focal 0.0.5-3 all
librarian-puppet/focal 3.0.0-1 all
mcollective-plugins-puppetca/focal 0.0.0~git20120507.df2fa81-0ubuntu2 all
mcollective-plugins-puppetd/focal 0.0.0~git20120507.df2fa81-0ubuntu2 all
mcollective-plugins-puppetral/focal 0.0.0~git20120507.df2fa81-0ubuntu2 all
puppet-agent/focal 7.9.0-1focal amd64 [upgradable from: 7.8.0-1focal]
puppet-beaker/focal 4.1.0-1 all

```

##### Configuration *Docker*

```bash

vagrant@ppmaster:~$ docker ps
CONTAINER ID   IMAGE               COMMAND               CREATED      STATUS        PORTS     NAMES
2d380b379ea2   puppet/centos:1.0   "tail -f /dev/null"   7 days ago   Up 18 hours             cli02.formation.lan
e51491507dd1   puppet/debian:1.0   "tail -f /dev/null"   7 days ago   Up 18 hours             cli01.formation.lan


```

##### Service status

```bash
# Status service puppetserver:
root@ppmaster:~# systemctl status puppetserver.service 
● puppetserver.service - puppetserver Service
     Loaded: loaded (/lib/systemd/system/puppetserver.service; disabled; vendor preset: enabled)
     Active: inactive (dead)
root@ppmaster:~# systemctl start puppetserver.service 
root@ppmaster:~# systemctl enable puppetserver.service
Synchronizing state of puppetserver.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable puppetserver
Created symlink /etc/systemd/system/multi-user.target.wants/puppetserver.service → /lib/systemd/system/puppetserver.service.

```

Plus d'infos sur `Systemctl`: <https://opensharing.fr/commandes-linux-systemctl>


```bash
# Liste de Containers
root@ppmaster:~# docker ps
CONTAINER ID   IMAGE               COMMAND               CREATED      STATUS        PORTS     NAMES
2d380b379ea2   puppet/centos:1.0   "tail -f /dev/null"   7 days ago   Up 19 hours             cli02.formation.lan
e51491507dd1   puppet/debian:1.0   "tail -f /dev/null"   7 days ago   Up 19 hours             cli01.formation.lan

# Connexion dans le Container
root@ppmaster:~# docker container exec -it cli01.formation.lan bash
# Liste des paquets "puppet"
root@cli01:/# apt list | grep puppet
puppet-agent/now 7.8.0-1buster amd64 [installed,local]
puppet7-release/now 7.0.0-2buster all [installed,local]

```


# TP 

## Ajout d'un agent puppet dans l'infra puppetserver

##### 1. Connexion dans la VM

Connexion dans la VM ppmaster:

```bash
Admin stagiaire@BBG58Y2 MINGW64 ~/FORMATION/Puppet
$ vagrant ssh
Welcome to Ubuntu 20.04.2 LTS (GNU/Linux 5.4.0-73-generic x86_64)

...
vagrant@ppmaster:~$ 
```

##### 2. Connexion dans le client

Dans notre cas le client est: *cli02.formation.lan*

On se connecte dedans:

```bash
vagrant@ppmaster:~$ docker exec -it cli02.formation.lan bash
[root@cli02 /]# 

```

On vérifie la communication avec le **puppetserver**:

```bash
[root@cli02 /]# ping puppet
PING puppet (172.16.8.11) 56(84) bytes of data.
64 bytes from puppet (172.16.8.11): icmp_seq=1 ttl=64 time=0.056 ms       
64 bytes from puppet (172.16.8.11): icmp_seq=2 ttl=64 time=0.049 ms
^C
--- puppet ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 4ms
rtt min/avg/max/mdev = 0.049/0.052/0.056/0.008 ms

```

##### 3. Déclencher l'agent manuellement

Création du certificat de l'agent Puppet: 

```bash
[root@cli02 /]# /opt/puppetlabs/bin/puppet agent -t
Info: Creating a new RSA SSL key for cli02.formation.lan
Info: csr_attributes file loading from /etc/puppetlabs/puppet/csr_attributes.yaml
Info: Creating a new SSL certificate request for cli02.formation.lan
Info: Certificate Request fingerprint (SHA256): DA:CC:92:21:3F:33:43:74:5D:E2:C0:FE:30:93:06:85:54:4D:E8:64:65:82:D1:9F:FA:61:35:61:E0:22:AB:FA
Info: Certificate for cli02.formation.lan has not been signed yet
Couldn't fetch certificate from CA server; you might still need to sign this agent's certificate (cli02.formation.lan).
Exiting now because the waitforcert setting is set to 0.

```

##### 4. Vérification & Signature

Vérifier et signer le requete de signature de certificat côté puppetserver:

```bash
root@ppmaster:~# puppetserver ca list
Requested Certificates:
    ppmaster.home             (SHA256)  EF:F4:48:8D:7D:7B:B6:86:FB:DD:CD:CE:07:E8:D7:FD:E0:B2:E7:4C:D4:18:FE:EC:E9:77:04:81:A9:9D:D8:B8
    cli02.formation.lan       (SHA256)  DA:CC:92:21:3F:33:43:74:5D:E2:C0:FE:30:93:06:85:54:4D:E8:64:65:82:D1:9F:FA:61:35:61:E0:22:AB:FA
    cli01.formation.lan       (SHA256)  DD:CE:16:9A:F1:B4:EF:4F:C9:C8:4E:34:F9:2E:B9:3E:76:E7:1C:5E:63:9E:0E:9A:4E:66:AB:B4:79:A9:B2:2D

```

```bash
root@ppmaster:~# puppetserver ca sign --certname cli01.formation.lan
Successfully signed certificate request for cli02.formation.lan

```

##### 5. Application du catalogue

Redéclencher l'agent pour appliquer le catalogue:

```bash
[root@cli02 /]# /opt/puppetlabs/bin/puppet agent -t
Info: csr_attributes file loading from /etc/puppetlabs/puppet/csr_attributes.yaml
Info: Creating a new SSL certificate request for cli02.formation.lan
Info: Certificate Request fingerprint (SHA256): DA:CC:92:21:3F:33:43:74:5D:E2:C0:FE:30:93:06:85:54:4D:E8:64:65:82:D1:9F:FA:61:35:61:E0:22:AB:FA
Info: Downloaded certificate for cli02.formation.lan from https://puppet:8140/puppet-ca/v1
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Caching catalog for cli02.formation.lan
Info: Applying configuration version '1626872380'
Info: Creating state file /opt/puppetlabs/puppet/cache/state/state.yaml
Notice: Applied catalog in 0.02 seconds

```

## Certificats Puppet

<div class=info>

Pour afficher les certificats **en attente** de signature:

```bash
root@ppmaster:~# ls /etc/puppetlabs/puppetserver/ca/requests/
cli01.formation.lan.pem  cli02.formation.lan.pem  ppmaster.home.pem
```

Pour afficher les certificats **signés**:

```bash
root@ppmaster:~# ls /etc/puppetlabs/puppetserver/ca/signed/
ppmaster.formation.lan.pem
```

</div>


# Vocabulaire Puppet

- **Node** : serveur ou poste de travail administré par Puppet

- **Site** : ensemble des noeuds gérés par le Puppet Master

- **Resource** : objet que Puppet peut manipuler 

- **Classe** : moyen dans Puppet de séparer des morceaux de code

- **Module** : unité de code Puppet qui est réutilisable et pouvant être partagé

- **Facter** : librairie multi-plateforme qui fournit à Puppet sous forme de variables les informations propres au système (nom, adresse ip, système d’exploitation, etc.)

- **Manifest** : regroupe un ensemble de ressource.

- **Catalog** : ensemble des classes de configuration à appliquer à un nœud 

# Resource

Traduction de configurations vers une syntaxe Puppet:

```bash
# user: root
root@cli01:/# /opt/puppetlabs/bin/puppet resource user root
user { 'root':
  ensure             => 'present',
  comment            => 'root',
  gid                => 0,
  home               => '/root',
  password           => '*',
  password_max_age   => 99999,
  password_min_age   => 0,
  password_warn_days => 7,
  provider           => 'useradd',
  shell              => '/bin/bash',
  uid                => 0,
}
```

```bash
# Fichier /etc/profile
root@cli01:/# /opt/puppetlabs/bin/puppet resource file /etc/profile
file { '/etc/profile':
  ensure   => 'file',
  content  => '{sha256}b8ffd2c97588047e1cea84b7dfdb68bfde167e2957f667ca2b6ab2929feb4f49',
  ctime    => '2021-07-13 15:37:30 +0000',
  group    => 0,
  mode     => '0644',
  mtime    => '2016-03-04 11:00:00 +0000',
  owner    => 0,
  provider => 'posix',
  type     => 'file',
}

```

On peut ainsi "puppetiser" des configurations 😜 

![](https://emojipedia.org/skype/1.2/winking-face-with-tongue/)


# TP Ressources

#### Contexte

La ressource est le concept clé de puppet. Elle représente de manière abstraite tout objet concret géré sur la machine.


#### Objectifs

Dans ce travail pratique nous allons:

- nous familiariser avec la commande puppet
- découvrir la sous-commande puppet resource
- mettre en pratique nos connaissances de base de la syntaxe puppet
- écrire notre premier manifest
- compiler et appliquer notre premier catalogue

#### Prérequis

être connecté sur votre VM


## Exercice 1: découverte des ressources puppet

Nous allons utiliser la commande puppet resource afin de comprendre la correspondance entre le code puppet et l'état de la machine.

1. Taper la commande puppet help et prendre connaissance de la sortie

    ```bash
    $ puppet help
    ```
2. Taper la commande puppet help resource

    ```bash
    $ puppet resource --help
    ```

3. Utiliser la commande adéquate pour lister les types de ressources disponibles

```bash
root@cli01:/# puppet describe --list
These are the types known to puppet:
augeas          - Apply a change or an array of changes to the  ...
cron            - Installs and manages cron jobs
exec            - Executes external commands
file            - Manages files, including their content, owner ...
filebucket      - A repository for storing and retrieving file  ...
group           - Manage groups
host            - Installs and manages host entries
mount           - Manages mounted filesystems, including puttin ...
notify          - Sends an arbitrary message, specified as a st ...
package         - Manage packages
resources       - This is a metatype that can manage other reso ...
schedule        - Define schedules for Puppet
scheduled_task  - Installs and manages Windows Scheduled Tasks
selboolean      - Manages SELinux booleans on systems with SELi ...
selmodule       - Manages loading and unloading of SELinux poli ...
service         - Manage running services
ssh_authorized_key - Manages SSH authorized keys
sshkey          - Installs and manages ssh host keys
stage           - A resource type for creating new run stages
tidy            - Remove unwanted files based on specific crite ...
user            - Manage users
whit            - Whits are internal artifacts of Puppets curr ...
yumrepo         - The client-side description of a yum reposito ...
zfs             - Manage zfs
zone            - Manages Solaris zones
zpool           - Manage zpools
```

4. Utiliser la commande puppet pour représenter la ressource de type user du user root présent su la machine 

    ```bash
    root@cli01:/# /opt/puppetlabs/bin/puppet resource user root
    user { 'root':
      ensure             => 'present',
      comment            => 'root',
      gid                => 0,
      home               => '/root',
      password           => '*',
      password_max_age   => 99999,
      password_min_age   => 0,
      password_warn_days => 7,
      provider           => 'useradd',
      shell              => '/bin/bash',
      uid                => 0,
    }
    ```

---

## Exercice 2: Ecriture d'un manifest

1. Ecrire la définition d'une resource user dans un fichier manifest : `manage_user.pp`

   - Name : test
   - Shell : /bin/bash
   - Gecos (commentaire) : "user de test manage par puppet"

2. Appliquer le manifest localement (standalone)

```bash
root@cli01:/# puppet apply manage_user.pp 
Notice: Compiled catalog for cli01.formation.lan in environment production in 0.02 seconds
Notice: /Stage[main]/Main/User[test]/ensure: created
Notice: Applied catalog in 0.11 seconds
```


3. Modifier le manifest pour mettre l'utilisateur "test" dans le groupe "formation"

```bash
user { 'test':
  ensure    => 'present',
  comment   => 'test',
  home      => '/home/test',
  password  => 'test 123',
  provider  => 'useradd',
  shell     => '/bin/bash',
  groups    => 'formation',
}
```

<div class=alert> Le groupe **formation** n'existe pas !!! </div>


4. Créer le groupe "formation"

```bash
user { 'test':
  ensure    => 'present',
  comment   => 'test',
  home      => '/home/test',
  password  => 'test 123',
  provider  => 'useradd',
  shell     => '/bin/bash',
  groups    => 'formation',
}


group { 'formation':
  ensure   => 'present',
  provider => 'groupadd',
}

```

<div class=info> 

Puppet ne fonctionne pas de manière séquentielle comme Ansible. 

Le manifest est **compilé** avant d'être lancé !

</div>


# Configuration du Master 

```bash
vagrant@ppmaster:~$ tree /etc/puppetlabs/code/
/etc/puppetlabs/code/
├── environments
│   └── production
│       ├── data
│       ├── environment.conf
│       ├── hiera.yaml
│       ├── manifests
│       └── modules
└── modules

```



##### Déclenchement de l'agent sur le client 2

```bash
[root@cli02 /]# puppet agent -t
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Caching catalog for cli02.formation.lan
Info: Applying configuration version '1626879808'
Notice: /Stage[main]/Main/Group[formation]/ensure: created
Notice: /Stage[main]/Main/User[test]/ensure: created
Notice: Applied catalog in 0.15 seconds

```




---

# Tips & Tricks

- [Certificats Puppet](#certificats-puppet)

## *describe*

