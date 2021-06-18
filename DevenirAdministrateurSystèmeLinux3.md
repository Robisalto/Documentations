---
title: III. L'Architecture Système
author: David DEBRAY
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
---
<link rel="icon" href="favicon.png" type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 

# I. Aborder l'architecture système de Linux
## I-I. Découvrir le noyau
![](DevenirAdministrateurSystèmeLinux/LinuxKernelMap.jpg)

## I-II. Examiner les sources du noyau

Les sources du noyau sont disponibles sur: <https://www.kernel.org/>

**Linux** est un noyau **_monolitique_**

> Le noyau est la partie principale d’un système d’exploitation. il gère les ressources du système. Le noyau est comme un pont entre l’application et le matériel de l’ordinateur. Le noyau peut être classé en deux catégories, le **micro-noyau** et le **noyau monolithique**. Le micro-noyau est celui dans lequel les services utilisateur et les services du noyau conservés dans un espace d’adressage séparé. Toutefois, dans le noyau monolithiques, les services utilisateur et les services du noyau, les deux sont conservés dans le même espace d’adressage.
> 
> --<cite> https://waytolearnx.com/2018/11/difference-entre-un-noyau-monolithique-et-un-micro-noyau.html </cite>

La première *"Build"* de Linux a été faite en **Septembre 1991**.

**Git** a été créé expressément par **Linus Torvalds** afin de gérer le code source de **Linux**.

## I-III. Utiliser ``pstree`` pour voir les processus
La commande ``pstree`` permet de consulter l'achitecture/dépendance des processus

![](DevenirAdministrateurSystèmeLinux/pstree.png)

### I-III-I. Syntaxe de ``pstree``

```bash
$ pstree [options] [pid or username]
```

```bash
$ pstree --help
pstree : l'option « --help » n'a pas été reconnue
Usage: pstree [-acglpsStTuZ] [ -h | -H PID ] [ -n | -N type ]
              [ -A | -G | -U ] [ PID | UTILISATEUR ]
   ou: pstree -V

Affiche un arbre des processus.

  -a, --arguments     montrer les arguments de la ligne de commande
  -A, --ascii         utiliser les caractères de dessin de lignes ASCII
  -c, --compact-not   ne pas compacter des sous-arbres identiques
  -C, --color=TYPE    coloriser les processus par attribut
                      (age)
  -g, --show-pgids    montrer les ids de groupes de processus ; implique -c
  -G, --vt100         utiliser les caractères de dessin de lignes du VT100
  -h, --highlight-all mettre en évidence le processus courant et ses ancêtres
  -H PID, --highlight-pid=PID
                      mettre en évidence ce processus et ses ancêtres
  -l, --long          ne pas tronquer les longues lignes
  -n, --numeric-sort  trier la sortie par PID
  -N TYPE, --ns-sort=TYPE
                      trier la sortie par ce type d'espace de noms
                              (cgroup, ipc, mnt, net, pid, user, uts)
  -p, --show-pids     montrer les PID ; implique -c
  -s, --show-parents  montrer les parents du processus sélectionné
  -S, --ns-changes    montrer les transitions d'espaces de noms
  -t, --thread-names  montrer les noms complets des threads
  -T, --hide-threads  cacher les threads, montrer uniquement les processus
  -u, --uid-changes   montrer les transitions de UID
  -U, --unicode       utiliser les caractères UTF-8 (Unicode) pour dessiner les lignes
  -V, --version       afficher les informations de la version
  -Z, --security-context
                      montre les contextes de sécurité SELinux

  PID    commence à ce PID; le défaut est 1 (init)
  USER   montre seulement les arbres nichés aux processus de cet utilisateur

```

## I-IV. Explorer le répertoire ``proc``

![](DevenirAdministrateurSystèmeLinux/proc.png)

```bash
# Informations sur le processeur
cat cpuinfo

# Information sur la mémoire
cat meminfo
```

## I-V. Observer un processus dans ``proc``

Pour plus d'informations sur l'utilisation de ``proc``, on peut consulter: <https://linux.die.net/man/5/proc>

## I-VI. Quizz 😬

<p class="question">L'espace d'adressage d'un processus se situe dans _____.</p>
<p class="answer">...la mémoire virtuelle</p>

<p class="question">Toutes les distributions de Linux sont faites en code source.</p>
<p class="answer">FAUX</p>

<p class="question">Quel est le nom du deamon d'initialisation du système Linux ?</p>
<p class="answer">systemd</p>

<p class="question">Le répertoire virtuel des pilotes de périphériques s'appelle _____.</p>
<p class="answer">dev</p>

<p class="question">Le répertoire dans proc qui contient la liste des fichiers ouverts par un processus s'appelle _____.</p>
<p class="answer">fd</p>

# II. Gérer l'execution des processus
## II-I. Comprendre et agir sur le ``swap``

Pour afficher les infos liées au **swap**, on utilise la commande ``swapon``.

```bash
david@FORNI:/$ swapon
NAME      TYPE SIZE USED PRIO
/swapfile file   2G   0B   -2
```

On peut aussi utiliser la commande ``free``:

![](DevenirAdministrateurSystèmeLinux/swapon.png)

### II-I-I. Modifier le comportement du swap

Concept de **_"swapiness"_**: <https://www.howtogeek.com/449691/what-is-swapiness-on-linux-and-how-to-change-it/>

