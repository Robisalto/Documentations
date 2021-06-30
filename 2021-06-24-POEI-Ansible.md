---
title: POEI DevOps - Docker
author: 
date: 2021-06-21
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
extensions: 'extra'
---
<link rel="icon" href="favicon.png" type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script>getQuote(); $(document).ready(function() { $("#getMessage").on("click", function(){ getQuote(); }); }); function getQuote() { $.getJSON("https://api.forismatic.com/api/.0/?method=getQuote&format=jsonp&lang=en&jsonp=?", function(data) { $('#quote').html(data.quoteText); $('#author').html(data.quoteAuthor); $('#tweetQuote').attr('href', 'https://twitter.com/intent/tweet?text=' + data.quoteText + '- ' + data.quoteAuthor).attr('target','_blank'); }) }</script>

<!-- <script>myscripts.js</script> -->


#### Formation Docker: Initiation

Pierre Sablé, Formateur & Administrateur Systèmes Linux - DevOps.
21H du 21/06/21 au 23/06/21

Tel : 07.63.88.76.21
(<psable@dawan.fr>)

---

# Doc Source

Documentation Source en PDF:

<iframe src="2021-06-21-POEI-Docker/Formation_Docker-Pierre_SABLE.pdf" width="100%"  height="320px" allowfullscreen="yes"></iframe>

## Containers

<div class=info> ***Docker*** utilise l'OS hôte, dans le cas de Linux peut importe la distribution c'est **le noyau** qui est utilisé. </div>

## Lien GitLab

<https://gitlab.com/pierre.sable/poec_devops_docker>

## Autres liens utiles

- <https://docs.docker.com/>

---

# Premiers pas

## Installation

Passage en **root**:

```bash
su - # Passe en root et "-" permet de charger l'environnement
```

Mise à jour du serveur et installation de `curl`:

```bash
apt update -y && apt install curl -y
```

Lancement du convinience script  d'installation de Docker:

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```

On vérifie l'installation avec:

```bash
docker -version
```

On ajoute l'utilisateur au groupe:

```bash
usermod -aG sudo stagiaire
```

## 4 objets

- Image
- Container
- Network
- Volume

##### 1. **Image**:

```bash
stagiaire@debian:~$ docker image --help

Usage:  docker image COMMAND

Manage images

Commands:
  build       Build an image from a Dockerfile
  history     Show the history of an image
  import      Import the contents from a tarball to create a filesystem image
  inspect     Display detailed information on one or more images
  load        Load an image from a tar archive or STDIN
  ls          List images
  prune       Remove unused images
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rm          Remove one or more images
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
```

##### 2. **Container**:

```bash
stagiaire@debian:~$ docker container --help

Usage:  docker container COMMAND

Manage containers

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  commit      Create a new image from a container s changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container s filesystem
  exec        Run a command in a running container
  export      Export a container's filesystem as a tar archive
  inspect     Display detailed information on one or more containers
  kill        Kill one or more running containers
  logs        Fetch the logs of a container
  ls          List containers
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  prune       Remove all stopped containers
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  run         Run a command in a new container
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  wait        Block until one or more containers stop, then print their exit codes

Run 'docker container COMMAND --help' for more information on a command.
```

##### 3. **Network**:

```bash
stagiaire@debian:~$ docker network --help

Usage:  docker network COMMAND

Manage networks

Commands:
  connect     Connect a container to a network
  create      Create a network
  disconnect  Disconnect a container from a network
  inspect     Display detailed information on one or more networks
  ls          List networks
  prune       Remove all unused networks
  rm          Remove one or more networks

Run 'docker network COMMAND --help' for more information on a command.
```

##### 4. **Volume**:

```bash
stagiaire@debian:~$ docker volume --help

Usage:  docker volume COMMAND

Manage volumes

Commands:
  create      Create a volume
  inspect     Display detailed information on one or more volumes
  ls          List volumes
  prune       Remove all unused local volumes
  rm          Remove one or more volumes

Run 'docker volume COMMAND --help' for more information on a command.
```

## Recherche d'images

On peut faire une recherche avec la commande `search`:

```bash
docker search nginx
```

Plus simple, se rendre sur **Docker Hub**: <https://hub.docker.com/search?q=&type=image&operating_system=linux&image_filter=official>

```bash
docker pull ubuntu # Téléchargement de l'image officielle d'Ubuntu

OU:
docker image pull # Même chose mais plus longue et on est des fainéants ^^
```

On vérifie avec:

```bash
docker image ls
```

## Instanciation d'un conteneur

##### 1. Première commande

On lance une instance de container avec:

```bash
docker image run ubuntu:latest

