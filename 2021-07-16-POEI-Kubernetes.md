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

<script src="highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>



#### Kubernetes

**Pierre SABLE** Formateur 

Découvrez notre webTV : <http://www.dawan.tv>

# Doc Source

<iframe src="2021-07-16-POEI-Kubernetes/Kubernetes.pdf" allowfullscreen> </iframe>

## Gitlab

Lien vers le GitLab de Pierre: <https://gitlab.com/pierre.sable/poec_devops_kubernetes.git>

## Doc Officielle

- <https://kubernetes.io/fr/>


# K8S Intro

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




# Maquette

## Déploiement de la maquette K8S + binaire kubectl

### Installation du client kubectl

> Nécessaire pour administrer, donner des ordres à un(des) cluster(s) Kubernetes

https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/

### Installation du cluster Kubernetes 

> On utilise un outils "minikube" pour déployer automatiquement un VM cluster K8S

https://kubernetes.io/fr/docs/tasks/tools/install-minikube/


### Test CLIENT vers Cluster K8S :

```bash
$ kubectl cluster-info
```

##### Mein Stuff 😄

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





# TP 1
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



# TP2

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

<div class=warning> Penser au namespace !! </div>

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


## Utilisation volume emptyDir et conteneur side-car 

On souhaite utiliser un conteneur **side-car** *(ou satellite)* qui dispose de commandes pour télécharger du code source dans un volume de type `emptyDir` et ainsi le mettre à dispo du conteneur applicatif nginx.

```bash
$ kubectl apply -f multipod.yaml
$ kubectl get po -n multi
$ kubectl port-forward -n multi multipod 8080:80
```


# TP3

## Création d'un Service NodePort

Dans cet exercice, vous allez modifier le fichier de spécification multipod.yaml afin d'ajouter une ressource de type service NodePort

Le but est d'exposer de facon définitive le port applicatif 80 sur le serveur nginx

### Prépa : suppression des ressources

```bash
$ kubectl delete -f multipod
```

### 1. Ajout de label dans la spécification multipod

Dans le fichier *multipod.yaml*, ajouter un label afin de pouvoir par la suite associer d'autres ressources à ce pod (service)

- label: *app: multipod*

### 2. Création de la spécification Service

Dans le fichier *multipod.yaml* définissant ajouter une ressource de type service définissant les caractéristiques suivantes :
- nom du service: *multipod*
- type: *NodePort*
- un selector permettant le groupement des Pods ayant le label *app: multipod*.
- exposition du port *80* à l'intérieur du cluster
- forward des requètes vers le port *80* des Pods sous-jacents
- exposition du port 31001 sur chacun des nodes du cluster (accès depuis l'extérieur)

- Ex definition service NodePort

  ```yaml
  apiVersion: v1
  kind: Service
  metadata:
    name: my-service
  spec:
    selector:
      app: MyApp
    type: NodePort
    ports:
      - protocol: TCP
        port: 80
        targetPort: 80
        nodePort: 31001
  ```

### 3. Application des ressources

Relancer l'application à l'aide de *kubectl apply*

Vérifier la création des ressources : *kubectl get*

### 4. Accès au Service depuis l'extérieur

Lancez un navigateur sur le port 31001 de l'une des machines du cluster.

Note: vous pouvez obtenir les adresses IP des nodes de votre cluster dans la colonne *INTERNAL-IP* du résultat de la commande suivante:
```bash
$ kubectl get nodes -o wide
```

### Annexe

<div class=warning> Attention au namespace </div>

<div class=info> ``kubectl api-ressource`` pour lister les ressources, leur nom et raccourcis nom. 

```kubectl delete {ressource} {nom_ressource}``` si besoin ;) </div>



- Lister les ressources du namespace multi :

```bash
$ kubectl get -n multi all
$ kubectl get -n multi pod,service
```

### Fichier YAML:

Ci-dessous le résultat dans le fichier `multipod.yaml`:

```yaml
---

apiVersion: v1
kind: Namespace
metadata:
  name: multi

---

apiVersion: v1
kind: Pod
metadata:
  name: multipod
  namespace: multi
  labels:
    app: multipod
spec:
  containers:
    - name: nginx
      image: nginx:1.18-alpine
      volumeMounts:
        - name: multipod-partage
          mountPath: /usr/share/nginx/html
  initContainers:
    - name: alpine
      image: alpine:3.12
      command: ["/bin/sh"]
      args: ["-c", "wget https://raw.githubusercontent.com/psable/k8s_html/master/index.html -P /partage/"]
      volumeMounts:
        - name: multipod-partage
          mountPath: /partage
  volumes:
    - name: multipod-partage
      emptyDir: {}


---

apiVersion: v1
kind: Service
metadata: 
  name: multipod
  namespace: multi
spec:
  selector:
    app: multipod
  type: NodePort
  ports:
    - port: 80
      targetPort: 80
      nodePort: 31001
      protocol: TCP



...
```

#### Vérification

```bash
Admin stagiaire@BBG58Y2 MINGW64 ~/Kubernetes
$ kubectl.exe get all -n multi
NAME           READY   STATUS    RESTARTS   AGE
pod/multipod   1/1     Running   0          4m59s

NAME               TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
service/multipod   NodePort   10.99.48.217   <none>        80:31001/TCP   4m59s

Admin stagiaire@BBG58Y2 MINGW64 ~/Kubernetes
$ kubectl.exe get nodes -o wide
NAME       STATUS   ROLES                  AGE     VERSION   INTERNAL-IP      EXTERNAL-IP   OS-IMAGE               KERNEL-VERSION   CONTAINER-RUNTIME
minikube   Ready    control-plane,master   2d23h   v1.21.2   192.168.99.100   <none>        Buildroot 2020.02.12   4.19.182         docker://20.10.6

```

##### Page web

![](2021-07-16-POEI-Kubernetes/2021-07-19_14h12_08.png)



# Dashboard

