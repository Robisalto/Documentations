---
title: POEI DevOps - Kubernetes
author: Pierre SABLE
date: 2021-07-16
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
extensions: 'extra'
---
<link rel="icon" href="favicon.png" type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">


#### Kubernetes

**Pierre SABLE** / Formateur 

Tél: 09.72.37.73.73 / Mail: <fkibanza@dawan.fr>

<http://www.dawan.fr>

Découvrez notre webTV : <http://www.dawan.tv>

# Doc Source

<https://gitlab.com/pierre.sable/poec_devops_kubernetes.git>

## Doc Officielle

- <https://kubernetes.io/fr/>


# Doc de Pierre

`https://gitlab.com/pierre.sable/poec_devops_kubernetes`

Philosophie derrière Kubernetes et le mouvement “Cloud Native”


## Historique et popularité

Kubernetes est un logiciel développé originellement par Google et basé sur une dizaine d’années d’expérience de déploiement d’applications énormes (distribuées) sur des clusters de machines.

Dans la mythologie Cloud Native on raconte que son ancêtre est l’orchestrateur borg utilisé par Google dans les années 2000.

La première version est sortie en 2015 et k8s est devenu depuis l’un des projets open source les plus populaires du monde.

L’écosystème logiciel de Kubernetes s’est développée autour la Cloud Native Computing Foundation qui comprend notamment : Google, CoreOS, Mesosphere, Red Hat, Twitter, Huawei, Intel, Cisco, IBM, Docker, Univa et VMware. Cette fondation vise au pilotage et au financement collaboratif du développement de Kubernetes (un peut comme la Linux Foundation).
Trois transformations profondes de l’informatique

Kubernetes se trouve au coeur de trois transformations profondes techniques, humaines et économiques de l’informatique:

- Le cloud
- La conteneurisation logicielle
- Le mouvement DevOps

> Il est un des projets qui symbolise et supporte techniquement ces transformations. D’où son omniprésence dans les discussions informatiques actuellement.


## Le Cloud

Au delà du flou dans l’emploi de ce terme, le cloud est un mouvement de réorganisation technique et économique de l’informatique.

On retourne à la consommation de **“temps de calcul”** et de services après une **“aire du Personnal Computer”**.

Pour organiser cela on définit trois niveaux à la fois techniques et économiques de l’informatique:
- **Software as a Service**: location de services à travers internet pour les usagers finaux
- **Plateforme as a Service**: location d’un environnement d’exécution logiciel flexible à destination des développeurs
- **Infrastructure as a Service**: location de resources “matérielles” à la demande pour installer des logiciels sans avoir à maintenir un data center.

## Conteneurisation

La conteneurisation est permise par l’isolation au niveau du noyau du système d’exploitation du serveur : les processus sont isolés dans des namespaces au niveau du noyau. 

Cette innovation permet de simuler l’isolation sans ajouter une couche de virtualisation comme pour les machines virtuelles.

Ainsi les conteneurs permettent d’avoir des performances proche d’une application traditionnelle tournant directement sur le système d’exploitation hote et ainsi d’optimiser les ressources.

Les images de conteneurs sont aussi beaucoup plus légers qu’une image de VM

Les technologies de conteneurisation permettent donc de faire des boîtes isolées avec les logiciels pour apporter l’uniformisation du déploiement:

- Un façon standard de packager un logiciel (basée sur le)
- Cela permet d’assembler de grosses applications comme des legos
- Cela réduit la complexité grâce:
    - à l’intégration de toutes les dépendance déjà dans la boîte
    - au principe d’immutabilité qui implique de jeter les boîtes ( automatiser pour lutter contre la culture prudence). 
    - Rend l’infra prédictible.

Les conteneurs sont souvent comparés à l’innovation du porte conteneur pour le transport de marchandise.


## Le mouvement DevOps

- Dépasser l’opposition culturelle et de métier entre les développeurs et les administrateurs système.
- Intégrer tout le monde dans une seule équipe et …
- Calquer les rythmes de travail sur l’organisation agile du développement logiciel
- Rapprocher techniquement la gestion de l’infrastructure du développement avec l’infrastructure as code.
    - Concrêtement on écrit des fichiers de code pour gérer les éléments d’infra
    - l’état de l’infrastructure est plus claire et documentée par le code
    - la complexité est plus gérable car tout est déclaré et modifiable au fur et à mesure de façon centralisée
    - l’usage de git et des branches/tags pour la gestion de l’évolution d’infrastructure

## Objectifs du DevOps

- Rapidité (velocity) de déploiement logiciel (organisation agile du développement et livraison jusqu’à plusieurs fois par jour)
    - Implique l’automatisation du déploiement et ce qu’on appelle la CI/CD c’est à dire une infrastructure de déploiement continu à partir de code.
- Passage à l’échelle (horizontal scaling) des logiciels et des équipes de développement (nécessaire pour les entreprises du cloud qui doivent servir pleins d’utilisateurs)
- Meilleure organisation des équipes
    - meilleure compréhension globale du logiciel et de son installation de production car le savoir est mieux partagé
    - organisation des équipes par thématique métier plutôt que par spécialité technique (l’équipe scale mieux)

