---
title: POEI DevOps - Ansible
author: 
date: 2021-06-24
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
extensions: 'extra'
---
<link rel="icon" href="favicon.png" type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">


#### Formation Docker: Initiation

Pierre Sablé, Formateur & Administrateur Systèmes Linux - DevOps.
21H du 21/06/21 au 23/06/21

Tel : *07.63.88.76.21* - Mail: *<psable@dawan.fr>*

---

# Doc Source

Documentation Source en PDF:

<iframe src="2021-06-24-POEI-Ansible/Formation_Ansible-Pierre_SABLE.pdf" width="100%"  height="320px" allowfullscreen="yes"></iframe>

Site officiel: <https://www.ansible.com/overview/it-automation>

# *Tips & Tricks*

## YAML Checker

***YAML Checker*** permet de tester si le code YAML est correct ;)

<https://yamlchecker.com/>

## Syntax Check

Avec ansible il est possible d'utiliser la vérification de syntaxe avec:

```shell
odin@ansiblectl:~/formation_ansible$ ansible-playbook bootstrap_playbook.yml -b --syntax-check

playbook: bootstrap_playbook.yml
```

## Ansible Cheatsheet

Tuto Digital Ocean: <https://www.digitalocean.com/community/cheatsheets/how-to-use-ansible-cheat-sheet-guide>

## Les facts

Module pour collecter les facts : ``setup``.

Module lancé automatiquement lors du déclenchement d'un playbook au travers d'une task ``gathering_facts``


Le module peut être lancé manuellement en mode "Ad-Hoc" ou au travers d'une task dans un playbook
```shell
$ ansible -m setup nodes
```

## Tags

<https://docs.ansible.com/ansible/latest/user_guide/playbooks_tags.html>

Exemple :

```shell
$ ansible-playbook requirements_playbook.yml --tags crea_users
$ ansible-playbook requirements_playbook.yml --skip-tags crea_users
```




---

# Installation de ***Ansible***

Guide d'installation de **Ansible**: <https://docs.ansible.com/ansible/latest/installation_guide/index.html>

<https://docs.ansible.com/ansible/latest/installation_guide/index.html>




## Sur le Client *Deby*

### Prérequis

On vérifie que les prérequis sont bien présents:

`python --version` et `python3 --version`

```bash
stagiaire@debian:~$ python --version
Python 2.7.16
stagiaire@debian:~$ python3 --version
Python 3.7.3
```



### Attribution de droits *SUDO*

- Installation en **root**:

```bash
apt update -y 
apt install sudo -y
```

- Ajout du User "stagiaire" dans le groupe ***sudo***:

```bash
usermod -aG sudo stagiaire
```

## Sur le serveur Ansible ***Ansiblectl***

Sur le serveur ***Ansiblectl*** on installe les prérequis:

```bash
sudo apt update -y
sudo apt install python3-pip
```

Installe le binaire `ansible`pour le user *stagiaire*:

```bash
pip3 install ansible
```

On vérifie:

```bash
# Mise à jour du profile
odin@ansiblectl:~$ . .profile 

# Vérification
odin@ansiblectl:~$ ansible --version
ansible [core 2.11.2] 
  config file = None
  configured module search path = ['/home/odin/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/odin/.local/lib/python3.8/site-packages/ansible
  ansible collection location = /home/odin/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/odin/.local/bin/ansible
  python version = 3.8.5 (default, May 27 2021, 13:30:53) [GCC 9.3.0]
  jinja version = 2.10.1
  libyaml = True
```

## Connexion SSH Serveur/Client

On teste la connexion entre les 2 machines:

```bash
odin@ansiblectl:~$ . .profile 
odin@ansiblectl:~$ ansible --version
ansible [core 2.11.2] 
  config file = None
  configured module search path = ['/home/odin/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/odin/.local/lib/python3.8/site-packages/ansible
  ansible collection location = /home/odin/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/odin/.local/bin/ansible
  python version = 3.8.5 (default, May 27 2021, 13:30:53) [GCC 9.3.0]
  jinja version = 2.10.1
  libyaml = True
```

On teste la connexion ***ssh***:

```bash
odin@ansiblectl:~$ ssh stagiaire@192.168.1.42
The authenticity of host '192.168.1.42 (192.168.1.42)' can't be established.
ECDSA key fingerprint is SHA256:8t/KE2MR6n5dLX3NDDKq1pf5YvB3KKKsBqoumPNWUTA.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.1.42' (ECDSA) to the list of known hosts.
stagiaire@192.168.1.42's password: 
Linux debian 4.19.0-13-amd64 #1 SMP Debian 4.19.160-2 (2020-11-28) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Thu Jun 24 11:57:36 2021 from 192.168.1.38
         _,met$$$$$gg.           stagiaire@debian
      ,g$$$$$$$$$$$$$$$P.        OS: Debian 10 buster
    ,g$$P""       """Y$$.".      Kernel: x86_64 Linux 4.19.0-13-amd64
   ,$$P'              `$$$.      Uptime: 4d 6h 9m
  ',$$P       ,ggs.     `$$b:    Packages: 480
  `d$$'     ,$P"'   .    $$$     Shell: bash 5.0.3
   $$P      d$'     ,    $$P     CPU: Intel Core i7-8750H @ 2.208GHz
   $$:      $$.   -    ,d$$'     GPU: svgadrmfb
   $$\;      Y$b._   _,d$P'      RAM: 129MiB / 483MiB
   Y$$.    `.`"Y$$$$P"'         
   `$$b      "-.__              
    `Y$$                        
     `Y$$.                      
       `$$b.                    
         `Y$$b.                 
            `"Y$b._             
                `""""           
                                
```

Pour plus d'infos: <https://openclassrooms.com/fr/courses/43538-reprenez-le-controle-a-laide-de-linux/41773-la-connexion-securisee-a-distance-avec-ssh>

### Génération de clés ssh

```bash
odin@ansiblectl:~$ ssh-keygen -t ed25519 -b 4096 
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/odin/.ssh/id_ed25519):   
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/odin/.ssh/id_ed25519
Your public key has been saved in /home/odin/.ssh/id_ed25519.pub
The key fingerprint is:
SHA256:imdbgJv9XJVgQ142HRfNIioPBNWN7EONlF5NXQ+o5AU odin@ansiblectl
The key's randomart image is:
+--[ED25519 256]--+
|      .o.+EB+=+=*|
|        .oOoB.+o=|
|       . *== . ..|
|     .  o.Bo .   |
|    . . S+ .o    |
|     = o  ..     |
|    + = . .      |
|     o = .       |
|      . o        |
+----[SHA256]-----+
```
- Ici on laisse la **passphrase** vide.

- L'option `-b` permet de choisir le nombre de bits de la clé. Plutôt utiliser 4-8GB.

### Copie de la clé Publique

On copie la clé publique `id_ed25519.pub` sur le serveur **Deby**:

```bash
odin@ansiblectl:~$ ssh-copy-id -i /home/odin/.ssh/id_ed25519.pub stagiaire@192.168.1.42
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/odin/.ssh/id_ed25519.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
stagiaire@192.168.1.42's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'stagiaire@192.168.1.42'"
and check to make sure that only the key(s) you wanted were added.
```

On se log pour vérifier:

```bash
odin@ansiblectl:~$ ssh stagiaire@192.168.1.42
Linux debian 4.19.0-13-amd64 #1 SMP Debian 4.19.160-2 (2020-11-28) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Thu Jun 24 12:22:14 2021 from 192.168.1.37
         _,met$$$$$gg.           stagiaire@debian
      ,g$$$$$$$$$$$$$$$P.        OS: Debian 10 buster
    ,g$$P""       """Y$$.".      Kernel: x86_64 Linux 4.19.0-13-amd64
   ,$$P'              `$$$.      Uptime: 4d 6h 26m
  ',$$P       ,ggs.     `$$b:    Packages: 480
  `d$$'     ,$P"'   .    $$$     Shell: bash 5.0.3
   $$P      d$'     ,    $$P     CPU: Intel Core i7-8750H @ 2.208GHz
   $$:      $$.   -    ,d$$'     GPU: svgadrmfb
   $$\;      Y$b._   _,d$P'      RAM: 130MiB / 483MiB
   Y$$.    `.`"Y$$$$P"'         
   `$$b      "-.__              
    `Y$$                        
     `Y$$.                      
       `$$b.                    
         `Y$$b.                 
            `"Y$b._             
                `""""           
                                
stagiaire@debian:~$ 
```

<div class=success> La connexion se fait bien en utilisant la clé ssh </div>

On vérifie sur le serveur **Deby**:

```bash
stagiaire@debian:~$ ls -al .ssh/
total 164
drwx------  2 stagiaire stagiaire   4096 juin  24 12:36 .
drwxr-xr-x 16 stagiaire stagiaire 159744 juin  24 12:36 ..
-rw-------  1 stagiaire stagiaire     97 juin  24 12:36 authorized_keys
stagiaire@debian:~$ cat .ssh/authorized_keys 
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPTrlVkSDwfev5+Py4oEESLv96oxvSHyckhhhE2joUMq odin@ansiblectl
```

Les clés publiques sont dans le fichier `authorized_keys`.

```bash
stagiaire@debian:~$ cat .ssh/authorized_keys 
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPTrlVkSDwfev5+Py4oEESLv96oxvSHyckhhhE2joUMq odin@ansiblectl
```

<div class=info> En cas d'erreur: `ansible command not found`, il faut actualiser le `.profile` avec: . `~/.profile`. </div>






# Configuration de Ansible

## Inventory

>   Inventaire : point d'entrée pour spécifier les machines de mon réseau; les composant à administrer avec ansible
>
>   - élément essentiel : il décrit votre infra
>   - plusieurs formats : ini = plat   ou  yaml
>   - déclaration de node ou de groupes qui contiennent des nodes
>

Sur le serveur ***ansiblectl***, on créer le répertoire **formation_ansible** et dedans le fichier d'inventaire:

```bash
formation_ansible/
├── README.md
└── inventory_home

0 directories, 2 files
```

Dans le fichier d'inventaire on déclare la machine a gérer:
```bash
[local]
manager ansible_connection=local

[nodes]
mydeby ansible_host=192.168.1.42
```



On génère l'inventaire:
```bash
odin@ansiblectl:~/formation_ansible$ ansible-inventory -i inventory_home --list
{
    "_meta": {
        "hostvars": {
            "manager": {
                "ansible_connection": "local"
            },
            "mydeby": {
                "ansible_host": "192.168.1.42"
            }
        }
    },
    "all": {
        "children": [
            "local",
            "nodes",
            "ungrouped"
        ]
    },
    "local": {
        "hosts": [
            "manager"
        ]
    },
    "nodes": {
        "hosts": [
            "mydeby"
        ]
    }
}
```



### Test PING

```bash
odin@ansiblectl:~/formation_ansible$ ansible -i inventory_home --user stagiaire -m ping all
manager | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
mydeby | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
```


Tri par ***nodes*** *(groupe)* :
```bash
odin@ansiblectl:~/formation_ansible$ ansible -i inventory_home --user stagiaire -m ping nodes
mydeby | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
```


<div class=info>
Pour plus de facilité on rajoute le compte stagiaire dans l'inventaire:

```bash
mydeby ansible_host=192.168.1.42 ansible_user=stagiaire
```

On peut aussi rajouter une clé ssh si elle est différente:

```bash
mydeby ansible_host=192.168.1.42 ansible_user=stagiaire ssh_private_key_file=~/.ssh/custom_key
```
</div>

## ansible.cfg

<https://docs.ansible.com/ansible/latest/reference_appendices/config.html>

Un fichier `ansible.cfg` peut être lu au lancement d'une commande ansible.


- Plusieurs chemins possible : on parle de **precedence order**
- On peut y deposer des valeurs par défaut utilisée lors du lancement ansible
- Plusieurs sections à l'intérieur



```bash
odin@ansiblectl:~/formation_ansible$ ansible nodes -m ansible.builtin.apt -a "name=wget state=present"

mydeby | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "cache_update_time": 1624524688,
    "cache_updated": false,
    "changed": false
}
```




# Ansible Builtins

<https://docs.ansible.com/ansible/latest/collections/ansible/builtin/index.html>

<div class=info> Pour pouvoir utiliser les modules `ansible.builtin.*` en `sudo` il faudra utiliser l'option `BECOME`. </div>

- Sans l'option `BECOME`:
```bash
odin@ansiblectl:~/formation_ansible$ ansible nodes -m ansible.builtin.apt -a "name=ranger state=absent" -b

mydeby | FAILED! => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "module_stderr": "Shared connection to 192.168.1.42 closed.\r\n",
    "module_stdout": "sudo: il est nécessaire de saisir un mot de passe\r\n",
    "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error",
    "rc": 1
}
```

- Avec l'option `BECOME`:
```bash
odin@ansiblectl:~/formation_ansible$ ansible nodes -m ansible.builtin.apt -a "name=ranger state=absent" -b --ask-become-pass
BECOME password: 

mydeby | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false
}
```
Le paquet `ranger`est bien **absent**.


- Installation du paquet `ranger`:
```bash
odin@ansiblectl:~/formation_ansible$ ansible nodes -m ansible.builtin.apt -a "name=ranger state=present" -b --ask-become-pass
BECOME password: 

mydeby | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "cache_update_time": 1624524688,
    "cache_updated": false,
    "changed": true,
    "stderr": "",
    "stderr_lines": [],
    "stdout": "Reading package lists...\nBuilding dependency tree...\nReading state information...\nThe following packages were automatically installed and are no longer required:\n  apache2-bin apache2-data apache2-utils libapr1 libaprutil1\n  libaprutil1-dbd-sqlite3 libaprutil1-ldap libbrotli1 libjansson4 ssl-cert\nUse 'sudo apt autoremove' to remove them.\nThe following additional packages will be installed:\n  libgc1c2 w3m w3m-img\nSuggested packages:\n  atool caca-utils poppler-utils | mupdf-tools highlight | python-pygments\n  unoconv mediainfo | exiftool cmigemo dict dict-wn dictd libsixel-bin mpv\n  w3m-el xdg-utils xsel\nThe following NEW packages will be installed:\n  libgc1c2 ranger w3m w3m-img\n0 upgraded, 4 newly installed, 0 to remove and 0 not upgraded.\nNeed to get 1616 kB of archives.\nAfter this operation, 3826 kB of additional disk space will be used.\nGet:1 http://deb.debian.org/debian buster/main amd64 libgc1c2 amd64 1:7.6.4-0.4 [224 kB]\nGet:2 http://deb.debian.org/debian buster/main amd64 ranger all 1.9.2-4 [217 kB]\nGet:3 http://deb.debian.org/debian buster/main amd64 w3m amd64 0.5.3-37 [1042 kB]\nGet:4 http://deb.debian.org/debian buster/main amd64 w3m-img amd64 0.5.3-37 [132 kB]\nFetched 1616 kB in 3s (598 kB/s)\nSelecting previously unselected package libgc1c2:amd64.\r\n(Reading database ... \r(Reading database ... 5%\r(Reading database ... 10%\r(Reading database ... 15%\r(Reading database ... 20%\r(Reading database ... 25%\r(Reading database ... 30%\r(Reading database ... 35%\r(Reading database ... 40%\r(Reading database ... 45%\r(Reading database ... 50%\r(Reading database ... 55%\r(Reading database ... 60%\r(Reading database ... 65%\r(Reading database ... 70%\r(Reading database ... 75%\r(Reading database ... 80%\r(Reading database ... 85%\r(Reading database ... 90%\r(Reading database ... 95%\r(Reading database ... 100%\r(Reading database ... 50448 files and directories currently installed.)\r\nPreparing to unpack .../libgc1c2_1%3a7.6.4-0.4_amd64.deb ...\r\nUnpacking libgc1c2:amd64 (1:7.6.4-0.4) ...\r\nSelecting previously unselected package ranger.\r\nPreparing to unpack .../ranger_1.9.2-4_all.deb ...\r\nUnpacking ranger (1.9.2-4) ...\r\nSelecting previously unselected package w3m.\r\nPreparing to unpack .../w3m_0.5.3-37_amd64.deb ...\r\nUnpacking w3m (0.5.3-37) ...\r\nSelecting previously unselected package w3m-img.\r\nPreparing to unpack .../w3m-img_0.5.3-37_amd64.deb ...\r\nUnpacking w3m-img (0.5.3-37) ...\r\nSetting up libgc1c2:amd64 (1:7.6.4-0.4) ...\r\nSetting up w3m (0.5.3-37) ...\r\nSetting up w3m-img (0.5.3-37) ...\r\nSetting up ranger (1.9.2-4) ...\r\nProcessing triggers for libc-bin (2.28-10) ...\r\nProcessing triggers for man-db (2.8.5-2) ...\r\nProcessing triggers for mime-support (3.62) ...\r\n",
    "stdout_lines": [
        "Reading package lists...",
        "Building dependency tree...",
        "Reading state information...",
        "The following packages were automatically installed and are no longer required:",
        "  apache2-bin apache2-data apache2-utils libapr1 libaprutil1",
        "  libaprutil1-dbd-sqlite3 libaprutil1-ldap libbrotli1 libjansson4 ssl-cert",
        "Use 'sudo apt autoremove' to remove them.",
        "The following additional packages will be installed:",
        "  libgc1c2 w3m w3m-img",
        "Suggested packages:",
        "  atool caca-utils poppler-utils | mupdf-tools highlight | python-pygments",
        "  unoconv mediainfo | exiftool cmigemo dict dict-wn dictd libsixel-bin mpv",
        "  w3m-el xdg-utils xsel",
        "The following NEW packages will be installed:",
        "  libgc1c2 ranger w3m w3m-img",
        "0 upgraded, 4 newly installed, 0 to remove and 0 not upgraded.",
        "Need to get 1616 kB of archives.",
        "After this operation, 3826 kB of additional disk space will be used.",
        "Get:1 http://deb.debian.org/debian buster/main amd64 libgc1c2 amd64 1:7.6.4-0.4 [224 kB]",
        "Get:2 http://deb.debian.org/debian buster/main amd64 ranger all 1.9.2-4 [217 kB]",
        "Get:3 http://deb.debian.org/debian buster/main amd64 w3m amd64 0.5.3-37 [1042 kB]",
        "Get:4 http://deb.debian.org/debian buster/main amd64 w3m-img amd64 0.5.3-37 [132 kB]",
        "Fetched 1616 kB in 3s (598 kB/s)",
        "Selecting previously unselected package libgc1c2:amd64.",
        "(Reading database ... ",
        "(Reading database ... 5%",
        "(Reading database ... 10%",
        "(Reading database ... 15%",
        "(Reading database ... 20%",
        "(Reading database ... 25%",
        "(Reading database ... 30%",
        "(Reading database ... 35%",
        "(Reading database ... 40%",
        "(Reading database ... 45%",
        "(Reading database ... 50%",
        "(Reading database ... 55%",
        "(Reading database ... 60%",
        "(Reading database ... 65%",
        "(Reading database ... 70%",
        "(Reading database ... 75%",
        "(Reading database ... 80%",
        "(Reading database ... 85%",
        "(Reading database ... 90%",
        "(Reading database ... 95%",
        "(Reading database ... 100%",
        "(Reading database ... 50448 files and directories currently installed.)",
        "Preparing to unpack .../libgc1c2_1%3a7.6.4-0.4_amd64.deb ...",
        "Unpacking libgc1c2:amd64 (1:7.6.4-0.4) ...",
        "Selecting previously unselected package ranger.",
        "Preparing to unpack .../ranger_1.9.2-4_all.deb ...",
        "Unpacking ranger (1.9.2-4) ...",
        "Selecting previously unselected package w3m.",
        "Preparing to unpack .../w3m_0.5.3-37_amd64.deb ...",
        "Unpacking w3m (0.5.3-37) ...",
        "Selecting previously unselected package w3m-img.",
        "Preparing to unpack .../w3m-img_0.5.3-37_amd64.deb ...",
        "Unpacking w3m-img (0.5.3-37) ...",
        "Setting up libgc1c2:amd64 (1:7.6.4-0.4) ...",
        "Setting up w3m (0.5.3-37) ...",
        "Setting up w3m-img (0.5.3-37) ...",
        "Setting up ranger (1.9.2-4) ...",
        "Processing triggers for libc-bin (2.28-10) ...",
        "Processing triggers for man-db (2.8.5-2) ...",
        "Processing triggers for mime-support (3.62) ..."
    ]
}
```

# Ansible Playbook

## Création d'un utilisateur "ansible"

Création du ***playbook***: 

```yml
# Déclarer un play
# qui s'adresse au groupe nodes
# qui déclare une tasks pour appeler le module ansible.builtin.user
  # - name: ansible
  #  - membre du groupe sudo
  #  - shell /bin/bash
---

- name: module user pour le groupe nodes
  hosts: nodes

  tasks:

   - name: 
     ansible.builtin.user:
      name: ansible
      groups: sudo
      shell: /bin/bash

```


On exécute le ***playbook*** avec la commande suivante:

```bash
odin@ansiblectl:~/formation_ansible$ ansible-playbook premier_playbook.yml -b --ask-become-pass
BECOME password: 

PLAY [module user pour le groupe nodes] ****************************************************************************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************************************************************************************************
ok: [mydeby]

TASK [ansible.builtin.user] ****************************************************************************************************************************************************************************************************************
changed: [mydeby]

PLAY RECAP *********************************************************************************************************************************************************************************************************************************
mydeby                     : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

## Déploiement de clé ssh publique

On rajoute dans le fichier ***premier_playbook***:

```yml
# Déclaration d'une seconde task qui appelle le module "authorized_keys" pour pousser une clé ssh publique pour l'utilisateur "ansible"
   - name: Module authorized_key pour déployer la clé publique
     ansible.posix.authorized_key:
      user: ansible
      state: present
      key: "{{ lookup('file', '/home/odin/.ssh/id_ed25519.pub') }}"
```

Résultat:

```shell
odin@ansiblectl:~/formation_ansible$ ansible-playbook premier_playbook.yml -b --ask-become-pass
BECOME password: 

PLAY [module user pour le groupe nodes] ****************************************************************************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************************************************************************************************
ok: [mydeby]

TASK [ansible.builtin.user] ****************************************************************************************************************************************************************************************************************
ok: [mydeby]

TASK [Module authorized_key pour déployer la clé publique] *********************************************************************************************************************************************************************************
changed: [mydeby]

PLAY RECAP *********************************************************************************************************************************************************************************************************************************
mydeby                     : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
```

## Création d'un fichier de config sudoers

Dans le playbook:
```yml
# Déclaration d'une 3e task pour  générer un fichier de config sudo dédié à l'utilisateur "ansible".
   - name: Module COPY pour s'assurer qu'un fichier sudo pour ansible soit présent
     ansible.builtin.copy:
       dest: '/etc/sudoers.d/ansible'
       content: 'ansible ALL=(ALL:ALL) NOPASSWD: ALL'
       backup: yes
       owner: root
       group: root
       mode: 0440
       validate: /usr/sbin/visudo -csf %s
```

Résultat:
```yml
...
TASK [Module COPY pour s'assurer qu'un fichier sudo pour ansible soit présent] *********************************************
changed: [mydeby]

PLAY RECAP *****************************************************************************************************************
mydeby                     : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
```

### Modification de l'utilisateur 
 
Dans le fichier d'inventaire ***inventory_home***: 

```bash
# On modifie la ligne:
mydeby ansible_host=192.168.1.38 ansible_user=stagiaire

# En: 
mydeby ansible_host=192.168.1.38 
```

Puis on lance avec l'utilisateur ***ansible***:

En ***ssh***:
```bash
odin@ansiblectl:~/formation_ansible$ ssh ansible@192.168.1.38
Linux debian 4.19.0-17-amd64 #1 SMP Debian 4.19.194-2 (2021-06-21) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
ansible@debian:~$ 
```

```ini
odin@ansiblectl:~/formation_ansible$ ansible-playbook premier_playbook.yml --user ansible -b

PLAY [module user pour le groupe nodes] *****************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************************************************************************************
ok: [mydeby]

TASK [I. Création user ANSIBLE dans groupe SUDO] ********************************************************************************************************************************************************************************************************************
ok: [mydeby]

TASK [II. Déploiement de la CLE PUBLIQUE] ***************************************************************************************************************************************************************************************************************************
ok: [mydeby]

TASK [III. Création fichier config SUDOERS.D/ANSIBLE] ***************************************************************************************************************************************************************************************************************
ok: [mydeby]

PLAY RECAP **********************************************************************************************************************************************************************************************************************************************************
mydeby                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

### Modification dans ANSIBLE.CFG

Dans le fichier de configuration ***ansible.cfg*** on rajoute l'utilisateur par défaut ***ansible***.

```ini
[defaults]
inventory = ./inventory_home
remote_user = ansible
```

<div class=warning> Attention aux notions de priorité! 

- Le *user* déclaré dans le fichier d'inventaire sera prioritaire

- L'utilisateur déclaré dans *ansible.cfg* sera l'utilisateur par défaut, si rien n'est déclaré dans l'inventaire.

 </div>

## ANSIBLE en tant que SUDO

Notre utilisteur ***ansible*** possède des droits d'élévation *(sudo)*

Pour les utiliser avec la commande ``ansible`` on se servira de l'option `-b`.

### Sans l'option `-b`

```ini
odin@ansiblectl:~/formation_ansible$ ansible-playbook premier_playbook.yml

PLAY [module user pour le groupe nodes] **************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************
ok: [mydeby]

TASK [I. Création user ANSIBLE dans groupe SUDO] *****************************************************************************
ok: [mydeby]

TASK [II. Déploiement de la CLE PUBLIQUE] ************************************************************************************
ok: [mydeby]

TASK [III. Création fichier config SUDOERS.D/ANSIBLE] ************************************************************************
fatal: [mydeby]: FAILED! => {"changed": false, "checksum": "f725f552a06d08e617329d6322a1a209efef6759", "msg": "Destination /etc/sudoers.d not writable"}

PLAY RECAP *******************************************************************************************************************
mydeby                     : ok=3    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   

```

### Avec l'option `-b` 

```ini
odin@ansiblectl:~/formation_ansible$ ansible-playbook premier_playbook.yml -b

PLAY [module user pour le groupe nodes] **************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************
ok: [mydeby]

TASK [I. Création user ANSIBLE dans groupe SUDO] *****************************************************************************
ok: [mydeby]

TASK [II. Déploiement de la CLE PUBLIQUE] ************************************************************************************
ok: [mydeby]

TASK [III. Création fichier config SUDOERS.D/ANSIBLE] ************************************************************************
ok: [mydeby]

PLAY RECAP *******************************************************************************************************************
mydeby                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```


## *BootStrap Playbook*

Création d'un *playbook* permettant de gérer le socle pour ajouter de nouvelles machines dans la gestion d'Ansible.

```yml
# Déclarer un play
# qui s'adresse au groupe nodes
# qui déclare une tasks pour appeler le module ansible.builtin.user
  # - name: ansible
  #  - membre du groupe sudo
  #  - shell /bin/bash
---

- name: module user pour le groupe nodes
  hosts: nodes

  tasks:

# Déclaration d'une task qui permet de créer un utilisateur "ansible" avec les droits "sudo"
   - name: I. Création user ANSIBLE dans groupe SUDO
     ansible.builtin.user:
      name: ansible
      groups: sudo
      shell: /bin/bash

# Déclaration d'une seconde task qui appelle le module "authorized_keys" pour pousser une clé ssh publique pour l'utilisateur "ansible"
   - name: II. Déploiement de la CLE PUBLIQUE
     ansible.posix.authorized_key:
      user: ansible
      state: present
      key: "{{ lookup('file', '/home/odin/.ssh/id_ed25519.pub') }}"

# Déclaration d'une 3e task pour  générer un fichier de config sudo dédié à l'utilisateur "ansible".
   - name: III. Création fichier config SUDOERS.D/ANSIBLE
     ansible.builtin.copy:
       dest: '/etc/sudoers.d/ansible'
       content: 'ansible ALL=(ALL:ALL) NOPASSWD: ALL'
       backup: yes
       owner: root
       group: root
       mode: 0440
       validate: /usr/sbin/visudo -csf %s
...

```
## Requirements_Playbook

```yml
# Déclarer un play
# qui s'adresse au groupe "nodes"
# qui déclare une task pour appeler le module "ansible.builtin.apt"
# pour installer trois packages: nano, iperf, wget (liste)

# On va ensuite rebondir sur le concept de variable

```

## Variables dans Playbook

<div class=info> Dans Ansible, il existe **22** endroits pour déclarer un variable ^^ </div>


Doc Officielle: <https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html>

### Variables en Liste

Les variables sont déclarées avec ``vars:`` et utilisées avec la syntaxe: `` "{{ ... }}"``

Dans le ***playbook***:

```yml
---
- name: Bootstrap pour Nodes
  hosts: nodes
  vars:
    requirements:
      - python-apt
      - python3-apt
      - aptitude
    liste_packages:
      - nano
      - iperf
      - wget
      - ranger
      - htop

  tasks:

  - name: I. CHECK Requirements
    ansible.builtin.apt:
      name: "{{ requirements }}"
      state: present

  - name: II. Install apt requirements list
    ansible.builtin.apt:
      name: "{{ liste_packages }}"
      state: present

...

```

<div class=info>
Les listes ne sont pas suffisamment complexes pour correctement dimensionner le playbook. On a besoin de quelque chose de plus flexible et précis: Les dictionnaires.
</div>

# Loops

## Boucle dans des dictionnaires

Dans le *playbook*:

```yml
# Déclarer un play
# qui s'adresse au groupe "nodes"
# qui déclare une task pour appeler le module "ansible.builtin.apt"
# pour installer trois packages: nano, iperf, wget (liste)

# On va ensuite rebondir sur le concept de variable

---
- name: Bootstrap pour Nodes
  hosts: nodes
  vars:
    requirements:
      python-apt:
        state: present
      python3-apt:
        state: present
      aptitude:
        state: present
    list_packages:
      nano:
        state: absent
      iperf:
        state: present
      wget:
        state: present

  tasks:

  - name: I. CHECK Requirements
    ansible.builtin.apt:
      name: "{{ item.key }}"
      state: "{{ item.value.state }}"
    loop: "{{ requirements | dict2items }}"
    vars:
      tag_data: 

  - name: II. Install apt list packages
    ansible.builtin.apt:
      name: "{{ item.key }}"
      state: "{{ item.value.state }}"
    loop: "{{ list_packages | dict2items }}"

...

```

Résultat:

```ini
odin@ansiblectl:~/formation_ansible$ ansible-playbook bootstrap_playbook.yml -b

PLAY [Bootstrap pour Nodes] ************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************
ok: [mydeby]

TASK [I. CHECK Requirements] ***********************************************************************************************
ok: [mydeby] => (item={'key': 'python-apt', 'value': {'state': 'present'}})
ok: [mydeby] => (item={'key': 'python3-apt', 'value': {'state': 'present'}})
ok: [mydeby] => (item={'key': 'aptitude', 'value': {'state': 'present'}})

TASK [II. Install apt list packages] ***************************************************************************************
changed: [mydeby] => (item={'key': 'nano', 'value': {'state': 'absent'}})
ok: [mydeby] => (item={'key': 'iperf', 'value': {'state': 'present'}})
ok: [mydeby] => (item={'key': 'wget', 'value': {'state': 'present'}})

PLAY RECAP *****************************************************************************************************************
mydeby                     : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

### Gestion de Version de Programme

```yml
---
- name: Bootstrap pour Nodes
  hosts: nodes

  vars:
    requirements:
      python-apt:
        state: present
      python3-apt:
        state: present
      aptitude:
        state: present

    list_packages:
      nano:
        state: absent
      iperf:
        state: present
        version: 2.0.12+dfsg1-2
      wget:
        state: present

  tasks:

  - name: I. CHECK Requirements
    ansible.builtin.apt:
      name: "{{ item.key }}"
      state: "{{ item.value.state }}"
    loop: "{{ requirements | dict2items }}"
    vars:
      tag_data: 

  - name: II. Install apt list packages
    ansible.builtin.apt:
      name: "{{ item.key }}={{ item.value.version | default ('*') }}" # Permet de gérer les version | sinon default
      state: "{{ item.value.state }}"
    loop: "{{ list_packages | dict2items }}"

...

```

### Parcours de Structure de Données *(Exemple)*

```yml
---
- name: Bootstrap pour Nodes
  hosts: nodes

  vars:
...

    # Déclaration d'une liste d'utilisateurs sous forme de dictionnaire
    liste_users:
      formation:
        state: present
        shell: /bin/bash
        comment: "User formation"
      deploy:
        state: present
      dev01:
        shell: /bin/bash
        comment: "User developpement"


  tasks:

...


# Déclarer une task qui utilise le module ansible.buitin.user et qui parcours la structure de donnée
    # liste_user.
    # /!\  utilisation d'une iteration
    # /!\ valeurs par défaut (filter) => default(omit)

  - name: III. Parcours Structure Données
    ansible.builtin.user:
      name: "{{ item.key }}"
      state: "{{ item.value.state | default(omit) }}"
      shell: "{{ item.value.shell | default ('*') }}"
      comment: "{{ item.value.comment | default ('*') }}"
    loop: "{{ liste_users | dict2items }}"

```

Résultat:

```ini
odin@ansiblectl:~/formation_ansible$ ansible-playbook bootstrap_playbook.yml -b

PLAY [Bootstrap pour Nodes] *****************************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************************************************************************************
ok: [mydeby]

TASK [I. CHECK Requirements] ****************************************************************************************************************************************************************************************************************************************
ok: [mydeby] => (item={'key': 'python-apt', 'value': {'state': 'present'}})
ok: [mydeby] => (item={'key': 'python3-apt', 'value': {'state': 'present'}})
ok: [mydeby] => (item={'key': 'aptitude', 'value': {'state': 'present'}})

TASK [II. Install apt list packages] ********************************************************************************************************************************************************************************************************************************
ok: [mydeby] => (item={'key': 'nano', 'value': {'state': 'absent'}})
ok: [mydeby] => (item={'key': 'iperf', 'value': {'state': 'present', 'version': '2.0.12+dfsg1-2'}})
ok: [mydeby] => (item={'key': 'wget', 'value': {'state': 'present'}})

TASK [III. Parcours Structure Données] ******************************************************************************************************************************************************************************************************************************
ok: [mydeby] => (item={'key': 'formation', 'value': {'state': 'present', 'shell': '/bin/bash', 'comment': 'User formation'}})
ok: [mydeby] => (item={'key': 'deploy', 'value': {'state': 'present'}})
ok: [mydeby] => (item={'key': 'dev01', 'value': {'shell': '/bin/bash', 'comment': 'User developpement'}})

PLAY RECAP **********************************************************************************************************************************************************************************************************************************************************
mydeby                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
```


### Générer un mot de passe pour un uilisateur

#### Version n°1: Mot de passe en clair

```yml
---
- name: Bootstrap pour Nodes
  hosts: nodes

  vars:
...

    # Déclaration d'une liste d'utilisateurs sous forme de dictionnaire
    liste_users:
      formation:
        state: present
        shell: /bin/bash
        comment: "User formation"
      deploy:
        state: present
      dev01:
        shell: /bin/bash
        comment: "User developpement"
        password: hastaLaVista

  tasks:

...
# Déclarer une task qui utilise le module ansible.buitin.user et qui parcours la structure de donnée
    # liste_user.
    # /!\  utilisation d'une iteration
    # /!\ valeurs par défaut (filter) => default(omit)

  - name: III. Parcours Structure Données
    ansible.builtin.user:
      name: "{{ item.key }}"
      state: "{{ item.value.state | default(omit) }}"
      shell: "{{ item.value.shell | default ('*') }}"
      comment: "{{ item.value.comment | default ('*') }}"
      password: "{{ item.value.password | default (omit) | password_hash('sha512') }}"
    loop: "{{ liste_users | dict2items }}"


...

```


#### Version n°2: Mot de passe chiffré

```ini
odin@ansiblectl:~/formation_ansible$ ansible -m debug -a "msg={{ 'Hasta la Vista' | password_hash('sha512', 'saltY') }}" mydeby
mydeby | SUCCESS => {
    "msg": "$6$saltY$eHxdhtGa3DL64gCbmNdEtaplBBjrRV0KMJfaw8JC3NeykBUaKklWYfaL5oCGZEiHchijpi/9XrPcyx18UH3fE/"
}
odin@ansiblectl:~/formation_ansible$ 
```

On change les lignes:

```yml
#password: hastaLaVista
password: $6$saltY$eHxdhtGa3DL64gCbmNdEtaplBBjrRV0KMJfaw8JC3NeykBUaKklWYfaL5oCGZEiHchijpi/9XrPcyx18UH3fE/

#password: "{{ item.value.password | default (omit) | password_hash('sha512') }}"
password: "{{ item.value.password | default (omit) }}"
```


# Gestion avancée d'inventaire

Dans le dossier `formation_ansible` on rajoute les dossiers `group_vars` et `host_vars`. Ils serviront à déclarer des variables d'inventaire qui seront utilisées dans les playbooks.

```ini
odin@ansiblectl:~/formation_ansible$ tree
.
├── README.md
├── ansible.cfg
├── bootstrap_pkg_list.txt
├── bootstrap_playbook.yml
├── group_vars
│   ├── centos.yml
│   ├── debian.yml
│   └── ubuntu.yml
├── host_vars
├── inventory
└── requirements_playbook.yml

2 directories, 9 files
```

## Gestion de *group*

Exemple de contenu de ``ubuntu.yml``:

```yml
requirements:
      python-apt:
        state: present
      python3-apt:
        state: present
      aptitude:
        state: present

list_packages:
      nano:
        state: present
      iperf:
        state: present
      wget:
        state: present
```

## Gestion de *host*

```yml
list_packages:
      nano:
        state: absent
      iperf:
        state: absent
      wget:
        state: present
      curl:
        state: present
      ranger:
        state: present
      htop:
        state: present
```

# Conditionnals

Les **conditionnals** permettent de gérer des exceptions dans les playbooks.

Exemple:

```yml
tasks:
  - name: Shut down CentOS 6 and Debian 7 systems
    ansible.builtin.command: /sbin/shutdown -t now
    when: (ansible_facts['distribution'] == "CentOS" and ansible_facts['distribution_major_version'] == "6") or
          (ansible_facts['distribution'] == "Debian" and ansible_facts['distribution_major_version'] == "7")
```

<https://docs.ansible.com/ansible/latest/user_guide/playbooks_conditionals.html>



Exemple dans notre ***requirements_playbook.yml***:

```yml
  - name: II. Install apt list packages
    ansible.builtin.apt:
      name: "{{ item.key }}={{ item.value.version | default ('*') }}" # Permet de gérer les version | sinon default
      state: "{{ item.value.state }}"
    loop: "{{ list_packages | dict2items }}"
    # Ajout d'une condition pour que la task ne soit exécutée QUE quand la variable "liste_packages" est définie
    when: liste_package is defined
```


# Ajout d'une machine CentOS au parc

```ini
[local]
manager ansible_connection=local

[nodes:children]
debian
centos

[ubuntu]
manager

[debian]
mydeby ansible_host=192.168.3.3
deby2 ansible_host=192.168.3.4

[centos]
mycentos = ansible_host=192.168.3.5
```

## Erreur *SUDO*

Dans ***CentOS*** il n'y a pas de groupe ***SUDO***.

Nous devons donc modifier le playbook bootstrap pour accomoder notre nouveau besoin.

```yml
---

- name: module user pour le groupe nodes
  #• Varaiablilisation de la valeur hosts (pour gérer les différents OS)
  hosts: "{{ cible | default('all') }}" # On peut maintenant "cibler" les hosts

  tasks:

# Déclaration d'une task qui permet de créer un utilisateur "ansible" avec les droits "sudo"
   - name: I. Création user ANSIBLE dans groupe SUDO
     ansible.builtin.user:
      name: ansible
      groups: " {{ grp_sudo | default ('sudo') }} " # Défini "sudo" par défaut et la variable "grp_sudo" si renseignée
      shell: /bin/bash
```
On renseigne la variable `grp_sudo` dans l'inventaire, ici le fichier **centos.yml** dans le répertoire **group_vars**:

```yml
# group_vars/centos.yml
grp_sudo: wheel
```




## Lancement du *bootstrap_playbook*


```ini
odin@ansiblectl:~/formation_ansible$ ansible-playbook bootstrap_playbook.yml -b --user stagiaire --ask-become-pass -e "cible=centos"
BECOME password: 

PLAY [module user pour le groupe nodes] ****************************************************************************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************************************************************************************************
ok: [mycentos]

TASK [I. Création user ANSIBLE dans groupe SUDO] *******************************************************************************************************************************************************************************************
changed: [mycentos]

TASK [II. Déploiement de la CLE PUBLIQUE] **************************************************************************************************************************************************************************************************
changed: [mycentos]

TASK [III. Création fichier config SUDOERS.D/ANSIBLE] **************************************************************************************************************************************************************************************
changed: [mycentos]

PLAY RECAP *********************************************************************************************************************************************************************************************************************************
mycentos                   : ok=4    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

On utilise ici une **"extra vars"** pour déclarer la valeur de **"cible"**: `ansible-playbook bootstrap_playbook.yml -b --user stagiaire --ask-become-pass -e "cible=centos"`



[extra vars](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html) (for example, -e "user=my_user")(always win precedence)


# *Requirements_playbook*

Dans le playbook ***requirements*** on installe les différents paquets, cependant dans CentOS on utilise la gestionnaire de paquets ***yum***.


## Découverte des ***facts***

<https://docs.ansible.com/ansible/latest/user_guide/playbooks_vars_facts.html>


Ici les **facts** vont nous permettre de trier entre les familles ***Debian*** et ***RedHat***.

Exemple:
```ini
odin@ansiblectl:~/formation_ansible$ ansible -m setup all | grep -E "hostname|family"
        "ansible_hostname": "deby2",
        "ansible_os_family": "Debian",
        "ansible_hostname": "mydeby",
        "ansible_os_family": "Debian",
        "ansible_hostname": "centos8",
        "ansible_os_family": "RedHat",
        "ansible_hostname": "ansiblectl",
        "ansible_os_family": "Debian",
```

> Pour consulter les facts on utilisera le module "**setup**" 


## Modification du playbook

Dans le ***requirements_playbook.yml*** on rajoute le test sur la ``ansible_os_family``:

```yml

---
- name: Bootstrap pour Nodes
  hosts: all

  vars:
    # Déclaration d'une liste d'utilisateurs sous forme de dictionnaire
    liste_users:
      formation:
        state: present
        shell: /bin/bash
        comment: "User formation"
      deploy:
        state: present
      dev01:
        shell: /bin/bash
        comment: "User developpement"
        #password: hastaLaVista
        password: $6$saltY$eHxdhtGa3DL64gCbmNdEtaplBBjrRV0KMJfaw8JC3NeykBUaKklWYfaL5oCGZEiHchijpi/9XrPcyx18UH3fE/


  tasks:

  - name: I. Install list packages "Debian Family"
    ansible.builtin.apt:
      name: "{{ item.key }}={{ item.value.version | default ('*') }}" # Permet de gérer les version | sinon default
      state: "{{ item.value.state }}"
    loop: "{{ list_packages | dict2items }}"
    # Ajout d'une condition pour que la task ne soit exécutée QUE quand la variable "liste_packages" est définie
    when: liste_package is defined and ansible_os_family == 'Debian'

  - name: II. Install list packages sur "RedHat Family"
    ansible.builtin.yum:
      name: "{{ item.key }}-{{ item.value.version | default ('*') }}" # Permet de gérer les version | sinon default
      state: "{{ item.value.state }}"
    loop: "{{ list_packages | dict2items }}"
    # Ajout d'une condition pour que la task ne soit exécutée QUE quand la variable "liste_packages" est définie
    when: liste_package is defined and ansible_os_family == 'RedHat'

  - name: III. Parcours Structure Données
    ansible.builtin.user:
      name: "{{ item.key }}"
      state: "{{ item.value.state | default(omit) }}"
      shell: "{{ item.value.shell | default ('*') }}"
      comment: "{{ item.value.comment | default ('*') }}"
      #password: "{{ item.value.password | default (omit) | password_hash('sha512') }}"
      password: "{{ item.value.password | default (omit) }}"
    loop: "{{ liste_users | dict2items }}"

...

```

# Task 4: "Message of the Day"

Pour copier un fichier via Ansible sur nos machines on utilise le module `ansible.builtin.copy`.

```yml
  - name: IV. Déploiement du "Message of the Day"
    ansible.builtin.copy:
      dest: /etc/motd
      src: ./motd
      owner: root
      group: root

```

##  Gestion des copies de fichiers

- **Fichiers statiques:** Ces fichiers seront identiques sur toutes machines
  - Module `copy`
  - Déclarer tous les paramètres !
  - Paramètres `validate` et `backup`pour controler le contenu avant copie finale



F**ichier dynamiques => template** : vont être modélisé au déclenchement du playbook grace à un mélange de texte et de **variables** et de **facts**

Ecriture au format **jinja2**: 

- Site officiel: <https://jinja.palletsprojects.com/en/3.0.x/>
- Cheatsheet: <https://lzone.de/cheat-sheet/Jinja>

<div class=info>
Les templates *(dynamiques)* seront écrit en Jinja et donc avec l'extension `.j2`
</div>

## MOTD Dynamique

```python
{{ ansible_managed | comment }}

{# Afficher la distribution => facts #}
Machine: {{ ansible_facts['distribution'] }} {{ ansible_facts['distribution_release'] }}

{# Lister les interfaces réseau #}
{{ ansible_facts['interfaces'] }}

{# Affichier l'ip des interface réseaux sauf lo #}
{% for myinterface in ansible_facts['interfaces'] %}
{% if not myinterface | regex_search('^br.*') %}
Interface {{ myinterface }} : {{ ansible_facts[myinterface]['ipv4']['address'] }}
{% endif %}
{% endfor %}


{# Afficher le groupe SUDO #}
Groupe sudo: {{ grp_sudo }}

```

### Ajout du Groupe *sudo*

```python
{# Afficher le groupe SUDO #}
{% if ["ansible_os_family == 'Debian'"] %}
Groupe sudo: sudo
{% elif ['grp_sudo'] is defined %}
Groupe sudo: {{ grp_sudo }}
{% else %}
Groupe sudo: not defined
{% endif %}
```


# Troubleshooting

Options supplémentaires à l'appel du playbook

- ``--check`` (dry-run/preview)
- ``--diff`` (vue sur les changements dans un fichier ou templates)
- ``--syntax-check``



Linter :
```shell
pip3 install ansible-lint
ansible-lint requirements_playbook.yml 
```

# Ansible Vault

Encrytion de données => SECURITY

<https://docs.ansible.com/ansible/latest/user_guide/vault.html>


# Rôles & Structure

Permet de scinder la gestion de Ansible pour faciliter la gestion des projets.

<iframe src="2021-06-24-POEI-Ansible/Roles_and_Structures.pdf" width="100%"  height="320px" allowfullscreen="yes"></iframe>

Doc officielle: <https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html>

Dépôt de Rôles:<https://galaxy.ansible.com/>


# Handlers

Permet de programmer des actions en cas de changement.

Exemple: Changement de configuration *(ssh, apache, etc)* puis redémarrage du service.

**Handlers**: running operations on change, <https://docs.ansible.com/ansible/latest/user_guide/playbooks_handlers.html>