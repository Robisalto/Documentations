---
title: POEI DevOps - VMWare Vsphere7
author: David CLÉMENT
date: 2021-07-05
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
extensions: 'extra'
---
<link rel="icon" href="favicon.png" type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">


#### Formation VMWare Vsphere7

**David CLÉMENT**

*09.72.37.73.73* - *07.61.04.94.46*

Formation de 35H du 5 au 9 Juillet 2021.

![](https://www.vmware.com/content/dam/digitalmarketing/vmware/en/images/infographic/vm-logo.png)


# Doc Source

<!-- Documentation Source en PDF:

<iframe src="2021-07-05-POEI-VMWare-VSphere7/.pdf" width="100%"  height="320px" allowfullscreen="yes"></iframe> -->


Documentation sur HedgeDoc: <https://hedgedoc.dawan.fr/s/yXS0kTRqJ#>

Site officiel: <https://www.vmware.com/fr/products/vsphere.html>


Documentations sous pdf: [Docs PDFs](2021-07-05-POEI-VMWare-VSphere7/DocsPDF)


# *Tips & Tricks*


# Formation VMWare vSphere

## vSphere

Eco-système des produits de virtualisation.
- Hyperviseurs : ESXi (Electric Sky internal à partir de la version 5), ESX (avant la v5), VMVisor. OS permettant de faire tourner les VMs.
- vCenter : gestionnaire d'infra vSphere (fonctionnalités: agrégation/centralisation des configurations des ESXi, clone, modèle, librairie, HA, DRS, VDS, ...)
- Clients : 
    - lourd windows : n'existe plus
    - web client flash : deprecated
    - web client html5

## Schéma du lab

![](2021-07-05-POEI-VMWare-VSphere7/upload_224b49851431cda9963f3c5540361ad6.png)



## Nouveautés de la version 7

- Gestion des containers : vSphere with Kubernetes, Tanzu Kubernetes Grid clusters
- Improved Distributed Resource Scheduler (DRS)
- Assignable Hardware Framework
- Advanced Dynamic DirectPath I/O
- vSphere Lifecycle Manager
- Improved vMotion
- Advanced Security – implement multifactor authentication (MFA)
- Precision clock for PTP support
- Content Library, gestion des versions des modèles 
- DRaaS : PRA sur VMWare Cloud
- Service Hybrid Cloud : gestion centralisée infra locale et Cloud public

- EVC sur GPU
- Option "Arrêt immédiat" sur les VMs
- ...


# Hyperviseurs ESXi

## Installation

- ISO / Clé USB -> mode interactif/scripté en unattend

ESXi Image Customizer -> injection des fichiers unattend, drivers (vib)

- Boot via PXE

- Auto Deploy Service -> déploiement automatisé (Enterprise Plus et VDS Switch Distribué)


-> HCL VMWare : Hardware Compatibility List *(<https://www.vmware.com/resources/compatibility/search.php>)*

## Console

Fonctionnalités:
- Configuration du réseau de gestion
- SSH et le shell (esxtop, esxcli)
- Logs

Raccourcis clavier:
- F2 : paramètres
- F12 : reboot/shutdown
- ctrl+alt+F1 : shell
- ctrl+alt+F2 : paramètres
- ctrl+alt+F11 : logs


## Configurations basiques

### Mise en réseau

vmnic : interface réseau physique de l'ESXi
vSwitch : interface entre les vmnic ("uplinks" du vSwitch, adaptateur réseau physique de l'hyperviseur) et les vmKernel et les groupes de ports de VMs. 2 types de switchs virtuels:
- VSS : virtual Standard Switch (VLAN, formation de trafic en sortie)
- VDS : virtual Distributed Switch(édition Entreprise Plus, filtrage/balisage, port mirroring, formation de trafic en in/out, PVLAN, NetFlow Collector, LACP, ...)

vmKernel : flux réseaux internes des hyperviseurs
vm Port Group : groupe de ports des VMs, possède un nom unique et doit être identique sur l'ensemble des hyperviseurs d'un cluster.

Exemple 1:
![](2021-07-05-POEI-VMWare-VSphere7/upload_499e7938dc7fc7d0af9b1fab0015f013.png)

Exemple 2:
![](2021-07-05-POEI-VMWare-VSphere7/upload_8850d402dc619b616bcd8c3303c5edc1.png)

### vSwitch

MTU : Maximum Transmission Unit => taille des trames Ethernet. Permet de diminuer les commutations au niveau des switchs.
Jumbo Frame : augmenter la taille des trames Ethernet MTU 9000 octets ou +

Découverte de liaison : utilisation du protocole CDP ou LLDP pour établir une cartographie du réseau pour mieux au panne réseau.

Sécurité:
- mode de promiscuité : fonctionnement en mode Hub
- modification d'adresse MAC : autorise la VM à modifier à modifier son adresse MAC
- transmission forgée : autorise une VM à émettre un trafic avec une autre MAC que la sienne

Association de cartes réseau: principe de répartition des VM sur les Nic physiques. 
3 algos de répartition: round robin en fonction de l'ip ou de la MAC ou du port du switch
Et 1 algo de failover: basculement explicite (utilisation de la 1ère interface et bascule sur la 2ème si pb)

Détection de basculement: déterminer l'état d'un lien réseau
Utilisation du Beacon probing("Balise seulement", broadcast sur le LAN entre les ESXi sur le management network) possible pour mieux déterminer si le lien actif

Restauration automatique: si un lien est "Up" après une phase de panne alors il est remis dans le round robin

Formation de trafic: Fixer une bande passante maximum en sortie (VSS ou VDS) ou en entrée (VDS).

### vmKernel

Flux réseaux internes des hyperviseurs:

- Management network: administration des hyperviseurs
- Stockage: provisionnement, provisioning. Accès aux stockages(serveurs de fichiers, baie de disques, etc.)
- vMotion: 
    - vMotion : kit Essential plus, déplacement à chaud de VM
    - Storage vMotion : Licence Standard, déplacement à chaud du stockage
- Journalisation de Fault Tolerance: copie en temps réel de VM entre ESXi (Licence Standard)
- vSAN et vSAN witness : stockage hyperconvergé (licence séparée)
- Replication et Replication NFC : utilisé par l'outil SRM (Site Recovery Manager), DRaaS (Disaster Recovery as a Service)

Possibilité d'utiliser des piles TCP/IP spécifiques pour ces vmKernels. 
Pile TCP/IP : configuration DNS et passerelle. Et optimisation des communications de certains vmKernel : vMotion et Provisionnement (stockage, pré-requis baie de stockage compatible VAAI) 

### Stockage



- DAS : Direct Attached Storage
- NAS : pour VMWare uniquement le NFS 3 et 4 (hyperviseurs authentifiés sur Kerberos auprès d'un annuaire)
- SAN : iSCSI logiciel, FCoE(Fiber Channel over Ethernet) ou FC(Fiber Channel)
    - configuration du vmKernel de stockage (remonter la MTU)
    - Configuration préalable des adaptateurs de stockage(liaison de port et cibles)
- vVol : cluster de stockage SAN ou NAS
- vSAN : Stockage hyperconvergé

VMFS:

- Utiliser la v6 (la v5 n'est là que pour la rétrocompatibilité)
- 64TB max
- Fichiers 2TB max
- recommandé 16 VMs max par LUN


Plus d'info: <https://syskb.com/san-ou-nas-quelle-est-la-difference/>

### Services, Pare-feu

NTP ou PTP(nouveauté de la v7)


### Matériel

PCI PassThrough : 1 matériel alloué à 1 VM
SR-IOV (Single Root-Input Output Virtualization) : 1 matériel alloué à n VM

### Délégation

RBAC : Role Based Access Control
Role = ensemble d'opération


### VM

Par défaut, principe de l'émulation/virtualisation complète.
Goulots d'étranglement:

- Processeur : Intel-VTx, AMD-V jeux d'instructions de virtu
- RAM : Intel-EPT, AMD-RVI -> SLAT Second Level Address Translation, RAM gérée par les VM
- Stockage : paravirtualisation, matériel virtu + drivers spécifiques sur les OS des VMs => accès plus direct au matériel par les VMs
- Réseau : idem stockage
=> éviter de consommer du CPU sur l'ESXi pour les IO


Format d'échange de VM : Appliance virtuelle 

- OVF : Open Virtualization Folder
- OVA : Open Virtualization Archive (tar de l'OVF)

Vmware Converter : P2V ou V2V, conversion de machines physiques ou virtuelles

Compatibilité de la VM : Version du matériel de la VM.
Prendre la dernière version par défaut sauf si volonté d'export vers des ESXi plus ancien.

OS : préselection du matériel virtuel le plus adapté à l'OS de la VM.

Linux : Possibilité de se passer de LVM. 1 disque virtuel = 1 point de montage.

Bonnes pratiques:

- limiter le nombre d'OS (déduplication des pages de RAM)
- utiliser le matériel virtuel para-virtualisé(contrôleur VMWare Paravirtual et VMXNet3)
- ne pas installer d'interface graphique
- toujours installer les **VMWare Tools**
- supprimer si pas utile Lecteur disquette, lecteur CD/DVD, contrôleur USB.


Exemple pour une VM Windows:




### VMWare Tools

Meilleure intégration de l'OS Guest au sein de l'Hyperviseur

#### Intérêts:
- remontée d'infos(IP, nom DNS, OS, partition, etc) => classification des VMs
- exécution de commandes sur les VMs : Invoke-VMScript
- gestion de l'ACPI
- Drivers VMXNet3
- mise au repos du système de fichier (snapshot) 
- ballooning : service permettant de faire croire à la VM qu'elle dispose de l'intégralité de sa RAM. Ram allouée éventuellement à d'autres VM (en cas de contention/sur-allocation)
- ...



#### Installation:

- Windows : Installation en mode graphique
 
- Linux : Installer le paquet de la distrib "open-vm-tools"
Ou git clone https://github.com/vmware/open-vm-tools.git

Documentation pour la compilation :
https://github.com/vmware/open-vm-tools


- Linux ancien (debian < v6, Centos <5, ...): A n'utiliser qu'en cas d'indispobilité du package Open-vm-tools pour la distribution. Compilation des VMWare officiels depuis le CD d'installation:
    - Debian/Ubuntu:
`   apt-get install gcc make linux-headers-\$(uname -r) nettools dns-utils`
     - CentOs/RedHat:
`   yum install gcc perl linux-headers-$(uname -r)`
    - Tout OS, monter le cd, décompresser l'archive tar.gz, exécuter :
`   ./vmware-install.pl`



### VM : Fichiers

1 VM = 1 dossier de même nom

Fichiers de base:

- vmx : configuration de la VM
- vmdk : disque virtuel

Fichiers volatiles:

- vmx~ : configuration à chaud
- vmx.lck : verrou
- nvram : pagination de la RAM de la VM
- vswp : Cache (swap) de la VM (provisionné au démarrage des VM)
- log : traces de fonctionnement du processus de la VM (8 fichiers conservés)

Snapshots:

- vmsd : vm snapshot data, informations sur les snapshots
- vmsn : vm snapshot, info d'1 snapshot 
- vmem : dump de la RAM de la VM lié à un snapshot
- .000000XX.vmdk : disque delta en provisionnement dynamique (lié à un vmdk parent)


### Snapshots

- :warning: un snapshot n'est pas une sauvegarde !
- La configuration matérielle n'est pas prise en compte dans les snapshots. Uniquement les disques de la VM !
- utilisé pour créer des modèles, tester des màj, faire du recettage, installer des applis...
- Pré-requis:
    - à froid: pas de disque en RDM physique (Raw Device Mapping : mappage de LUN vers une VM) et disques indépendants 
    - à chaud:
        - pas de disque en RDM physique(Raw Device Mapping, disque brut), disque indépendant
        - pas de périphérique en PCI-Passthrough
        - pas de Fault Tolerance activé sur la VM
- Les snapshots ne doivent pas dépasser "15 jours" (nombre d'opérations IOps mulitiplié sur le stockage)
- limite de 4096 snapshots par VM
- Interdire les snapshots sur une VM:
    - paramètre avancé de VM : snapshot.MaxSnapshots à 0
    - ou utiliser un disque "Indépendant - Persistant"




# vCenter

- Gestion centralisée d'ESXi
- Ajout de fonctionnalités d'admin : Clonage, Modèles, Migration(vMotion et Storage vMotion), Librairie, Tag/Attributs personnalisés, Alarmes, Tâches planifiées, profils VM/ESXi ... 
- Nouveaux objets : vAPP, Pool de ressources, Cluster, Datacenter et Dossiers
- Lifecycle Manager : gestion des mises à jour

Fonctionnalités de clusterisation:

- Essential plus:
    - HA : High Avaibility, redémarrage de VM (reprise d'activité)
- Standard:
    - FT : Fault Tolerance (continuité d'activité, copie temps réel de VM sur 2 hyperviseurs)
    - vSAN : hyper convergence (licence supplémentaire)
- Enterpise Plus:
    - DRS : Dynamic Resource Scheduler  -> load balancing
    - DPM : Distributed Power Management, gestion de l'alim électrique (mise en veille/allumage automatisé des hyperviseurs en cas de baisse/montée de charge dans le cluster)
    - Proactive HA : Détection de panne, bascule de VM en fonction d'événements matériels
    - Predictive DRS : Provisionnement d'espace libre sur les ESXi en fonctions d'opérations de provisionnement de VM avec vROp (vRealize Operation Manager)
    - SDRS : Storage DRS, load balancing de stockage
    - VDS : vSphere Distributed Switch, configuration centralisée des mises en réseau des ESXi
    - AutoDeploy : déploiement automatique d'ESXi
    - vCenter HA : cluster applicatif du serveur vCenter
    - ...
    

## Déploiement

- Depuis la v6.5, uniquement le VCSA, vcenter linux virtualisé
Pour les vCenter sous Windows Server => migration obligatoire.
- C'est une VM! Minimum : 4vCPU, 12Go de RAM et 250Go de DD
- Déploiement d'un modèle OVA depuis un assistant




## Fonctionnalités VM

- Migration de VM
- Clonage
- Modèle
- Spécification de personnalisation d'OS
- Balise/Attributs personnalisés


### Migration de VM : vMotion

- Editions: 
    - vMotion : à partir de Essential plus, déplacement d'état CPU/RAM entre HV sans interruption de la VM
    - Storage vMotion : à partir de Standard, déplacement de stockage entre datastores sans interruption de la VM
    
- Pré-requis : Stockage partagé entre les HV
    - à froid, pas de pré-requis (pas de PCI-PassThrough, pas de DAS)
    - à chaud :
        -  activer le vmKernel avec le service vMotion, 
        - CPU identiques sur les ESXi
        - pas de média amovible (floppy, cd/dvd, usb), 
        - pas de disque indépendant et en RDM, 
        - ni de périphériques PCI-PassThrough.


### Clonage

- à froid, copie de fichiers
- à chaud, basé sur les snapshots(pas de périph en pci passtrough ou sr-iov, pas de disque en RDM ou indépendant)
- Utilise le vmkernel de Gestion
- Personnalisation d'OS dispo pour :
    - Windows(sysprep)
    - Linux Centos/RedHat


### Balises et Attributs personnalisés

Personnalisation des différents types d'objets de l'inventaire.

- Balises : attribution sur un objet (pas de valeur)
Plus simple à utiliser en script. Option "-Tag" en PowerCLI.
- Attribut personnalisé : Nom = Valeur
Utilisable dans l'interface web

=> exemples : 
- propriétaire, service (balises)
- date de création (attribut personnalisé)


### Allocation de ressources

Permet de privilégier certaines VMs. Utile si on a de la surallocation sur une ressource de l'ESXi (CPU, RAM, Disque).

3 mécanismes : 
- pondération : notion de parts sur RAM, CPU et stockage
- réservation : allocation définitive d'une partie de la ressource concernée sur RAM et CPU (machine critique)
- limitation : bridage sur la ressource concernée sur RAM, CPU et stockage
    
-> pondération : utilisée uniquement lors de la saturation(>90%) de la ressource concernée


Objets pour gérer les allocations:
    - pool de ressources : conteneur de VMs
    - vAPP : méta-VM (pseudo vm constituée de plusieurs VMs, pré-requis : cluster DRS) 





# Clusters

Création, choix des fonctionnalités de clustering:
- DRS : répartition de charge (Distributed Resource Scheduler)
- vSphere HA : Redémarrage automatisé de VM en cas de défaillance d'un ESXi (High Avaibility)
- vSAN : virtual SAN, stockage hyper-convergé -> stockage interne aux ESXi, cluster de stockage tolérant au panne 



## vSphere HA

Licence : à partir d'Essential Plus
Pré-requis : 
- hyperviseurs identiques recommandés
- stockage partagé entre les HV
- 2 interfaces réseau sur le vmKernel de Gestion

**Redémarrage automatisé de VM en cas de défaillance d'ESXi ou de la VM elle-même.**

Les VMs sont redémarrées par le maître du cluster sur l'ensemble des ESXi restants.

Maître est désigné par : 
- le nombre le + important de datastore monté
- l'identifiant de l'ESXi, premier par ordre alphab.
    
Types de panne :    
- Panne de l'hôte
- Isolation d'hôte : perte du réseau heartbeat entre les esxi sur le vmkernel de gestion (à partir de 3 HV)
- Perte de stockage (système de heartbeat entre esxi et les datastores)
    - PDL : nfs/iscsi san, Permanent Device Loss
    - APD : fc multipathing, All Path Down

:arrow_right:  permet d'éviter la création de monstre à 2 têtes
:arrow_right:  on arrête les vms sur l'hôte isolé




**Contrôle d'admission** : Contrôle des ressources CPU et RAM réservées sur chaque HV pour assurer les bascules.
    

VMs doivent être indépendantes par rapport au matériel de l'esxi, éviter :
- usb, floppy, cd/dvd
- pci-passtrough
- série/parallèle physique
- pas de stockage DAS




## Fault Tolerance

- édition : Standard(2vCPU par VM en FT max) et Enterprise Plus (4vCPU max/VM)
- Copie de vm en temps réel entre 2 ESXi

Pré-requis ESXi :
- activer le vmkernel avec le service Fault Tolerance Logging
- vswitch séparé avec adaptateurs réseau physiques dédiés avec minimum 10Gb/s
- HA activée (utilisée pour le redémarrage d'une VM secondaire en cas de défaillance d'un esxi)utilisée pour le redémarrage d'une VM secondaire en cas de défaillance d'un esxi)

Pré-requis VM :
- 2 vCPU max (licence standard), 4 vCPU max(licence Enterprise)
- EFI pas pris en charge
- CPU et RAM hotplug non pris en charge
- Verrouillage de la RAM
- Disque dur gonflé (provis. statique)
- Virtualisation CPU/MMU matérielle
- pas de périphériques : USB, série, parallèle, RDM,
    pci-passthrough ou sr-iov, contrôleur NVMe
- entre 1 (1Gb/s sur le vmk FT) et 4 vCPU (4Gb/s)

:warning: Stockage dupliqué sur un autre datastore pour protéger la VM de la perte d'un stockage

![](2021-07-05-POEI-VMWare-VSphere7/upload_16fd2c1179a43e9306d065a2044e8656.png)


Limites :
- 1 à 4 vCPU par VM (2 max pour l'édition standard et 4 pour Entreprise Plus)
- 4 VM en FT / hôte
- 8 vCPU en FT / hôte
- 98 VM en FT / cluster
- 256 vCPU en FT / cluster
- plus de snapshot possible sur les VMs

    


## DRS : Distributed Resource Scheduler

- Edition : Enterprise plus
- répartition de charge (VM déplacée automatiquement à chaud ou au démarrage)

Pré-requis ESXi :
- vMotion activé
- Activer l'EVC si besoin (Enhanced vMotion Compatibility) -> sert à masquer les jeux d'instructions CPU non compatibles entre ESXi (inutile si les CPU sont homogènes). Garantie de déplacement à chaud de VM entre HV. Surtout utile pour le DRS, uniquement pour des plateformes de virtu hétérogènes en terme de CPU. 
        
Pré-requis VM :
- pas de périphériques : usb, série/parallèle, pci pass-through, floppy/cd, RDM
    
Règles de DRS : 
- affinité VM-VM et VM-Hôte
- anti-affinité VM-VM et VM-Hôte
    
Fonctionnalités liées : 
- ProActive HA : évacuation automatisée de VM en fonction de l'état de santé des HV
- Predictive DRS : option pour faciliter les déploiements avec vROp (vRealize Operation Management)
- SDRS : Storage DRS, répartition automatisée sur les datastores
- DPM : Distributed Power Management, mise en veille/allumage automatisé d'hyperviseurs

Objets utilisables au sein d'un cluster avec DRS :  
- pool de ressource
- vApp 
    



## Reporting

RVTools : https://www.robware.net/rvtools/
vCheck : https://vcheck.report/


## vSAN : Hyper-convergence

- Edition : Standard, licence supplémentaire
- Définition : virtual SAN, stockage virtuel
Créer un stockage unique mutualisé avec l'ensemble des "DAS" des ESXi.


Intérêt : Apporter de la scalabilité (évolutivité simplifiée) aux infra de virtu.

- Pré-requis matériel : 
    - au minimum 3 volumes de stockage (Flash : SSD ou NVMe) par hyperviseur :
        - 1 pour l'OS
        - 1 pour le cache (bufferisation des opérations de redondance des données de VM entre les HV)
        - 1 pour la capacité (stockage des VMs)
    (Hyperviseur AFA chez EMC, All Flash Array, vxRail chez Dell, ...)
        
    - interface réseau 10GB/s mini

- Pré-requis ESXi: 
    - vmkernel vSAN activé sur les hôtes
    
- Domaines de panne = tolérance de la perte d'un ou plusieurs HV

    
# VDS : vSphere Distributed Switch

- Edition : Enterprise plus
- vSphere Distributed Switch : configuration centralisée de switch virtuel sur un ensemble d'hyperviseurs

- fonctionnalités supplémentaires : pvlan, pool de ressource, mirroring de port, traffic shaping en entrée et en sortie, filtrage/balisage, association statique sur port de switch, netflow/netflow-collector ...
        
![](2021-07-05-POEI-VMWare-VSphere7/upload_02a4fdebcc2a2332646eae38de37e4a7.png)

:::info
Schéma
:::


# Mises à jour de l'infra

Problèmes de sécurité : https://www.vmware.com/in/security/advisories.html

- Éléments à mettre à jour dans cet ordre:
    - vCenter : soit à partir du Web ou via ISO d'install
    - ESXi : soit avec LifeCycle Manager(ancien Update Manager), ou via ISO
    - VM : matériel virtuel et vmware tools

- Types de màj :
    - update : changement de version mineure
        - vCenter à faire depuis https://vcsa.formation.lan:5480
        - esxi : avec un support d'install ISO ou avec le Lifecycle Manager
        - VM : mettre à jour d'abord les VMWare Tools puis le matériel virtuel 

    - upgrade : changement de version majeure
    à partir des supports d'install (iso). A faire en direct sur les hyperviseurs ou via le Lifecycle Manager.


- Update Manager ou Licycle manager : mise à jour des ESXi
    - Licence Standard
    - ligne de base : ensemble de correctifs
    - référentiel de correctif : url pour récupérer les définitions des correctifs (ajouter celui du constructeur)
    
    

# Sauvegarde de l'infra

Backup du vcenter, des confs des esxi(VSS, VM Network, VM Kernel si pas de VDS, certif SSL si modifié), VM.

vCenter : 
- backup complet de la VM
- ou backup de la config : https://vcsa:5480 (ftp, sftp, http, ...)
    
ESXi:
- via PowerCLI
- via shell ESXi : vicfg-cfgbackup
- via VMA : vicfg-cfgbackup (vSphere Management Assistant)
    
Installation de la PowerCLI:
- powershell en tant qu'admin:
```
    Install-Module VMWare.PowerCLI
```
- powershell en tant qu'utilisateur:
```powershell
    Install-Module VMWare.PowerCLI -Scope CurrentUser
```

## Sauvegarde des ESXi

Connexion sur esxi:
```
    Connect-VIServer 192.168.76.17 -Force
```
ou sur vcenter:
```
    Connect-VIServer vcsa -Force
```

Backup:
```
    # depuis un hyperviseur
    Get-VMHostFirmware -BackupConfiguration -DestinationPath c:\users\admin\
    
    # depuis le vcenter : VMHost indique l'hyperviseur à sauvegarder
    Get-VMHostFirmware -VMHost 192.168.76.17 -DestinationPath c:\temp\
```
Restore : Mettre en mode maintenance l'ESXi (reboot requis) 

```
Set-VMHostFirmware -SourcePath configBundle-192.168.76.17.tgz -VMHost 192.168.75.90 -HostUser root -HostPassword 'F0rmation!' -Restore -Force
```

Le paramètre '-Force' permet de restaurer une sauvegarde même si l'UUID de l'ESXi ne correspond pas.


## Profils d'hôtes

Mise en conformité des configurations des ESXi au sein des clusters (Licence Enterprise Plus).

Mise en place:
* Construction d'un profil à partir d'un ESXi déjà configuré
* Attacher le profil sur un ESXi/Cluster
* Personnalisation des ESXi (configuration variable entre les hyperviseurs : ip, adresse mac, ...)
* Valider la conformité et faire de la correction automatique


## Bibliothèques de contenu

Licence Standard

Stocker et gérer les modèles de déploiement, OVA/OVF ISO.

![](2021-07-05-POEI-VMWare-VSphere7/upload_ed1c29075bdc1b53dcd4c4feaf92a60a.png)



# API : Automatisation de tâches

- API REST : Centre de développement
(exemples dispo : https://github.com/vmware)
- CLI : obsolète
- PowerCLI : librairies de commandes Powershell (compatibles Linux, Mac et Windows)
Installer au préalable :
  Install-Module Wmware.PowerCLI
Ou
  Install-Module Wmware.PowerCLI -scope CurrentUser
- pyvmomi : API pour le python 
- govmomi : API pour le langage Go
- SDK pour Java, .Net, ...

- Ressources pour outils DevOps : Ansible, Puppet, DSC, ...
-----> assurance d'idempotence



# Glossaire

- ESX : ancien nom des ESXi
- ESXi : Electric Sky internal, Hyperviseur
- DCUI : Direct Control User Interface, interface web de gestion des hyperviseurs
- VAAI: VStorage API for Array Integration (VMware, Inc.), gestion intelligente du stockage
- PCI-Passthrough : Partage d'un périph physique vers 1 VM
- SR-ioV : Single Root IO Virtualization, Partage d'un périph physique vers n VM
- VMFS : Système de fichiers VMWare
- NFS : Network file system, partage de dossier de type NAS
- VMDK : Disque de VM
- HA : High Avaibility, redémarrage de VMs 
- vMotion : déplacement à chaud de VMs
- EVC : Enhanced vMotion Compatibility, 

Standard :

- DRS : Distributed Resource Scheduler  -> load balancing
- vApp : vSphere Application, ensemble de VMs regroupées
- FT : Fault Tolerance (continuité d'activité, copie temps réel de VM)
- VSAN : hyper convergence


Enterpise :

- DPM : Distributed Power Management, gestion de l'alim électrique des ESXi
- Proactive HA : Détection de panne
- Predictive DRS : Bascule de VM en fonction d'événements matériels
- SDRS : Storage DRS, load balancing de stockage
- VDS : vSphere Distributed Switch




--- 

# TPs & Pratiques

Ici c'est ***moi*** qui écrit !


