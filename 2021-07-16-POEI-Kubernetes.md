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

**Pierre SABLE** Formateur 

Découvrez notre webTV : <http://www.dawan.tv>

# Doc Source

<https://gitlab.com/pierre.sable/poec_devops_kubernetes.git>

<iframe src="2021-07-16-POEI-Kubernetes/Kubernetes.pdf" allowfullscreen> </iframe>

## Doc Officielle

- <https://kubernetes.io/fr/>


# Doc de Pierre

`https://gitlab.com/pierre.sable/poec_devops_kubernetes`

## Philosophie derrière Kubernetes et le mouvement “Cloud Native”


### Historique et popularité

Kubernetes est un logiciel développé originellement par Google et basé sur une dizaine d’années d’expérience de déploiement d’applications énormes (distribuées) sur des clusters de machines.

Dans la mythologie Cloud Native on raconte que son ancêtre est l’orchestrateur borg utilisé par Google dans les années 2000.

La première version est sortie en 2015 et k8s est devenu depuis l’un des projets open source les plus populaires du monde.

L’écosystème logiciel de Kubernetes s’est développée autour la Cloud Native Computing Foundation qui comprend notamment : Google, CoreOS, Mesosphere, Red Hat, Twitter, Huawei, Intel, Cisco, IBM, Docker, Univa et VMware. Cette fondation vise au pilotage et au financement collaboratif du développement de Kubernetes (un peut comme la Linux Foundation).
Trois transformations profondes de l’informatique

Kubernetes se trouve au coeur de trois transformations profondes techniques, humaines et économiques de l’informatique:

- Le cloud
- La conteneurisation logicielle
- Le mouvement DevOps

<div class=info> Il est un des projets qui symbolise et supporte techniquement ces transformations. D’où son omniprésence dans les discussions informatiques actuellement. </div>


### Le Cloud

Au delà du flou dans l’emploi de ce terme, le cloud est un mouvement de réorganisation technique et économique de l’informatique.

On retourne à la consommation de **“temps de calcul”** et de services après une **“aire du Personnal Computer”**.

Pour organiser cela on définit trois niveaux à la fois techniques et économiques de l’informatique:
- **Software as a Service**: location de services à travers internet pour les usagers finaux
- **Plateforme as a Service**: location d’un environnement d’exécution logiciel flexible à destination des développeurs
- **Infrastructure as a Service**: location de resources “matérielles” à la demande pour installer des logiciels sans avoir à maintenir un data center.

### Conteneurisation

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


### Le mouvement DevOps

- Dépasser l’opposition culturelle et de métier entre les développeurs et les administrateurs système.
- Intégrer tout le monde dans une seule équipe et …
- Calquer les rythmes de travail sur l’organisation agile du développement logiciel
- Rapprocher techniquement la gestion de l’infrastructure du développement avec l’infrastructure as code.
    - Concrêtement on écrit des fichiers de code pour gérer les éléments d’infra
    - l’état de l’infrastructure est plus claire et documentée par le code
    - la complexité est plus gérable car tout est déclaré et modifiable au fur et à mesure de façon centralisée
    - l’usage de git et des branches/tags pour la gestion de l’évolution d’infrastructure

### Objectifs du DevOps

- Rapidité (velocity) de déploiement logiciel (organisation agile du développement et livraison jusqu’à plusieurs fois par jour)
    - Implique l’automatisation du déploiement et ce qu’on appelle la CI/CD c’est à dire une infrastructure de déploiement continu à partir de code.
- Passage à l’échelle (horizontal scaling) des logiciels et des équipes de développement (nécessaire pour les entreprises du cloud qui doivent servir pleins d’utilisateurs)
- Meilleure organisation des équipes
    - meilleure compréhension globale du logiciel et de son installation de production car le savoir est mieux partagé
    - organisation des équipes par thématique métier plutôt que par spécialité technique (l’équipe scale mieux)

### Apports techniques de Kubernetes pour le DevOps

- Abstraction et standardisation des infrastructures:
- Langage descriptif et incrémental: on décrit ce qu’on veut plutôt que la logique complexe pour l’atteindre
- Logique opérationnelle intégrée dans l’orchestrateur: la responsabilité des l’état du cluster est laissé au controlleur k8s ce qui simplifie le travail