```bash
# Affiche la "tendance" à swapper
cat /proc/sys/vm/swappiness
60

# Pour changer cette valeur on utilise la commande:
sudo sysctl vm.swappiness=10

# Pour le changer de façon persistente:
cd /etc/sysctl.d/
echo "vm.swappiness=10" > vm.swappiness.conf
```

## II-II. Installer ``sysstat``
Pour installer **sysstat**, on utilise:
```bash
sudo apt install sysstat -y
```

### II-II-I. Activer la collecte de données
Pour activer la collecte de données systèmes par **sysstat**, il faut modifier le fichier de configuration.
```bash
sudo nano /etc/default/sysstat
```

![](DevenirAdministrateurSystèmeLinux/sysstat.png)

On change en ``ENABLED="true"``.

### II-II-II. Configurer la fréquence de collecte
On vérifie qu'il existe bien une tâche ``cron`` pour **sysstat**.

![](DevenirAdministrateurSystèmeLinux/sysstatcrond.png)

Contenu du fichier ``/etc/cron.d/sysstat``:

![](DevenirAdministrateurSystèmeLinux/sysstatcrond2.png)

### II-II-III. Récupérer les informations
Pour récupérer les informations de charge de la machine grâce à ``sysstat``, on utilise la commande ``sar``.

## II-III. Comprendre l'ordonnancement
<https://www.linkedin.com/learning/linux-l-architecture-systeme/comprendre-l-ordonnancement?contextUrn=urn%3Ali%3AlyndaLearningPath%3A591da9f9498ea34a0bcaaaac&resume=false>


## II-IV. Utiliser la commande ``nice``
Pour gérer la priorité des processus on utilise la commande ``nice``. Plus un processus est **"nice"** et plus il laisse sa place aux autres. 
La **_"niceness"_** est comprise entre **-20** et **+20**.

<p class="info">Les processus système ont une **_"niceness"_ négative** et seront donc prioritaires. Les processus moins important auront une **_"niceness"_ positive** et ne seront pas prioritaires.</p>

### II-IV-I. Manuel d'utilisation de ``nice``
```bash
nice --help
Utilisation : nice [OPTION] [COMMANDE] [ARG]...
Exécuter COMMANDE avec un niveau de priorité ajusté, ce qui modifie la priorité
d'ordonnancement du processus.
Sans COMMANDE, afficher le niveau de priorité actuel. L'étendue des niveaux va
de -20 (priorité la plus favorable au processus) à 19 (la moins favorable).

Les arguments obligatoires pour les options longues le sont aussi pour les
options courtes.
  -n, --adjustment=N  ajouter la valeur entière N à la valeur de la priorité
                        (10 par défaut)
      --help     afficher l'aide et quitter
      --version  afficher des informations de version et quitter

Remarque : l'interpréteur de commande peut avoir sa propre version de nice,
lequel remplace habituellement la version décrite ici. Consultez la
documentation de l'interpréteur pour obtenir des précisions sur les options
prises en charge.

Aide en ligne de GNU coreutils : <https://www.gnu.org/software/coreutils/>
Signalez les problèmes de traduction de « nice » à : <traduc@traduc.org>
Documentation complète à : <https://www.gnu.org/software/coreutils/nice>
ou disponible localement via: info '(coreutils) nice invocation'
```


### II-IV-II. Exemples d'utilisation
```bash
# Démarrer un processus avec une priorité (ici 10=faible)
nice -n 10 tar xvzf ma_grosse_archive.tar.gz

# Modifier la priorité d'un processus actif (2778=PID)
renice 0 2778 
```


## II-V. Voir l'activité des processeurs
Quelques commandes pour visualiser les informations concernant le processeur:

- ``nproc``
- ``cat /proc/cpuinfo``
- ``ls cpu``
- `top`
- `htop`


## II-VI. Quizz sur le chapitre 😬
<p class="question">La commande qui affiche les informations de swap s'appelle _____.</p>
<p class="answer">swapon</p>

<p class="question">Sur quel processus linux se base sysstats pour cumuler l'historique des informations du système ?</p>
<p class="answer">cron</p>

<p class="question">La commande qui change la priorité d'un processus s'appelle _____.</p>
<p class="answer">nice</p>

<p class="question">En diminuant la « niceness », on augmente la charge du processus sur le système.</p>
<p class="answer">VRAI</p>

<p class="question">Le fichier virtuel qui montre les informations de processeurs s'appelle _____.</p>
<p class="answer">cpuinfo</p>


# III. Obtenir des informations sur le système
## III-I. Utiliser ``vmstat``

## III-II. Analyser l'utilisation de la mémoire
Installation de ``smem``: 
```bash 
sudo apt install smem -y
```



## III-III. Suivre l'exécution d'un processus

## III-IV. Préparer l'analyse du multithreading

## III-V. Suivre l'exécution des threads

## III-VI. Aller plus loin dans l'analyse

## III-VII. Utiliser la commande `ps`

## III-VIII. Utiliser la commande `sar`

## III-IX. Conclure sur l'architecture systèmes de Linux

## III-X. Quizz sur le chapitre 😬

<p class="question"></p>
<p class="answer"></p>


---

<p style="text-align: center"> [I. Linux: Les commandes du terminal - Version PDF](DevenirAdministrateurSystèmeLinux3.pdf) </p>

---