# Pour vérifier:
docker container ls -a
CONTAINER ID   IMAGE           COMMAND   CREATED          STATUS                      PORTS     NAMES
a6d535e838cc   ubuntu:latest   "bash"    42 seconds ago   Exited (0) 41 seconds ago             flamboyant_mayer
```

<div class=info> La commande `docker container ls` n'affiche que les containers **actifs**. </div>

##### 2. Seconde commande : utilisation image ubuntu:latest pour réaliser la commande "echo..."

```bash
docker container run ubuntu:latest /bin/echo "Hello formation docker"```


##### 3. Troisieme commande : creation d'un conteneur et se connecter dedans
```bash
docker container run -it ubuntu:latest /bin/bash
root@1ba3cc134814:/#
root@1ba3cc134814:/# apt update
root@1ba3cc134814:/# apt install iproute2
```

## CONCEPT IMAGE => CONTENEUR

<div class=warning> Une image est immuable (R/O) </div>

Un conteneur intancié ouvre le contenu d'une image mais ne modifie pas directement une image par la suite. Il écrit dans une layer R/W.

Si un conteneur est supprimé, sa layer R/W aussi

Un conteneur s'éteind lorsqu'il n'y a plus aucun processus actif à l'intérieur

<div class=info> **On ne modifie jamais une image existante**, par contre on peut générer une nouvelle image à partir de celle que l'on a modifié. </div>

# Commandes utiles

## Pour faciliter le déploiement de containers

- `--name`: permet d'assigner un nom au container.

- `-d`: Mode détaché, se lance dans le *background*, ce qui permet de continuer à utiliser le terminal.

- `-p`: Permet d'assigner un port particulier.

<div class=warning> Si on ne publie pas le port, le container ne sera pas accessible. </div>

## Nettoyage globale des conteneurs arrêtés

```bash
docker container prune
```

# Utilisation d'une image applicative nginx

##### 1.Premier déclenchement :

```bash
docker container run nginx:1.20-alpine
```

Si l'image demandée n'est présente localement, docker la télécharge depuis le docker hub par défaut (pull)

L'image applicative de type webserver nginx a prévu de lancer un processus nginx qui ne s'arrête pas : donc le conteneur reste up tant que le processus n'est pas killé

##### 2. Instanciation du conteneur en mode detaché : option **-d**

```bash
docker container run -d --name mynginx nginx:1.20-alpine
a51a7b4f164a9ad3988bb5b4004a5ee13cc44452a825688f5ab304bfe1ae4233
docker container ls
```

Le conteneur est instancié, reste up (visiblement un processus reste actif à l'intérieur) ET le mode detach nous a rendu la main (donc pas de kill)

##### 3. Executer une commande dans un conteneur démarré (up) : **exec**

```bash
docker container exec mynginx cat /etc/nginx/conf.d/default.conf
```

##### 4. Se connecter dans un conteneur démarré:

```bash
docker container exec -it mynginx /bin/sh
```

```bash
docker container run -d --name mynginx2 -p 8080:80 nginx:1.20-alpine
```

Sur le lien: <http://192.168.1.42:8080>



##### 5. Mise en réseau de notre conteneur applicatif :

Il manque une mise en réseau pour que les utilisateurs externes puissent, au travers de l'interface enp0s8 du docker hôte, être redirigés automatiquement dans le conteneur conteneur applicatif


publication de port : <https://docs.docker.com/config/containers/container-networking/>

```bash
docker container rm -f mynginx
docker container run -d --name mynginx -p 8080:80 nginx:1.20-alpine
```


On modifie le fichier `/usr/share/nginx/html/index.html`:

```html
<!DOCTYPE html>
<html>
<head>
<title>Bienvenue sur mon site DOCKER ^^!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Bienvenue sur nginx DOCKER !</h1>
<p> Une peu de text, pour faire style... </p>
<p><em>Hasta la vista !.</em></p>
</body>
</html>
```

Puis sur le site:

![](2021-06-21-POEI-Docker/nginx_index.png)


<div class=warning> Si on détruit le container on perdra tous les changements !!! </div>

---


# Notion de **Volume**

![](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.howtoforge.com%2Fimages%2Fdocker-how-to-use-it-in-a-practical-way-part-3%2Fbig%2Fpic_7.jpg&f=1&nofb=1)


## Volume de type bind

 => présentation de fichiers externes (non présent dans l'image) à un conteneur. 

<div class=warning> Le contenu du bind est statique. Le container ne peux pas écrire dans le bind. </div>

 ![](https://docs.docker.com/storage/images/types-of-mounts-bind.png)

- 1-1) Détruire le conteneur mynginx
- 1-2) Instancier le conteneur en ajoutant l'option de bind de volume :

```bash
-v /home/stagiaire/formationdocker/html/index.html:/usr/share/nginx/html/index.html
```

Pour faire un **bind** de volume on utilise l'option `-v`:

```bash
stagiaire@debian:~/formation-docker$ docker container rm -f mynginx2 
mynginx2
stagiaire@debian:~/formation-docker$ docker container run -d --name mynginx2 -v /home/stagiaire/formation-docker/html/index.html:/usr/share/nginx/html/index.html -p 8080:80 nginx:1.20-alpine
f8fbbb79149ab1862600d61b6d1d62b3092a20c98da468be320599f54e8847a3
```

- 1) Le volume local *(data)*:

```bash
/home/stagiaire/formation-docker/html/index.html
```

- 2) Le volume distant *(data)*:

```bash
/usr/share/nginx/html/index.html
```


## Volume de type ***"volume"***: 

Le type ***volume*** permet de fournir un stockage en écriture aussi bien que lecture. Permettant de gérer les données générées par les containers.




# Isolation 

<div class=warning> Par défaut les containers peuvent tous communiquer entre eux. Ils ne sont pas isolés au niveau réseau... Il faut donc mettre en place une isolation par défaut ! </div>

## Concept  de **Network**

```bash
docker network ls
```

- Réseau de type **bridge** : par défaut (les conteneurs instanciés appartiennet à ce réseau)


- Réseau **host** : on obtient la même configuration que le docker hote (cas particulier)

```bash
docker container run --network host alpine ip a
```

- Réseau **none**: pas d'interfaces réseau dans le conteneur

```bash
docker container run --network none alpine ip a
```


### Création d'un Network

```bash
stagiaire@debian:~/formation-docker$ docker network create mynetwork
989ccbdb35483bac542dbef0375eafc4fc5c160c8eb5dbed642f3da940bbbcdc
stagiaire@debian:~/formation-docker$  docker network inspect mynetwork
[
    {
        "Name": "mynetwork",
        "Id": "989ccbdb35483bac542dbef0375eafc4fc5c160c8eb5dbed642f3da940bbbcdc",
        "Created": "2021-06-22T14:40:37.593317488+02:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {},
        "Options": {},
        "Labels": {}
    }
]
```

### Instanciation d'un conteneur dans ce network

```bash
docker container rm -f mynginx
docker container run -d --name mynginx -p 8080:80 -v /home/stagiaire/formation-docker/html/index.html:/usr/share/nginx/html/index.html --network mynetwork nginx:1.20-alpine
```



# Inspection d'un objet Docker

Pour visualiser les informations d'un objet Docker on utilise `inspect`.

- Pour un **Container**:

```bash
docker container inspect mynginx
```

- Pour un **Network**:

```bash
docker network inspect mynetwork
```


# TP 

## TP Perso

- 3 Containers: **nginx**, **php** et **MariaDB**

- 1 Network Bridge

Le réseau **mynetwork** et le container ***nginx*** ont été créés précédemment.
Rappel des commandes:

```bash
docker network create mynetwork
```

Et pour le container:

```bash
docker container run -d --name mynginx -p 8080:80 -v /home/stagiaire/formation-docker/html/index.html:/usr/share/nginx/html/index.html --network mynetwork nginx:1.20-alpine
```


### Création des Containers

#### myphp

```bash
docker pull php

