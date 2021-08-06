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



# Points à aborder

# Plan de la présentation

- Introduction contexte

1. Présentation entreprise/équipe
2. Présentation projet
3. Organisation du Projet

  3.1. Dépôt Git
  3.2. Authentification par clés SSH
  

4. Schéma fonctionnel



5. Code




6. Déploiement
7. Problèmes rencontrés & Solutions
8. Résultat
9. Améliorations prévues
10. Conclusion


+ Cahier des charges







# 1. Présentation entreprise/équipe

- Chafea Bouchenna
- David Debray
- Vincent Diard

# 2. Présentation projet

Déploiement d'une solution de documentation collaborative sous forme de micro-service.



# 3. Organisation du Projet

Organisation du projet et de l'équipe projet

## 3.1.Dépôt Git

Pour assurer le travail en équipe et le versionning des modifications tout au long du projet, nous utiliserons **Git**.

Dans notre cas [GitHub](https://github.com/): ![](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.APhboukSgOy2KVWxr2pAGAAAAA%26pid%3DApi&f=1)

- Dépot GitHub du projet: <https://github.com/vincentdiard/Entreprise2fifou.git>


## 3.2. Authentification par clés SSH

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






# 4. Schéma fonctionnel

![](2021-08-02-POEI-ProjetCapGemini/schema-infrastructure.png)



# 5. Code & Fichiers de Configuration
## 5.1 Déploiement d'une machine virtuelle depuis Ansible
## 5.2 Création d'un stack micro-service avec Docker

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

Contenu du ``docker-compose.yml``:

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




## 5.3 Déploiement d'un stack micro-service via Ansible

### 5.3.1 Prérequis *(sur le serveur Ansible)*

#### 5.3.1.1 Installation de **ansible.posix**:

```bash
ansible-galaxy collection install ansible.posix
```
 
#### 5.3.1.2 Installation du rôle ansible **Docker**

```bash
ansible-galaxy role install -r roles/requirements.yml -p roles/
- extracting ansible-role-docker__3.1.2 to /home/stagiaire/ProjetCapGemini/Entreprise2fifou/roles/ansible-role-docker__3.1.2
- ansible-role-docker__3.1.2 (3.1.2) was installed successfully
```
 Avec `requirements.yml` contenant:
 
```yaml
---
 ### Roles
## GITHUB / GALAXY
roles:
- src: 'https://github.com/geerlingguy/ansible-role-docker'
  version: '3.1.2'
  scm: git
  name: ansible-role-docker__3.1.2
...
```



#### 5.3.1.3 Installation de **community.docker**:

```bash
ansible-galaxy collection install community.docker
Process install dependency map
Starting collection install process
Installing 'community.docker:1.9.0' to '/home/stagiaire/.ansible/collections/ansible_collections/community/docker'
```


### 5.3.2 Copie de la clé publique SSH sur le client

```bash
# Preparation du bootstrap-playbook.yml
## Copie de clé
ssh-copy-id -i /home/stagiaire/.ssh/id_ed25519.pub stagiaire@192.168.3.3
## Test de connexion 
ssh stagiaire@192.168.3.3
```

#### 5.3.2.1 Bootstrap playbook

Premier déploiement du playbook `bootstrap-playbook.yml`:

```bash
ansible-playbook bootstrap_playbook.yaml -b --become-ask-pass --user=stagiaire
```

Avec `bootstrap-playbook.yml` contenant:

```yaml
---

- name: PLAY creation utilisateur ansible
  # Variabilisation de la valeur hosts (pattern) pour pouvoir la définir au lancement du play
  hosts: "{{ cible | default('all') }}"

  tasks:

    # Déclaration d'une task qui appelle le module user afin de disposer d'un user ansible
    - name: Utilisation du module user pour creer ansible
      ansible.builtin.user:
        name: ansible
        shell: /bin/bash
        # Utilisation d'une variable pour permettre une distinction du groupe désiré
        groups: "{{ grp_sudo | default('sudo') }}"
    # Déclaration d'une seconde task qui appelle le module authorized_key pour pousser une clé publique pour le user ansible
    - name: Module authorized_key pour deployer la clé publique chez ansible
      ansible.posix.authorized_key:
        user: ansible
        state: present
        key: "{{ lookup('file', '/home/stagiaire/.ssh/id_ed25519.pub') }}"
    # Déclaration d'une troisieme task pour générer un fichier de config sudo dédié au user ansible
    - name: Module copy pour s'assurer q'une fichier sudo pour ansible soit présent avec un contenu précis
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


#### 5.3.2.2 Déploiement du role Docker

```bash
ansible-playbook deploy-docker.yml -b
```

Avec `deploy-docker.yml` contenant:
```yaml
---
- name: PLAY Apelle le rôle ansible-role-docker
  hosts: "{{ cible | default('all') }}"

  roles:
    - role: ansible-role-docker__3.1.2
      become: yes
...
```


#### 5.3.2.3 Déploiement du stack micro-service

On appelle le playbook `deploy-apps.yml`:

```bash
ansible-playbook deploy-apps.yml -b
```


```yaml
---
- name: PLAY déploiement docker-compose
  hosts: davidtest
  tasks:
    - name: Installation prérequis python
      ansible.builtin.apt:
        name: ['python', 'python3-pip','python-setuptools']

    - name: Install and upgrade pip
      pip:
        name: pip
        extra_args: --upgrade
        executable: pip3
        
    - name: installation docker et docker-compose
      ansible.builtin.pip:
        name: ['docker-compose', 'docker']
        executable: pip3


    - name: checkout git
      ansible.builtin.git:
        repo: "https://github.com/davidchdebray/hedgedoc_mariadb.git"
        dest: /home/stagiaire/ProjetCapGemini/DOCUMENTATION
        force: yes
      tags: always

    - name: deploiement docker-compose
      community.docker.docker_compose:
        project_name: "HedgeDoc_MariaDB"
        project_src: /home/stagiaire/ProjetCapGemini/DOCUMENTATION
        restarted: yes
        state: present
      register: output
...
```



# 6. Déploiement

## 6.1 Création de la machine virtuelle


## 6.2 Déploiement des playbooks et du serveur Docker



## 6.3 Déploiement du stack micro-service






# 7. Problèmes rencontrés & Solutions
# 8. Résultat
# 9. Améliorations prévues

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




# 10. Conclusion