On peut alors espérer **fluidifier** la gestion des défis techniques d’un grosse application et atteindre plus ou moins la livraison logicielle continue (CD de CI/CD)


### Architecture logicielle optimale pour Kubernetes

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

On démarre avec la commande `minikube start`:

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
$ minikube start
😄  minikube v1.22.0 sur Microsoft Windows 10 Pro 10.0.19041 Build 19041
✨  Utilisation du pilote virtualbox basé sur le profil existant
👍  Démarrage du noeud de plan de contrôle minikube dans le cluster minikube
🔄  Redémarrage du virtualbox VM existant pour "minikube" ...
🐳  Préparation de Kubernetes v1.21.2 sur Docker 20.10.6...
    ▪ Génération des certificats et des clés
    ▪ Démarrage du plan de contrôle ...
    ▪ Configuration des règles RBAC ...
🔎  Vérification des composants Kubernetes...
    ▪ Utilisation de l'image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Modules activés: storage-provisioner, default-storageclass

❗  kubectl.exe est la version 1.18.17, qui peut comporter des incompatibilités avec Kubernetes 1.21.2.
    ▪ Vous voulez kubectl v1.21.2 ? Essayez 'minikube kubectl -- get pods -A'
🏄  Terminé ! kubectl est maintenant configuré pour utiliser "minikube" cluster et espace de noms "default" par défaut.

```

On vérifie en recherchant les infos du cluster:

```shell
Admin stagiaire@BBG58Y2 MINGW64 ~/Kubernetes
$ kubectl cluster-info
Kubernetes control plane is running at https://192.168.99.100:8443
CoreDNS is running at https://192.168.99.100:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.

```





# TP
## TP1:Création d'un Pod

Dans cet exercice, vous allez créer une spécification pour lancer un premier Pod.

### 1. Création de la spécification

Créez un fichier yaml *whoami.yaml* définissant un Pod ayant les propriétés suivantes:
- nom du Pod: *whoami*
- image du container: *containous/whoami*
- nom du container: *whoami*

```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx
  name: whoami
spec:
  containers:
  - image: containous/whoami
    name: whoami
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```


### 2. Lancement du Pod

Lancez le Pod à l'aide de *kubectl*

`kubectl apply -f whoami.yaml`

### 3. Vérification

Listez les Pods lancés et assurez vous que le Pod *whoami* apparait bien dans cette liste.

```shell
$ kubectl get pods
NAME     READY   STATUS    RESTARTS   AGE
nginx    1/1     Running   0          37m
whoami   1/1     Running   0          81s
```

### 4. Details du Pod

Observez les détails du Pod à l'aide de *kubectl* et retrouvez l'information de l'image utilisée par le container *whoami*.

```bash
$ kubectl describe pod whoami
Name:         whoami
Namespace:    default
Priority:     0
Node:         minikube/192.168.99.100
Start Time:   Fri, 16 Jul 2021 15:49:53 +0200
Labels:       run=nginx
Annotations:  <none>
Status:       Running
IP:           172.17.0.4
IPs:
  IP:  172.17.0.4