docker container run -t -d --name myphp -p 8081:80 -v /home/stagiaire/formation-docker/php:/usr/share/php --network mynetwork php:latest
```


#### mymariadb

```bash
docker pull php

docker container run -t -d --name mymariadb -p 8081:80 -v /home/stagiaire/formation-docker/mariadb:/usr/share/mariadb --network mynetwork mariadb:latest
```













![](2021-06-21-POEI-Docker/Diagramme_microservice.png)





## TP de Pierre

***Sujet:***

> **1. Instancier un conteneur myphp, voici les paramètres attendus :**
> 
> - name: myphp
> - detach
> - network : mynetwork
> - volume : -v /chemin/TP_Appli_microservice/php:/srv/http
> - image : phpdockerio/php73-fpm
> 
> **2. Détruire le conteneur mynginx**
> 
> **3. Créer le conteneur mynginx avec les paramètres suivants :**
> 
> - name: mynginx
> - detach
> - network : mynetwork
> - volume : -v /chemin/TP_Appli_microservice/conf/nginx.conf:/etc/nginx/conf.d/default.conf
> - publication port : 8080:80
> - image : nginx:1.20-alpine
> 


### Fichiers de configuration

##### 1. Création des dossiers et fichiers de configuration:


```bash
mkdir -p TP_Appli_microservice/conf && touch TP_Appli_microservice/conf/nginx.conf
mkdir -p TP_Appli_microservice/php && touch TP_Appli_microservice/php/index.php

