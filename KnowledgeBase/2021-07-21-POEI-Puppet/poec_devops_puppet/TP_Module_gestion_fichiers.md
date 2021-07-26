# TP Module server fichier puppet

**Objectifs**

---

Dans ce travail pratique nous allons:

- écrire un nouveau manifest et donc une classe dans un module existant
- Définir une classe
- se familiariser avec la gestion de fichiers static
- se familiariser avec la gestion de fichiers dynamiques (variabilisé) => templates
- Utiliser de nouvelles ressources : file, template


**Prérequis**

- Doc :

  - **file** : https://puppet.com/docs/puppet/7/types/file.html

  - **template** : https://puppet.com/docs/puppet/7/lang_template.html

---

## Exercice 1 : Créer le manifest manage_file.pp dans code/environments/production/modules/bootstrap/manifests


1. Définir une classe manage_file

2. Déclarer une ressource file qui copie un fichier static sur les serveurs 


3. Déclarer une ressource template qui copie un fichier dynamique sur les serveurs

  - Le template est au format epp ou erb
  - La destination du fichier : /etc/motd
  - Le conteneu : 
    - Afficher le contenu d'un facts
    - Du texte 
    - Faire un test avec du code : if 
      - if facts == 'quelquechose'
        > affichage de texte

4. Appeler la classe dans le manifest principal du module

5. Tester

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

