---
title: POEI DevOps - Projet CapG
author: David DEBRAY
date: 2021-08-02
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
extensions: 'extra'
---
<link rel="icon" href="favicon.png" type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">


#### Introduction

---

## 1. Présentation entreprise/équipe

- Chafea Bouchenna
- David Debray
- Vincent Diard

## 2. Présentation projet

Déploiement d'une solution de documentation collaborative sous forme de micro-service.



## 3. Organisation du Projet

Organisation du projet et de l'équipe projet

### 3.1.Dépôt Git

Pour assurer le travail en équipe et le versionning des modifications tout au long du projet, nous utiliserons **Git**.

Dans notre cas [GitHub](https://github.com/): ![](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.APhboukSgOy2KVWxr2pAGAAAAA%26pid%3DApi&f=1)

- Dépot GitHub du projet: <https://github.com/vincentdiard/Entreprise2fifou.git>


### 3.2. Authentification par clés SSH

Pour sécurisé l'accès au dépot GitHub, nous serons authentifié par clés SSH.
Depuis la machine qui se connectera au dépot:

1. On génère la pair de clés *(privée/publique)*

```bash
ssh-keygen -t ed25519
```

2. Lecture du contenu de la clé publique

```shell
stagiaire@ansiblectl:~$ cat /home/stagiaire/.ssh/id_ed25519.pub 
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG8EhxxAC6ZHMyLQo7c+rRTPD48T/PJxb4Rn9qQNXLHl stagiaire@ansiblectl

```

## 4. Schéma fonctionnel

![schema-infrastructure.png](/hedgedoc/public/uploads/schema-infrastructure.png)

![](https://github.com/davidchdebray/hedgedoc_mariadb/blob/main/hedgedoc_uploads/schema-infrastructure.png)

![schema infrastrucutre](https://codimd.s3.shivering-isles.com/demo/uploads/upload_535a4a04f43f32f22fa1cf9319bbbe2f.png)


## 5. Code
### 5.1 Déploiement d'une machine virtuelle avec Vagrant

Fichier `Vagrantfile` permettant la création de machines virtuelles:

```ruby
## Toute commande doit-ere exécution dans le répertoire contenant le Dockerfile
# vagrant up
# vagrant halt
# vagrant destroy
# vagrant global-config
#----------------------
# vagrant ssh [NAME|ID]


#Configuration d'une VM pour un reseau donner
Vagrant.configure(2) do |config|
  #nom du reseau
  int= "Intel(R) Wireless-AC 9260 160MHz"
  #ip de la VM sur le sous reseau au  choix en 1 et 255 (***.***.*.lala)
  range = "192.168.1.25"
  # 255.2555.255.0 dans le config reseau en general (binaire >1.1.1.0)
  # on choisi le numeros de machine autre que celui de mam machine
  cidr = "26"

  [
    #nom de la box , nombre de ram (8G) , memoire disque, cpu
    ["hyperviseurcapgenano", "#{range}", "8192", "50GB", '4', "ubuntu/focal64"],
  ].each do |vmname,ip,mem,size,cpu,os|
    config.vm.define "#{vmname}" do |machine|

      machine.vm.provider "virtualbox" do |v|
        v.memory = "#{mem}"
        v.cpus = "#{cpu}"
        v.name = "#{vmname}"
        v.customize ["modifyvm", :id, "--ioapic", "on"]
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      end
      machine.vm.box = "#{os}"
      # machine.disksize.size = "#{size}"
      machine.vm.hostname = "#{vmname}"
      machine.vm.network "public_network",bridge: "#{int}",
        ip: "#{ip}",
        netmask: "#{cidr}"
      machine.ssh.insert_key = false
    end
  end
end

```



### 5.2 Création d'un stack micro-service avec Docker


```bash
stagiaire@mydeby:~/PROJECTS$ tree -aL 1 hedgedoc_mariadb/
hedgedoc_mariadb/
├── docker-compose.yml
├── .env
├── .envdatabase
├── .envhedgedoc
├── .git
├── .gitignore
├── hedgedoc_config
├── hedgedoc_uploads
├── mariadb_database
└── README.md

4 directories, 6 files
```

```yaml
version: "3"
services:
  mariadb:
    image: ghcr.io/linuxserver/mariadb:${MARIADB_IMAGE_VERSION}
    container_name: ${DATABASE_NAME}
    volumes:
      - ${DATABASE_VOLUME}:/config
    env_file: 
      - .envdatabase
    networks: 
      backend:
    restart: ${RESTART_DEFAULT}

  hedgedoc:
    image: ghcr.io/linuxserver/hedgedoc:${HEDGEDOC_IMAGE_VERSION}
    container_name: ${APP_NAME}
    depends_on:
      - mariadb
    volumes:
      - ${APP_VOLUME}:/config
      - hedgedoc_uploads:/hedgedoc/public/uploads

    env_file: 
      - .envhedgedoc
    ports:
      - "${APP_PORT_IN}:${APP_PORT_OUT}"
    networks: 
      backend:
    restart: ${RESTART_DEFAULT}


volumes:
  mariadb_database:
  hedgedoc_config:
  hedgedoc_uploads:

networks: 
  backend:
```




### 5.3 Déploiement d'un stack micro-service via Ansible

#### 5.3.1 Prérequis

##### 5.3.1.1 Installation de **ansible.posix**:

```bash
ansible-galaxy collection install ansible.posix
```
 
##### 5.3.1.2 Installation du rôle ansible **Docker**

```bash
ansible-galaxy role install -r roles/requirements.yml -p roles/
- extracting ansible-role-docker__3.1.2 to /home/stagiaire/ProjetCapGemini/Entreprise2fifou/roles/ansible-role-docker__3.1.2
- ansible-role-docker__3.1.2 (3.1.2) was installed successfully
```
 Avec `requirements.yml` contenant:
 
 ```yaml
 ### Roles
## GITHUB / GALAXY
roles:
- src: 'https://github.com/geerlingguy/ansible-role-docker'
  version: '3.1.2'
  scm: git
  name: ansible-role-docker__3.1.2
```

##### 5.3.1.3 Installation de **community.docker**:

```bash
ansible-galaxy collection install community.docker
Process install dependency map
Starting collection install process
Installing 'community.docker:1.9.0' to '/home/stagiaire/.ansible/collections/ansible_collections/community/docker'
```

#### 5.3.2







```bash
# Preparation du bootstrap-playbook.yml
## Copie de clé
ssh-copy-id -i /home/stagiaire/.ssh/id_ed25519.pub stagiaire@192.168.3.3
## Test de connexion 
ssh stagiaire@192.168.3.3
```




## 6. Déploiement

:::success
Tests + Implémentations => OK
:::

:::info
Documentation reste à rédiger
:::


## 7. Problèmes rencontrés & Solutions

:::success
Tests + Implémentations => OK
:::

:::info
Documentation reste à rédiger
:::


## 8. Résultat

:::success
Vous êtes actuellement témoin du résultat :+1: 
:::


## 9. Sécurité des images Docker

## 9.1 Analyse de vulnérabilités *(en cours)*

Nous réalisons l'analyse de vulnérabilité de nos images Docker grâce à [**trivy**](https://www.aquasec.com/products/trivy/)

![](https://aquasecurity.github.io/trivy/v0.19.2/imgs/logo.png)

> `Trivy` (`tri` pronounced like trigger, `vy` pronounced like envy) is a simple and comprehensive [vulnerability](https://aquasecurity.github.io/trivy/v0.19.2/vulnerability/scanning/)/[misconfiguration](https://aquasecurity.github.io/trivy/v0.19.2/misconfiguration/) scanner for containers and other artifacts. A software vulnerability is a glitch, flaw, or weakness present in the software or in an Operating System. `Trivy` detects vulnerabilities of [OS packages](https://aquasecurity.github.io/trivy/v0.19.2/vulnerability/detection/os/) (Alpine, RHEL, CentOS, etc.) and [language-specific packages](https://aquasecurity.github.io/trivy/v0.19.2/vulnerability/detection/language/) (Bundler, Composer, npm, yarn, etc.). In addition, `Trivy` scans [Infrastructure as Code (IaC) files](https://aquasecurity.github.io/trivy/v0.19.2/misconfiguration/iac/) such as Terraform and Kubernetes, to detect potential configuration issues that expose your deployments to the risk of attack. `Trivy` is easy to use. Just install the binary and you're ready to scan. All you need to do for scanning is to specify a target such as an image name of the container.

![](https://aquasecurity.github.io/trivy/v0.19.2/imgs/overview.png)


Tutoriel: <https://www.geekmunity.fr/?p=1804>


### 9.1.2 Choix de(s) image(s) à analyser

D'abord il s'agit de choisir le conatiner à analyser. Pour lister l'ensemble des images disponibles:

```bash
docker image ls --all
```

On obtient:

![](2021-08-02-POEI-ProjetCapGemini/2021-08-06_10h43_04.png)

Les 2 images qui nous intéresse pour le moment sont:

```bash
REPOSITORY                                                         TAG           IMAGE ID       CREATED        SIZE
ghcr.io/linuxserver/hedgedoc                                       latest        ecc1e7056f47   6 days ago     584MB
ghcr.io/linuxserver/mariadb                                        latest        280679d1098c   6 days ago     352MB

```

### 9.1.3 Téléchargement & Execution *Live* de **Trivy**

Pour lancer un scan de vulnérabilité sur une image, utiliser la syntaxe suivante:

```bash
docker run aquasec/trivy ghcr.io/linuxserver/hedgedoc:latest | less
```

##### Résultat

![](2021-08-02-POEI-ProjetCapGemini/2021-08-06_10h54_33.gif)


### 9.1.4 Log des vulnérabilités


Ici on récupère les informations de vulnérabilités dans un fichier de logs associé:

```bash
docker run aquasec/trivy ghcr.io/linuxserver/hedgedoc:latest > auditsec_HedgeDoc_APP.log

```

##### Résultat

![](2021-08-02-POEI-ProjetCapGemini/2021-08-06_11h04_50.gif)


### 9.1.5 Autres Options
#### 9.1.5.1 Scan par type 

On peut également scanner par type de vulnérabilités, exemple avec CRITICAL:

```bash
docker run aquasec/trivy --severity CRITICAL ghcr.io/linuxserver/hedgedoc:latest  | less

```
##### Résultat

![](2021-08-02-POEI-ProjetCapGemini/2021-08-06_11h26_33.png)



### 9.1.3 Scan d'un service

Installation de `Trivy` sur le serveur **ansiblectl**. 

Pour faire cette installation nous utiliserons un script, dont est la bes est disponible sur le site: <https://aquasecurity.github.io/trivy/v0.19.2/getting-started/installation/>.

Contenu du script `install_trivy.sh`:

```bash
sudo apt-get install wget apt-transport-https gnupg lsb-release -y
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update -y
sudo apt-get install trivy -y

```

On peut scanner les vulnérabilités d'un service *(serveur:port)*:

```bash
trivy server --listen 192.168.3.3:3000

```


# 10. Intégration continue

## Pipeline n°1 HedgeDoc_MariaDB

Contenu du fichier `.gitlab-ci.yml`:


```yaml

---
  image: tmaier/docker-compose

  stages:
    - build
    - test
    - deploy
  before_script:
    - >
      echo "$CI_REGISTRY_PASSWORD" | 
      docker login $CI_REGISTRY 
      -u $CI_REGISTRY_USER 
      --password-stdin
  services:
    - docker:dind

  test:
    stage: test
    script:
      - docker-compose -f docker-compose.yml up -d
      - sleep 15
      - docker-compose -f docker-compose.yml ps | grep -o "(healthy)"

    rules:
      - changes:  # Déclenché uniquement quand docker-compose.yml est modifié
        - docker-compose.yml

...

```


## Pipeline n°2: ESN_3

:::warning
Pas encore implémenté
:::

# Reste à faire

- [ ] Monitoring Prometheus & Grafana

![](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.EnUfFN7C8Vfaep5DPRq6HQHaEc%26pid%3DApi&f=1)

---


- [ ] Surveillance des logs avec le Stack ELK *(ElasticSearch, Logstash, Kibana)*

![](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Flogz.io%2Fwp-content%2Fuploads%2F2018%2F08%2Fimage21-1024x328.png&f=1&nofb=1)

---


- [ ] Intégration continue des différents composants, y compris:
    - [ ] tests de sécurité automatisés des images Docker

![](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fblog.callr.tech%2Fgitlab-ansible-docker-ci-cd%2Fgitlab-docker-ansible.png&f=1&nofb=1)