Containers:
  whoami:
    Container ID:   docker://4497f232925a182598ddaddaa724b33729cc6230068a78951616c14b691fcd14
    Image:          containous/whoami
    Image ID:       docker-pullable://containous/whoami@sha256:7d6a3c8f91470a23ef380320609ee6e69ac68d20bc804f3a1c6065fb56cfa34e
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Fri, 16 Jul 2021 15:50:01 +0200
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-4p99m (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             True
  ContainersReady   True
  PodScheduled      True
Volumes:
  kube-api-access-4p99m:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  2m3s  default-scheduler  Successfully assigned default/whoami to minikube
  Normal  Pulling    2m2s  kubelet            Pulling image "containous/whoami"
  Normal  Pulled     115s  kubelet            Successfully pulled image "containous/whoami" in 7.271245805s
  Normal  Created    115s  kubelet            Created container whoami
  Normal  Started    115s  kubelet            Started container whoami
```


### 5. Accès à l'application via un port-forward

Avec la commande *kubectl port-forward* envoyer une requête à l'application

```bash
kubectl port-forward whoami 8080:80
Forwarding from 127.0.0.1:8080 -> 80
Forwarding from [::1]:8080 -> 80
Handling connection for 8080
```

### 6. Suppression du Pod

Supprimez le Pod.

```bash
$ kubectl delete pod whoami
pod "whoami" deleted
```





## TP2: Création d'un Pod multi conteneurs
Dans cet exercice, vous allez créer un namespace dédié et une une spécification pour lancer un Pod avec deux conteneurs.

### 1. Création du namespace : multi

Créer un fichier de spec "ns_multi.yml" pour le namespace multi à partir d'une commande impérative:

```yaml
---
kind: Namespace
apiVersion: v1
metadata:
  name: multi
  labels:
    name: multi
...

```

Appliquer le fichier de spec:

```bash
$ kubectl apply -f ns_multi.yml 
namespace/multi created

```

#### Vérification

```bash
$ kubectl get namespace
NAME              STATUS   AGE
default           Active   119m
kube-node-lease   Active   119m
kube-public       Active   119m
kube-system       Active   119m
multi             Active   18m

```

#### Correction de Pierre

```bash
kubectl create namespace multi --dry-run=client > ns_multi.yaml

```

### 2. Création de la spécification

Créez un fichier yaml *multipod.yaml* définissant un Pod ayant les propriétés suivantes:

- nom du Pod: *mulitpod*
- namespace: *multi*
- image du container nginx: *nginx:1.18-alpine*
- nom du container: *nginx*

- image du container debian : *debian:buster-slim*
- nom du container: *debian*
- command: ["sleep", "600"]

```yaml
---
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx
  name: mulitpod
  namespace: multi
spec:
  containers:
  - image: nginx:1.18-alpine
    name: nginx

  - image: debian:buster-slim
    name: debian
    command: ["sleep", "600"]
...

```


### 3. Lancement du Pod

Lancez le Pod à l'aide de *kubectl*

```bash
kubectl apply -f multipod.yaml

```

### 4. Vérification

Listez les Pods lancés et assurez vous que le Pod *multipod* apparait bien dans cette liste.

```bash
$  kubectl get pods --namespace=multi
NAME       READY   STATUS    RESTARTS   AGE
mulitpod   2/2     Running   0          6s

```

#### Correction Pierre

```bash
$  kubectl get pods -n multi 
NAME       READY   STATUS    RESTARTS   AGE
mulitpod   2/2     Running   1          12m

```

##### All namespaces

```bash
$  kubectl get pods --all-namespaces
NAMESPACE     NAME                               READY   STATUS    RESTARTS   AGE
kube-system   coredns-558bd4d5db-pr8h2           1/1     Running   0          125m
kube-system   etcd-minikube                      1/1     Running   0          125m
kube-system   kube-apiserver-minikube            1/1     Running   0          125m
kube-system   kube-controller-manager-minikube   1/1     Running   0          125m
kube-system   kube-proxy-npcdx                   1/1     Running   0          125m
kube-system   kube-scheduler-minikube            1/1     Running   0          125m
kube-system   storage-provisioner                1/1     Running   0          125m
multi         mulitpod                           2/2     Running   1          13m

```



### 5. Details du Pod

Observez les détails du Pod à l'aide de *kubectl* et retrouvez l'information de l'image utilisée par le container *multipod*.


```bash
kubectl -n multi describe pod multipod 
```


### 6. Se connecter dans le conteneur debian du pod multipod 

Avec la commande *kubectl exec -it* se connecter dans le conteneur debian
Installer le package curl

`apt update && apt install curl`

Tester une requete curl vers le service pod_ngin `curl http://localhost:80`


#### Connexion dans le conteneur

```bash
$  kubectl -n multi exec -it multipod -c debian -- bash
```

#### Update & Test

```bash
apt update
apt install curl

curl http://127.0.0.1:80

```


### 7. Suppression du Pod

Supprimez le Pod.

```bash
kubectl delete -f multipod.yaml

```