# Vérification
stagiaire@debian:~$ tree TP_Appli_microservice/
TP_Appli_microservice/
├── conf
│   └── nginx.conf
├── mysql
│   └── database.sql
└── php
    └── index.php
```

Contenu de ***nginx.conf***:

```bash
# nginx.conf
server {
  index index.php index.html;
  error_log  /var/log/nginx/error.log;
  access_log /var/log/nginx/access.log;
  location / {
      try_files $uri $uri/ /index.php?$query_string;
  }

  location ~* \.php$ {
    fastcgi_index   index.php;
    fastcgi_pass    myphp:9000;
    include         fastcgi_params;
    fastcgi_param   SCRIPT_FILENAME    /srv/http$fastcgi_script_name;
    fastcgi_param   SCRIPT_NAME        $fastcgi_script_name;
  }
}
```

Contenu de ***index.php***:

```bash
# php/index.php
<?php
 echo "<h1> Hello from DOCKER PHP formation 2021</h1>";
 echo "<h1>Hello World from PHP7-FPM</h1>";
 echo 'Version PHP courante : ' . phpversion();
?>
```

### Création & Démarrage des Containers

##### 1. Instancier un conteneur myphp, voici les paramètres attendus :


- name: myphp
- detach
- network : mynetwork
- volume : -v /chemin/TP_Appli_microservice/php:/srv/http
- image : phpdockerio/php73-fpm

```bash
docker container run -d --name myphp -v /home/stagiaire/TP_Appli_microservice/php:/srv/http --network mynetwork phpdockerio/php73-fpm
```

##### 2. Détruire le conteneur mynginx

```bash
docker container rm -r mynginx
```

##### 3. Créer le conteneur mynginx avec les paramètres suivants :


- name: mynginx
- detach
- network : mynetwork
- volume : -v /chemin/TP_Appli_microservice/conf/nginx.conf:/etc/nginx/conf.d/nginx.conf
- publication port : 8080:80
- image : nginx:1.20-alpine

```bash
docker container run -d --name mynginx -p 8080:80 -v /home/stagiaire/TP_Appli_microservice/conf/nginx.conf:/etc/nginx/conf.d/default.conf --network mynetwork nginx:1.20-alpine
```



### Ajout d'un container MariaDB

##### 1. Télécharger l'image mariadb:10.5

```bash
docker pull mariadb:10.5
```

##### 2. Instancier un conteneur à partir de cette image :

- name: mybdd
- network: mynetwork
- Root password DB: mot_de_pass_bdd

```bash
docker container run -t -d --name mybdd -e MARIADB_ROOT_PASSWORD=mot_de_pass_bdd --network mynetwork mariadb:10.5
```

##### 3. Utiliser exec pour se connecter dans le conteneur puis exécuter la commande "mysql -u root -p"

```bash
stagiaire@debian:~/TP_Appli_microservice/php$ docker exec -it mybdd mysql -uroot -pmot_de_pass_bdd

Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 6
Server version: 10.5.10-MariaDB-1:10.5.10+maria~focal mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> 
```

##### 4. Quitter le conteneur

On quitte avec `quit`.

##### 5. Lister les objets docker de type volume, que contatez vous ?

Nouveau volume crée:
```bash
docker volume ls
DRIVER    VOLUME NAME
local     9c23ae437072a0361927652a47e8f0dfe9a6bbfd7193086b8d3c1a6198989d3e
```



### Ajout de code php pour connexion au micro-service mybdd

##### 1. On constate un pb de driver :

![](2021-06-21-POEI-Docker/php_driver_error.png)

##### 2. Installation driver

il manque un package dans l'image phpdockerio, Réaliser l'install du package php7.3-mysql en live dans le conteneur myphp :

TIPS : exec, it
apt update
apt install php7.3-mysql

```bash
docker exec -it myphp /bin/sh
apt update -y
apt upgrade -y
apt install php7.3-mysql -y
exit
```

```bash
# Redémarrage myphp
docker container restart myphp 
myphp
stagiaire@debian:~$ docker ps
CONTAINER ID   IMAGE                   COMMAND                  CREATED          STATUS          PORTS                                   NAMES
5bee52301b26   mariadb:10.5            "docker-entrypoint.s…"   11 minutes ago   Up 11 minutes   3306/tcp                                mybdd
8301bc85d472   nginx:1.20-alpine       "/docker-entrypoint.…"   18 hours ago     Up 18 hours     0.0.0.0:80->80/tcp, :::80->80/tcp       mynginx2
cbbb3e3804de   nginx:1.20-alpine       "/docker-entrypoint.…"   18 hours ago     Up 18 hours     0.0.0.0:8080->80/tcp, :::8080->80/tcp   mynginx
0e16e140daa6   phpdockerio/php73-fpm   "/usr/sbin/php-fpm7.…"   18 hours ago     Up 4 seconds    9000/tcp                                myphp
```


Résultat:

![](2021-06-21-POEI-Docker/php_driver_ok.png)



### Changement de type de volume

Pour que MariaDB puisse écrire dans le stockage on passe sur un **volume** au lieu d'un **bind**.

Doc: <https://docs.docker.com/engine/reference/commandline/volume_create/>

##### 1. Destruction de mybdd

```bash
docker rm mybdd -f
```

##### 2. Création du volume

```bash
docker volume create myvolume
```

##### 3. Création container ***mybdd*** avec montage du volume

```bash
docker container run -d --name mybdd --network mynetwork -e MARIADB_ROOT_PASSWORD=mot_de_pass_bdd -v myvolume:/var/lib/mysql mariadb:10.5
```

Résultat:

```bash
stagiaire@debian:~/TP_Appli_microservice$ docker ps
CONTAINER ID   IMAGE                   COMMAND                  CREATED          STATUS          PORTS                                   NAMES
35023a4181be   mariadb:10.5            "docker-entrypoint.s…"   15 seconds ago   Up 14 seconds   3306/tcp                                mybdd
8301bc85d472   nginx:1.20-alpine       "/docker-entrypoint.…"   18 hours ago     Up 18 hours     0.0.0.0:80->80/tcp, :::80->80/tcp       mynginx2
cbbb3e3804de   nginx:1.20-alpine       "/docker-entrypoint.…"   18 hours ago     Up 18 hours     0.0.0.0:8080->80/tcp, :::8080->80/tcp   mynginx
0e16e140daa6   phpdockerio/php73-fpm   "/usr/sbin/php-fpm7.…"   18 hours ago     Up 31 minutes   9000/tcp                                myphp
stagiaire@debian:~/TP_Appli_microservice$ docker inspect mybdd | grep volume
                "myvolume:/var/lib/mysql"
                "Type": "volume",
                "Name": "myvolume",
                "Source": "/var/lib/docker/volumes/myvolume/_data",
 
