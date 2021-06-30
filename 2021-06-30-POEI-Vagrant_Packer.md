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

<iframe src="2021-06-24-POEI-Ansible/.pdf" width="100%"  height="320px" allowfullscreen="yes"></iframe>

Site officiel: <https://www.ansible.com/overview/it-automation>

# *Tips & Tricks*


# Installation

Lien install officiel: <https://www.vagrantup.com/>

On vérifie l'installation avec les commandes:

```bash
vagrant version
vagrant --version
```

# Scaffolding

```shell
vagrant init ubuntu/focal64
```

Vagrantfile: <https://www.vagrantup.com/docs/vagrantfile>

# Les Boxes Vagrant

<https://app.vagrantup.com/boxes/search>


# Gérer les états

- `vagrant up`: Créer/démarrer les VMs
- `vagrant halt`: Arrêter les VMs
- `vagrant reload`: halt + up
- `vagrant suspend`: suspendre les traitements dans les VMs


## Vagrant Status

- `vagrant status`: renvoie les informations de la VM dans le dossier courant

```bash
Admin stagiaire@BBG58Y2 MINGW64 ~/vagrant
$ vagrant status
Current machine states:

default                   running (virtualbox)

The VM is running. To stop this VM, you can run `vagrant halt` to
shut it down forcefully, or you can run `vagrant suspend` to simply
suspend the virtual machine. In either case, to restart it again,
simply run `vagrant up`.
```

- `vagrant global-status`: Renvoie les informations de toutes les VMs provisionnées et les identifiants.

```bash
vagrant global-status
id       name    provider   state   directory                                                
-------------------------------------------------------------------------------------        
d9be6c2  default virtualbox running C:/Users/Admin stagiaire.DESKTOP-8967908/vagrant

The above shows information about all known Vagrant environments
on this machine. This data is cached and may not be completely
up-to-date (use "vagrant global-status --prune" to prune invalid
entries). To interact with any of the machines, you can go to that
directory and run Vagrant, or you can use the ID directly with
Vagrant commands from any directory. For example:
"vagrant destroy 1a2b3c4d"
```




## Vagrant suspend

Permet de **suspendre** l'état de la machine.

> Suspend
>
> Command: vagrant suspend [name|id]
> 
> This suspends the guest machine Vagrant is managing, rather than fully shutting it down or destroying it.
> 
> A suspend effectively saves the exact point-in-time state of the machine, so that when you resume it later, it begins running immediately from that point, rather than doing a full boot.
> 
> This generally requires extra disk space to store all the contents of the RAM within your guest machine, but the machine no longer consumes the RAM of your host machine or CPU cycles while it is suspended.
>  --<cite> https://www.vagrantup.com/docs/cli/suspend </cite>


<div class=info> Pour suspendre toutes les VMs: `vagrant suspend` </div>

**Exemple:**

```bash
Admin stagiaire@BBG58Y2 MINGW64 ~/vagrant
$ vagrant status
Current machine states:

default                   running (virtualbox)

The VM is running. To stop this VM, you can run `vagrant halt` to
shut it down forcefully, or you can run `vagrant suspend` to simply
suspend the virtual machine. In either case, to restart it again,
simply run `vagrant up`.

Admin stagiaire@BBG58Y2 MINGW64 ~/vagrant
$ vagrant global-status
id       name    provider   state   directory                                                
-------------------------------------------------------------------------------------        
d9be6c2  default virtualbox running C:/Users/Admin stagiaire.DESKTOP-8967908/vagrant

The above shows information about all known Vagrant environments
on this machine. This data is cached and may not be completely
up-to-date (use "vagrant global-status --prune" to prune invalid
entries). To interact with any of the machines, you can go to that
directory and run Vagrant, or you can use the ID directly with
Vagrant commands from any directory. For example:
"vagrant destroy 1a2b3c4d"

Admin stagiaire@BBG58Y2 MINGW64 ~/vagrant
$ vagrant status
Current machine states:

default                   running (virtualbox)

The VM is running. To stop this VM, you can run `vagrant halt` to
shut it down forcefully, or you can run `vagrant suspend` to simply
suspend the virtual machine. In either case, to restart it again,
simply run `vagrant up`.

Admin stagiaire@BBG58Y2 MINGW64 ~/vagrant
$ vagrant suspend
==> default: Saving VM state and suspending execution...

Admin stagiaire@BBG58Y2 MINGW64 ~/vagrant
$ vagrant resume
==> default: Resuming suspended VM...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
==> default: Machine booted and ready!
==> default: Machine already provisioned. Run `vagrant provision` or use the `--provision`   
==> default: flag to force provisioning. Provisioners marked to run always will still run. 
```

