# TP Classe paramétrable

**Objectifs**

---

Dans ce travail pratique nous allons:

- écrire un nouveau manifest
- Définir une classe paramétrable
- se familiariser avec les variables
- Utiliser de nouvelles ressources : exec
- Gérer l'idempotence

**Prérequis**

- Doc :

  - **Variables** : https://puppet.com/docs/puppet/7/lang_variables.html

  - **exec** : https://puppet.com/docs/puppet/7/types/exec.html

---

## Exercice 1 : Créer le manifest manage_tz.pp dans code/environments/production/manifests


1. Définir une classe manage_tz paramétrable :

  - variable type string $timezone avec valeur par défaut : 'Europe/Paris'

2. Déclarer une ressource exec qui met à jour la timezone et utilise la variable $timezone

  - commande : timedatectl set-timezone ${timezone}

3. Déclarer la classe dans le fichier manifest site.pp (uniquement pour cli03 - systemd)


5. Analyse le comportement (idempotence) lors du redéclenchement de l'agent

6. Essayer de mieux gérer l'idempotence dans la ressource exec

## Exercice 2 : Un nouveau projet demande l'intégration d'un node anglophone

7. Créer un nouveau cli04.formation.lan depuis la vm puppetmaster et l'ingétrer en tant qu'agent 

  ```bash
  $ docker run -d --name cli04.formation.lan --hostname cli04.formation.lan --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro --add-host="puppet:172.16.8.11" bilbloke/puppet-systemd:1.0
  ``` 

8. Dans site.pp, déclare la classe manage_tz avec une valeur de parametre différent pour le node cli04

  - $timezone = 'Europe/London'

9. Tester