```

Les containers sont dans le même réseau ***mynetwork***, donc ils peuvent communiquer:

```bash
stagiaire@debian:~/TP_Appli_microservice$ docker exec -ti mynginx /bin/sh
/ # ping mybdd
PING mybdd (172.18.0.5): 56 data bytes
64 bytes from 172.18.0.5: seq=0 ttl=64 time=0.063 ms
64 bytes from 172.18.0.5: seq=1 ttl=64 time=0.056 ms
^C
--- mybdd ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss
round-trip min/avg/max = 0.056/0.059/0.063 ms
```





### Générer une nouvelle image php qui contient nos modifs

<div class=warning> Nos modifs réalisées dans le conteneur myphp sont par défaut éphemeres. </div>


Il faut prendre en compte ces modifs en cas de destruction du conteneur : **PRA**


Plusieurs solutions :

- Construire sa propre image
- Générer une nouvelle image à partir du conteneur existant


Commit :
```bash
docker container commit -a "Pierre" -m "Ajout package php7.3-mysql" myphp php7.3-mysql:1.0
docker image ls
```





# Docker File

## Best Pratices

Voir: [Intro Guide to Dockerfile Best Practices](https://www.docker.com/blog/intro-guide-to-dockerfile-best-practices/)

Sur Docs.Docker: [Best pratices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

![](2021-06-21-POEI-Docker/dockerfile.png)


<div class=info> Pour optimiser la construction des containers (temps et énergie), il faut optimiser l'utilisation du cache.

Respecter *(sauf si nécessaire)* les pratiques suivantes.
 </div>

##### Tip #1: Order matters for caching

![](https://i1.wp.com/www.docker.com/blog/wp-content/uploads/2019/07/ef41db8f-fe5e-4a78-940a-6a929db7929d-1.jpg?ssl=1)

##### Tip #2: More specific COPY to limit cache busts

![](https://i1.wp.com/www.docker.com/blog/wp-content/uploads/2019/07/0c1d0c4e-406c-468c-b6ba-b71ac68b9c84.jpg?ssl=1)

##### Tip #3: Identify cacheable units such as apt-get update & install

![](https://i2.wp.com/www.docker.com/blog/wp-content/uploads/2019/07/2322a39e-bd7e-4a2b-9a8f-548a97dbacb4.jpg?ssl=1)

##### Tip #4: Remove unnecessary dependencies

![](https://i0.wp.com/www.docker.com/blog/wp-content/uploads/2019/07/a1b36f64-1a30-45bf-8fcd-4f88437c189e.jpg?ssl=1)

##### Tip #5: Remove package manager cache

![](https://i2.wp.com/www.docker.com/blog/wp-content/uploads/2019/07/363961a4-005e-46fc-963b-f7b690be12ef.jpg?ssl=1)

##### Tip #6: Use official images when possible

![](https://i2.wp.com/www.docker.com/blog/wp-content/uploads/2019/07/f336014d-d2aa-4c1b-a2bd-e1d5d6ed0d93.jpg?ssl=1)

##### Tip #7: Use more specific tags

![](https://i1.wp.com/www.docker.com/blog/wp-content/uploads/2019/07/9d991da9-bdb9-4108-8b36-296a5a3772aa.jpg?ssl=1)

##### Tip #8: Look for minimal flavors

![](https://i1.wp.com/www.docker.com/blog/wp-content/uploads/2019/07/6c486200-5198-4457-86c0-b5275e70e699.jpg?ssl=1)

##### Tip #9: Build from source in a consistent environment

![](https://i0.wp.com/www.docker.com/blog/wp-content/uploads/2019/07/f393ad07-c25d-4241-a40f-c6168e0ba4dd.jpg?ssl=1)

##### Tip #10: Fetch dependencies in a separate step

![](https://i0.wp.com/www.docker.com/blog/wp-content/uploads/2019/07/41ea71ce-11c3-42a3-8d2b-05fe20901745.jpg?ssl=1)

##### Tip #11: Use multi-stage builds to remove build dependencies (recommended Dockerfile)

![](https://i2.wp.com/www.docker.com/blog/wp-content/uploads/2019/07/97ec1992-f0df-4c8f-82a0-e177c230e5c5.jpg?ssl=1)



## TP Dockerfile TOMCAT

### Sujet

**Exercice 1 : Sample tomcat war**

Le but de ce TP est de construire un Dockerfile qui permettra de generer une image docker tomcat avec une application war intégrée

1. Creer un répertoire de projet TP_Dockerfile_Tomcat
2. Dans ce répertoire projet (microservice) créer un fichier Dockerfile
3. Voici le schéma directeur à suivre :
  -  Partir d'une image de base : centos:8
  - Préciser des labels (idéal pour donner des informations lors d'un docker image inspect)
  - Installer le package java (via yum): ```yum install -y java-11-openjdk```

-  Créer un répertoire /opt/tomcat: ```mkdir```

- Récupérer un fichier distant : https://downloads.apache.org/tomcat/tomcat-8/v8.5.61/bin/apache-tomcat-8.5.61.tar.gz
  
```curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.61/bin/apache-tomcat-8.5.61.tar.gz```

- Décompresser l'archive puis déplacer tous le contenu de apache-tomcat-8.5.61 dans /opt/tomcat/
  
```bash
tar -zxf apache-tomcat-8.5.61.tar.gz
mv apache-tomcat-8.5.61/* /opt/tomcat/
```
    
-  Utiliser la directive **WORKDIR** pour se positionner dans le répertoire "/opt/tomcat/webapps"
-  Récuperer le fichier distant https://tomcat.apache.org/tomcat-8.0-doc/appdev/sample/sample.war
  
```curl -O -L```

- Exposer (rendre visible) le port par défaut tomcat 8080
- Préciser la commande finale à exécuter : ENTRYPOINT ["/opt/tomcat/bin/catalina.sh"]
- Préciser l'argument à donner par défaut derrière la commande ENTRYPOINT : CMD ["run"]

----
> Idéalement : Essayer de minimiser le nombre de Layers !!

----

1. Construire une image nommée  tomcat:8.5.61 à partir de ce Dockerfile
2. Démarrer un nouveau conteneur à partir de cette image :
- Il faut publier un port !!! (pour acceder au conteneur depuis le docker hôte)
- Il faudra sans doute le démarrer en mode "détaché"
- Idéalement on lui donne un nom pour le manager plus facilement
3. Tester l'accès depuis un navigateur sur le docker hôte
> http://{ip_docker_hote}:8080/sample


### Réponse

<div class=info> Pendant la construction du Dockerfile, on peut faire tester et vérifier que les commandes utilisées fonctionnent correctement en créant un container de test.

Pour cela on utilise la commande suivante:

`docker container run --name TestingBuild_CentOS8 -it --rm centos:8 /bin/bash`

</div>


#### Contenu du dockerfile:

```dockerfile
# Instruction FROM: image parente de base
# Permet d'avoir un ensemble de commandes à dispo pour ajouter du contenu
FROM centos:8

# Metadata, pour donner des infos sur l'uteur, la version, etc.
LABEL maintainer="David.D"
LABEL description="Image TOMCAT avec application intégrée"

# Intruction pour lancer une commande: RUN
RUN yum install -y java-11-openjdk

RUN mkdir /opt/tomcat \ 
    && curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.68/bin/apache-tomcat-8.5.68.tar.gz \
    && tar -zxf apache-tomcat-8.5.68.tar.gz \
    && mv apache-tomcat-8.5.68/* /opt/tomcat/

# Instruction WORKDIR, positionne le shell dans le répertoire désiré (équivalent d'un "cd")
WORKDIR /opt/tomcat/webapps

RUN curl -O -L https://tomcat.apache.org/tomcat-8.0-doc/appdev/sample/sample.war

# Exposer le port par défaut tomcat 8080
EXPOSE 8080

# Instruction CMD : commande finale qui executer quand un conteneur sera instancié à partir de cette image
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

```

#### Construction de l'image

Si on est **dans le répertoire**:
```bash
docker image build -t tomcat:8.5.68 .
```

Sinon:
```bash
docker image build -t tomcat:8.5.68 
```
Vérifiaction:

```bash
stagiaire@debian:~/TP_Dockerfile_TOMCAT$ docker image ls
REPOSITORY                                                         TAG           IMAGE ID       CREATED         SIZE
tomcat                                                             8.5.68        a86f14cd4c6a   5 minutes ago   553MB
```

```bash
stagiaire@debian:~/TP_Dockerfile_TOMCAT$ docker image history tomcat:8.5.68 
IMAGE          CREATED          CREATED BY                                      SIZE      COMMENT
a86f14cd4c6a   6 minutes ago    /bin/sh -c #(nop)  CMD ["/opt/tomcat/bin/cat…   0B        
0d31df62d259   6 minutes ago    /bin/sh -c #(nop)  EXPOSE 8080                  0B        
83d01bcdb9bf   6 minutes ago    /bin/sh -c curl -O -L https://tomcat.apache.…   4.61kB    
86d48a23f357   6 minutes ago    /bin/sh -c #(nop) WORKDIR /opt/tomcat/webapps   0B        
792f38315a18   6 minutes ago    /bin/sh -c mkdir /opt/tomcat     && curl -O …   25.3MB    
4feabfba402c   7 minutes ago    /bin/sh -c yum install -y java-11-openjdk       318MB     
ddceba74ddf8   10 minutes ago   /bin/sh -c #(nop)  LABEL description=Image T…   0B        
f31e4bddaac1   10 minutes ago   /bin/sh -c #(nop)  LABEL maintainer=David.D     0B        
300e315adb2f   6 months ago     /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B        
<missing>      6 months ago     /bin/sh -c #(nop)  LABEL org.label-schema.sc…   0B        
<missing>      6 months ago     /bin/sh -c #(nop) ADD file:bd7a2aed6ede423b7…   209MB  
```


#### Démarrer un nouveau conteneur à partir de cette image :

- Il faut publier un port !!! (pour acceder au conteneur depuis le docker hôte)
- Il faudra sans doute le démarrer en mode "détaché"
- Idéalement on lui donne un nom pour le manager plus facilement


```bash
docker container run -d --name mytomcat -p 8082:8080 tomcat:8.5.68

stagiaire@debian:~/TP_Dockerfile_TOMCAT$ docker ps
CONTAINER ID   IMAGE                   COMMAND                  CREATED          STATUS          PORTS                                       NAMES
a450d3be32d4   tomcat:8.5.68           "/opt/tomcat/bin/cat…"   14 seconds ago   Up 13 seconds   0.0.0.0:8082->8080/tcp, :::8082->8080/tcp   mytomcat
```

Sur : <http://{ip_docker_hote}:8080/sample>

![](2021-06-21-POEI-Docker/tomcat_working.png)





<div class=warning> Dans le cas où l'on doit télécharger des fichiers, si le lien ne change pas, la construction utilisera le cache même si le contenu à télécharger à été modifié !

Pour forcer la construction de l'image sans cache, on utilisera l'option `--no-cache`.

Attention ceci est une source d'erreurs !!!
 </div>



# Docker Compose

## Installation de Docker Compose

Voir: <https://docs.docker.com/compose/install/>

Installation du paquet:
```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

Attribution des droits:
```bash
sudo chmod +x /usr/local/bin/docker-compose
```

Création des fichiers:
```bash
stagiaire@debian:~$ tree Docker-compose/
Docker-compose/
├── conf
│   └── nginx.conf
├── docker-compose.yml
└── php
    └── index.php

2 directories, 3 files
```

## Fichier: docker-compose.yml

### Déclaration uniquement pour ***mybdd***:

```yml
version: "2.4"

services: 
    mybdd: 
        image: mariadb:10.5
        networks: 
            - mynetwork
        environment: 
            MARIADB_ROOT_PASSWORD: mot_de_pass_bdd
            # Même chose avec une autre écruture:
            #- MARIADB_ROOT_PASSWORD=mot_de_pass_bdd
        volumes:
            - myvolume:/var/lib/mysql


networks: 
    mynetwork: 

volumes: 
    myvolume: 

```

Pour lancer le container depuis ***docker-compose.yml***, on fait un:
```docker-compose up -d```



### Ajout ***mynginx*** et ***myphp***


```yml
version: "2.4"

services: 
    mybdd: 
        image: mariadb:10.5
        networks: 
            - mynetwork
        environment: 
            MARIADB_ROOT_PASSWORD: mot_de_pass_bdd
            # Même chose avec une autre écruture:
            #- MARIADB_ROOT_PASSWORD=mot_de_pass_bdd
        volumes:
            - myvolume:/var/lib/mysql
    
    myphp:
        image: phpdockerio/php73-fpm
        networks: 
            - mynetwork
        volumes: 
            - ./php:/srv/http
        
    mynginx:
        depends_on: 
            - myphp
            - mybdd
        image: nginx:1.20-alpine
        networks: 
            - mynetwork
        ports: 
            - "8080:80"
        volumes: 
            - ./conf/nginx.conf:/etc/nginx/conf.d/default.conf


networks: 
    mynetwork: 

volumes: 
    myvolume: 

```

Vérification: 


```bash
root@debian:/home/stagiaire/Docker-compose# docker ps
CONTAINER ID   IMAGE                   COMMAND                  CREATED              STATUS         PORTS                                   NAMES
defb2e410997   nginx:1.20-alpine       "/docker-entrypoint.…"   About a minute ago   Up 3 seconds   0.0.0.0:8080->80/tcp, :::8080->80/tcp   docker-compose_mynginx_1
6d82d5f004a2   phpdockerio/php73-fpm   "/usr/sbin/php-fpm7.…"   About a minute ago   Up 4 seconds   9000/tcp                                docker-compose_myphp_1
0eca0e9f5394   mariadb:10.5            "docker-entrypoint.s…"   18 minutes ago       Up 4 seconds   3306/tcp                                docker-compose_mybdd_1

```

```bash
stagiaire@debian:~/Docker-compose$ docker-compose ps
          Name                        Command               State               Ports             
--------------------------------------------------------------------------------------------------
docker-compose_mybdd_1     docker-entrypoint.sh mysqld      Up      3306/tcp                      
docker-compose_mynginx_1   /docker-entrypoint.sh ngin ...   Up      0.0.0.0:8080->80/tcp,:::8080->
                                                                    80/tcp                        
docker-compose_myphp_1     /usr/sbin/php-fpm7.3 -O          Up      9000/tcp
```




















---

<div class=wisdomquote><p id="quote"><a id="tweetQuote" href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></p><p id="author"></p><div id="getMessage"><img id="getMessage" class="icon" src="https://pixabay.com/static/uploads/photo/2016/03/31/23/19/buddha-1297531_960_720.png"><p class="prompt">Please enlighten me</p></div></div>



