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

<iframe src="2021-06-17-POEI-Docker/.pdf" width="100%"  height="100%" allowfullscreen="yes"></iframe>

## Containers

<div class=info> ***Docker*** utilise l'OS hôte, dans le cas de Linux peut importe la distribution c'est **le noyau** qui est utilisé. </div>

## Lien GitLab

<https://gitlab.com/pierre.sable/poec_devops_docker>

## Autres liens utiles

- <https://docs.docker.com/>

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

# Configuration de la VM

```bash
docker container run -d --name mynginx2 -p 8080:80 nginx:1.20-alpine
```


















---

<div class=wisdomquote><p id="quote"><a id="tweetQuote" href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></p><p id="author"></p><div id="getMessage"><img id="getMessage" class="icon" src="https://pixabay.com/static/uploads/photo/2016/03/31/23/19/buddha-1297531_960_720.png"><p class="prompt">Please enlighten me</p></div></div>