## Vagrant destroy

**Détruit totalement la VM**

# Connexion / Authentification

## Configuration ssh

```bash
Admin stagiaire@BBG58Y2 MINGW64 ~/vagrant
$ vagrant ssh default
Welcome to Ubuntu 20.04.2 LTS (GNU/Linux 5.4.0-77-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Wed Jun 30 12:23:02 UTC 2021

  System load:  0.0               Processes:               110
  Usage of /:   3.2% of 38.71GB   Users logged in:         0
  Memory usage: 19%               IPv4 address for enp0s3: 10.0.2.15
  Swap usage:   0%


1 update can be applied immediately.
To see these additional updates run: apt list --upgradable
```

<div class=info> On se connecte automatiquement en ***ssh*** dans la machine ***default*** </div>

## Pour les connexion sur Windows

Pour Windows il n'y aura pas de ***ssh***, on utilisera les protocoles **powershell** et **rdp**.

- `vagrant powershell`
- `vagrant rdp`


# Modification de VM

## Modification VM de Test

Dans le fichier **vagrantfile**:

```ruby

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.hostname = "ubuntu-20.04"
  config.vm.network :private_network, ip: "192.168.0.50"
  
end
```

On vérifie:

```sh
Admin stagiaire@BBG58Y2 MINGW64 ~/vagrant
$ vagrant ssh default
Welcome to Ubuntu 20.04.2 LTS (GNU/Linux 5.4.0-77-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Wed Jun 30 13:27:38 UTC 2021

  System load:  0.64              Processes:               118
  Usage of /:   3.3% of 38.71GB   Users logged in:         0
  Memory usage: 18%               IPv4 address for enp0s3: 10.0.2.15
  Swap usage:   0%                IPv4 address for enp0s8: 192.168.0.50


1 update can be applied immediately.
To see these additional updates run: apt list --upgradable


Last login: Wed Jun 30 12:23:03 2021 from 10.0.2.2
```

## Création d'une nouvelle VM "demo2"

Dans le fichier `vagrantfile`:

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.hostname = "ubuntu-20.04"
  config.vm.network :private_network, ip: "192.168.0.50"
  
# Les ressources
config.vm.define "demo2" do |vm|

  vm.vm.provider "virtualbox" do |v|
    v.memory = '512'
    v.cpus = '1'
    v.name = "demo2"
  end
end


end

```

Puis on relance les VMs: `vagrant up`

![](2021-06-30-POEI-Vagrant-Packer/demo2.png)

# Validate *(linter)*

Pour assurer l'intégrité du fichier `vagrantfile`:

```sh
vagrant validate
```

# Fichier *values.yaml*

```yml
---
  box: 'ubuntu/focal64'
  hostname: 'My-Ubuntu'
  
  name: 'demo4'
  memory: '512'
  cpus: '1'
...
```


# Administration des machines précédentes


```ruby
Vagrant.configure("2") do |config|                         
                                                           
  require 'yaml'                                           
  if File.file?('values.yaml')                             
    conf = YAML.load_file('values.yaml')                
  else                                                     
    raise "Configuration file 'values.yaml' does not exist"
  end                                                      
                                                           
  config.vm.box = conf['box'] || "ubuntu/focal64"                         
  config.vm.hostname = conf['hostname'] || "ubuntu-20.04"
  
  config.vm.network :private_network, ip: "192.168.0.50" 

  if ARGV[1] and ARGV[1] != conf['name']
    conf['name'] = ARGV[1]
  end
                                                           
  # Les ressources                                         
  config.vm.define conf['name'] do |vm|                    
                                                           
    vm.vm.provider "virtualbox" do |v|                     
      v.memory = conf['memory']                            
      v.cpus = conf['cpus']                                
      v.name = conf['name']                                
    end                                                    
                                                           
  end                                                      
end 
```

Les lignes:

```ruby
  if ARGV[1] and ARGV[1] != conf['name']
    conf['name'] = ARGV[1]
  end
```
Nous permette de reprendre le contrôle sur les machines gérées précédemment et de les détruire, exemple:

`vagrant destroy demo2`