Documentation officielle du [Tableau de bord (Dashboard)](https://kubernetes.io/fr/docs/tasks/access-application-cluster/web-ui-dashboard/)

## Installation du Dashboard

On intalle le tableau de bord avec:

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended.yaml

```

# TP4

## Création d'un déploiement

Dans cet exercice, vous allez modifier le fichier de spécification multipod.yaml afin de transformer le simple en un deployment (+ replicaset + pod)


### Prépa : suppression des ressources

```bash
$ kubectl delete -f multipod
```

### 1. Transformer la spécification multipod

Ex :

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.7.9
        ports:
        - containerPort: 80
```

### 2. Application des ressources

Relancer l'application à l'aide de *kubectl apply*

Vérifier la création des ressources : *kubectl get*

### Résultats

#### Fichier YAML

Contenu du fichier `multipod.yaml`:

```yaml
---

apiVersion: v1
kind: Namespace
metadata:
  name: multi

---

apiVersion: apps/v1
kind: Deployment
metadata:
  name: multipod
  namespace: multi
  labels:
    app: multipod
spec:
  replicas: 1
  selector:
    matchLabels:
      app: multipod
  template:
    metadata:
      labels:
        app: multipod

    spec:
      containers:
        - name: nginx
          image: nginx:1.18-alpine
          volumeMounts:
            - name: multipod-partage
              mountPath: /usr/share/nginx/html
      initContainers:
        - name: alpine
          image: alpine:3.12
          command: ["/bin/sh"]
          args: ["-c", "wget https://raw.githubusercontent.com/psable/k8s_html/master/index.html -P /partage/"]
          volumeMounts:
            - name: multipod-partage
              mountPath: /partage
      volumes:
        - name: multipod-partage
          emptyDir: {}


---

apiVersion: v1
kind: Service
metadata: 
  name: multipod
  namespace: multi
spec:
  selector:
    app: multipod
  type: NodePort
  ports:
    - port: 80
      targetPort: 80
      nodePort: 31001
      protocol: TCP


...
```

##### Création du Deployment

```bash
$ kubectl.exe apply -f multipod.yaml
namespace/multi unchanged
deployment.apps/multipod created
service/multipod unchanged

```

##### Vérification

```bash
$ kubectl.exe get deployments -n multi
NAME       READY   UP-TO-DATE   AVAILABLE   AGE
multipod   1/1     1            1           24s
```



# TP5

Dans cet exercice, vous allez créer un Deployment et l'exposer à l'intérieur du cluster en utilisant un Service de type *ClusterIP*.

Schéma: 

![](2021-07-16-POEI-Kubernetes/Diagramme_TP5.png)


## 1. Création d'un fichier de spec backend

- Créer un fichier de spec : myphp_backend.yaml

### 1.1 Ressource namespace

Créer un ressource de type namespace avec le spécificités suivantes :

- name: myphp
- labels:
    - projet: myphp

### 1.2 Ressource Déployment

Créez définissant un Deployment ayant les propriétés suivantes:

- nom: *backend-deploy*
- label associé au Pod: *app: myphp_backend* (ce label est à spécifier dans les metadatas du Pod)
- replica : 2
- nom du container: *backend*
- labels
    - *app: myphp_backend*
    - *projet: myphp*
- namespace : myphp
- image du container: *bilbloke/backend:1.0*


### 1.3. Ressource service de type ClusterIP

Créez une ressource définissant un service ayant les caractéristiques suivantes:
- nom: *backend*
- label: 
    - *app: myphp_backend*
    - *projet: myphp*
- namespace : myphp
- type: *ClusterIP*
- un selector permettant le groupement des Pods ayant le label *app: myphp_backend*.
- exposition du port *80* dans le cluster
- forward des requètes vers le port *80* des Pods sous-jacents

### 1.4 Application des ressources

La commande suivante permet de créer le deployment

```
$ kubectl apply -f myphp_backend.yaml
```

### 1.5. Accès au Service depuis le cluster

- Créer un fichier *client_pod.yaml* définissant le Pod dont la spécification est la suivante:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: debug
  namespace: myphp
  labels: 
    projet: myphp
spec:
  containers:
  - name: debug
    image: alpine:3.9
    command:
    - "sleep"
    - "10000"
```

Nous allons utiliser ce Pod pour accèder au Service *backend* depuis l'intérieur du cluster. Ce Pod contient un seul container, basé sur alpine et qui est lancé avec la commande `sleep 10000`. Ce container sera donc en attente pendant 10000 secondes. Nous pourrons alors lancer un shell intéractif à l'intérieur de celui-ci et tester la communication avec le Service *backend*.

- Lancez le Pod avec *kubectl*.

```kubectl apply -f client_pod.yaml```

- Lancez un shell intéractif *sh* dans le container *debug* du Pod.

```kubectl exec -it debug -n myphp -- sh```

- Installer l'utilitaire *curl*

le container *debug* du Pod du même nom est basé sur l'image *alpine:3.9* qui ne contient pas l'utilitaire *curl* par défaut. Il faut donc l'installer avec la commande suivante:

```
/ # apk update && apk add curl
```

- Utilisez *curl* pour envoyer une requête HTTP Get sur le port *80* du service *myphp_backend*.
Vous devriez obtenir le contenu, sous forme textuel, de la page *index.php* servie par défaut par *myphp_backend*.

```
curl http://backend/index.php
```

Ceci montre que depuis le cluster, si l'on accède au Service *backend* la requête est bien envoyée à l'un des Pods (nous en avons créé un seul ici) regroupé par le Service (via la clé *selector*).

### 1.6. Utilisation ClusterIP + port-forward => accès extérieur temporaire

Accèder au service backend depuis l'extérieur temporairement à l'aide de port-forward :

```kubectl port-forward -n myphp svc/backend 8080:80```

### 1.7. Visualisation de la ressource de type service 

A l'aide de `kubectl get`, visualisez la *spécification* du service *backend*.

```
kubectl get service backend
kubectl get service backend -o yaml
```


### 1.8. Détails du service

A l'aide de *kubectl describe*, listez les détails du service *backend*

Notez l'existence d'une entrée dans *Endpoints*, celle-ci correspond à l'IP du Pod qui est utilisé par le Service.

Note: si plusieurs Pods avaient le label *app: backend*, il y aurait une entrée Endpoint pour chacun d'entre eux.

```kubectl describe service backend```


## Création d'un fichier de spec frontend

## 2. Création d'un fichier de spec backend

- Créer un fichier de spec : myphp_frontend.yaml


### 2.1 Ressource Déployment

Créez définissant un Deployment ayant les propriétés suivantes:

- nom: *frontend-deploy*
- label associé au Pod: *app: myphp_frontend* (ce label est à spécifier dans les metadatas du Pod)
- replica : 2
- nom du container: *frontend*
- labels
    - *app: myphp_frontend*
    - *projet: myphp*
- namespace : myphp
- image du container: *bilbloke/frontend:1.0*


### 2.2 Ressource service de type NodePort

Créez une ressource définissant un service ayant les caractéristiques suivantes:
- nom: *myphp_frontend*
- label: 
    - *app: myphp-frontend*
    - *projet: myphp*
- namespace : myphp
- type: *NodePort*
- un selector permettant le groupement des Pods ayant le label *app: myphp_frontend*.
- exposition du port *80* dans le cluster
- forward des requètes vers le port *80* des Pods sous-jacents
- NodePort: 31500

### 2.3 Application des ressources

La commande suivante permet de créer le deployment

```
$ kubectl apply -f myphp_frontend.yaml
```

### 2.4 Accès au Service depuis le cluster

Accèder à l'appli depuis un navigateur : http://IP_INTERNAL:31500/index.php



# TP 6

## Stratégie Rolling Update et rollback

Dans cet exercice, vous allez modifier les fichiers de spécification myphp_frontend.yaml et myphp_backend.yaml afin de configurer la stratégie de rolling update (0 downtime)

Le but est de réaliser une mise à jour des images en 2.0 de l'appli PHP (et faire un rollback si nécessaire)


### 1. Ajout de stratégie de rolling update

Dans les fichiers de spécification `myphp_frontend.yaml` et `myphp_backend.yaml`, ajouter une stratégie de rolling update pour avoir 0 downtime et un max replicas supplémentaire à 1

```yaml
strategy:
  type: RollingUpdate
  rollingUpdate:
    maxSurge: 1
    maxUnavailable: 0
```

### 2. Update des ressources deployment

Appliquer les nouvelles spec : `kubectl apply`

## 3. Vérification de l'application de la stratégie dans le dashboard

![](2021-07-16-POEI-Kubernetes/2021-07-20_12h27_17.png)


## 4. Faire un scale à 10 réplicas du déploiement frontend

<div class=info> On peut utiliser le dashboard pour faire la mise à l'échelle (la commande kubectl est affichée) </div>



## 5. Réaliser un rolling update du déploiement frontend :

> Passage de l'image bilbloke en 2.0 en méthode impérative => test

> Répérer le nom du déploiement (kubectl get), repérer le nom du conteneur (spec yaml)

```bash
$ kubectl set image {nom du déploiement frontend} {conteneur}=bilbloke/frontend:2.0 --record
```



Résultat:

<iframe src="2021-07-16-POEI-Kubernetes/2021-07-20_12h20_33.mp4"> </iframe>


--- 

# Documentation

## Client Kubectl

- Info sur le cluster :

```bash
$ kubectl cluster-info
```

- Info sur les nodes :

```bash
$ kubectl get nodes
$ kubectl get nodes -o wide
```

## Configuration du client :
- Configuration kubectl
    - Cient qui permet de manager des culster K8S
    - Contextes à configurer
        - a. fichier de config ou variables d'environnement
        - b. Ligne de commande : kubectl config --help

## Lister les ressources k8s

```bash
$ kubectl api-resources
```

## Lister les ressources créées dans le cluster

```bash
$ kubectl get pod
$ kubectl get pod -n multi



## Récuperer de l'info dans le cluster 

> On interroge des ressources

```bash
$ kubectl get pod
```

> Les ressources sont déclarée dans des namespace. Cela permet de ranger, dissocier des ressources par équipe, projets, fonctionnalités, environnement.

- Interroger la ressources de type pod dans le namespace systeme : kube-system

```bash
$ kubectl get pod -n kube-system
```

## Documentation - aide

- Lister les ressources : 

```bash
$ kubectl api-resources
```

- Description, information, syntaxe :

```bash
$ kubectl explain pods
$ kubectl explain pods.spec
$ kubectl explain pods.spec.containers
```


## LES PODS

- <https://kubernetes.io/fr/docs/concepts/workloads/pods/pod-overview/>

- <https://kubernetes.io/fr/docs/concepts/workloads/pods/pod/>

- <https://kubernetes.io/fr/docs/concepts/workloads/pods/pod-lifecycle/>

- <https://kubernetes.io/fr/docs/concepts/workloads/pods/init-containers/>

- <https://kubernetes.io/fr/docs/tasks/configure-pod-container/configure-pod-initialization/>

### Approche impérative

> Approche impérative : en ligne de commande pour déclarer des ressource


1. Création d'une ressource de type pod :

```bash
$ kubectl run nginx --image nginx:1.18-alpine
```

2. Lister le pod (namespace default)

```bash
$ kubectl get pods
```

3. Obtenir les infos sur la ressource pod + les events (logs)

```bash
$ kubectl describe pod nginx
```


4. Utilisation du port-forwarding pour bind un port local vers le pod (test, debugging)

- <https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/>

```bash
$ kubectl port-forward nginx 8080:80
```


5. Transposer les commande docker à kubernetes

- docker container exec -it
    ==>  kubectl exec -it nginx --sh
- docker logs 
    ==> kubectl logs nginx

6. Supprimer une ressource POD :

```bash
kubectl delete pod nginx
```

### Approche déclarative

> Approche déclarative : spec (spécification YAML)

1. Utiliser la commande impérative pour générer un fichier de spec 

```bash
$ kubectl run nginx --image nginx:1.18-alpine --dry-run=client -o yaml > spec_pod.yml
```

2. Déclarer la ressource

```bash
$ kubectl apply -f spec_pod.yml
```


## Mise en réseau - service

- <https://kubernetes.io/fr/docs/concepts/services-networking/service/>

- <https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/>


## ReplicatSet et Deployments

- <https://kubernetes.io/fr/docs/concepts/workloads/controllers/replicaset/>

- <https://kubernetes.io/fr/docs/concepts/workloads/controllers/deployment/>



## Scaling horizontal - Mise à l'échelle

https://kubernetes.io/docs/tutorials/kubernetes-basics/scale/scale-intro/

https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/


- ***HPA*** : Horizontal Pod Autoscale

> Prérequis : activation des **metrics** pour les Pods

```bash
$ kubectl.exe -n myphp scale deployment.apps/frontend-deploy --replicas=8
deployment.apps/frontend-deploy scaled

```

Résultat sur le Dashboard *(minikube)*:

![](2021-07-16-POEI-Kubernetes/2021-07-19_14h12_08.png)



## ConfigMaps

https://kubernetes.io/docs/concepts/configuration/configmap/

- Lister les ressources configMaps : il faut les chercher explicitement

```bash
$ kubectl get cm
$ kubectl get configmaps
```

- Lister pod et configMaps du namespace default

```bash
$ kubectl get configmaps,pod
```


---

# *Tips & Tricks*

## Cheatsheet

![](2021-07-16-POEI-Kubernetes/kubernetes-cheatsheet.png)