## Apports techniques de Kubernetes pour le DevOps

- Abstraction et standardisation des infrastructures:
- Langage descriptif et incrémental: on décrit ce qu’on veut plutôt que la logique complexe pour l’atteindre
- Logique opérationnelle intégrée dans l’orchestrateur: la responsabilité des l’état du cluster est laissé au controlleur k8s ce qui simplifie le travail

On peut alors espérer **fluidifier** la gestion des défis techniques d’un grosse application et atteindre plus ou moins la livraison logicielle continue (CD de CI/CD)


## Architecture logicielle optimale pour Kubernetes

Kubernetes est très versatile et permet d’installer des logiciels traditionnels “monolithiques” (gros backends situés sur une seule machine).

Cependant aux vues des transformations humaines et techniques précédentes, l’organisation de Kubernetes prend vraiment sens pour le développement d’applications microservices:

- des applications avec de nombreux de “petits” services.
- chaque service a des problématiques très limitées (gestion des factures = un logiciel qui fait que ça)
- les services communiquent par le réseaux selon différents modes/API (REST, gRPC, job queues, GraphQL)

Les microservices permettent justement le DevOps car:

- ils peuvent être déployés séparéments
- une petite équipe gère chaque service ou groupe thématique de services




# Install & Conf

- Kubernetes: <https://v1-18.docs.kubernetes.io/docs/tasks/tools/install-kubectl/>
- Minikube: <https://github.com/kubernetes/minikube/releases/download/v1.22.0/minikube-installer.exe>

> minikube quickly sets up a local Kubernetes cluster on macOS, Linux, and Windows. We proudly focus on helping application developers and new Kubernetes users.

## Démarrage

On démarre avec la commande `minikube. start`:

```shell
Admin stagiaire@BBG58Y2 MINGW64 ~/Kubernetes
$ minikube.exe start
�  minikube v1.22.0 sur Microsoft Windows 10 Pro 10.0.19041 Build 19041
✨  Choix automatique du pilote virtualbox
�  Téléchargement de l'image de démarrage de la VM...
    > minikube-v1.22.0.iso.sha256: 65 B / 65 B [-------------] 100.00% ? p/s 0s
    > minikube-v1.22.0.iso: 46.90 KiB / 242.95 MiB [>___________] 0.02% ? p    > minikube-v1.22.0.iso: 94.89 KiB / 242.95 MiB [>___________] 0.04% ? p    > minikube-v1.22.0.iso: 174.89 KiB / 242.95 MiB [>__________] 0.07% ? p
...
```


Puis une fois tout installé:
```shell
Admin stagiaire@BBG58Y2 MINGW64 ~/Kubernetes
$ minikube start --driver=virtualbox --no-vtx-check
�  minikube v1.22.0 sur Microsoft Windows 10 Pro 10.0.19041 Build 19041
✨  Utilisation du pilote virtualbox basé sur le profil existant
�  Démarrage du noeud de plan de contrôle minikube dans le cluster minikube
�  StartHost a échoué, mais va réessayer : Error loading existing host. Please try running [minikube delete], then run [minikube start] again.: filestore "minikube": open C:\Users\Admin stagiaire.DESKTOP-8967908\.minikube\machines\minikube\config.json: Le fichier spécifié est introuvable.
�  Échec du démarrage de virtualbox VM. L'exécution de "minikube delete" peut résoudre le problème : Error loading existing host. Please try running [minikube delete], then run [minikube start] again.: filestore "minikube": open C:\Users\Admin stagiaire.DESKTOP-8967908\.minikube\machines\minikube\config.json: Le fichier spécifié est introuvable.

❌  Fermeture en raison de GUEST_PROVISION : Failed to start host: Error loading existing host. Please try running [minikube delete], then run [minikube start] again.: filestore "minikube": open C:\Users\Admin sta
giaire.DESKTOP-8967908\.minikube\machines\minikube\config.json: Le fichier spécifié est introuvable.

←[31m╭─────────────────────────────────────────────────────────────────────────────────────╮←[0m
←[31m│←[0m                                                                                     ←[31m│←[0m
←[31m│←[0m    �  Si les conseils ci-dessus ne vous aident pas, veuillez nous en informer :    ←[31m│←[0m
←[31m│←[0m    �  https://github.com/kubernetes/minikube/issues/new/choose                     ←[31m│←[0m
←[31m│←[0m                                                                                     ←[31m│←[0m
←[31m│←[0m    Veuillez joindre le fichier suivant au problème GitHub :                         ←[31m│←[0m
←[31m│←[0m    - C:\Users\Admin stagiaire.DESKTOP-8967908\.minikube\logs\lastStart.txt          ←[31m│←[0m
←[31m│←[0m                                                                                     ←[31m│←[0m
←[31m╰─────────────────────────────────────────────────────────────────────────────────────╯←[0m

```

