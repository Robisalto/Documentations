---
title: POEI DevOps - Prometheus
author: David DEBRAY
date: 2021-08-11
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
extensions: 'extra'
---
<link rel="icon" href="favicon.png" type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

---

#### Introduction

Formateur: **Alexandre Chaussier**

- Mail: <a.chaussier@infopen.pro>
- Tél: [06.63.73.54.92](06.63.73.54.92)

2e partie de 3 formations:

- Terraform
- **Prometheus & Graphana**
- ELK Stack 

---

# Site Officiel

![](http://blog.inkubate.io/content/images/2017/12/prometheus-logo-3.png)

- Site officiel: <https://prometheus.io/>
- Documentation: <https://prometheus.io/docs/introduction/overview/>


# Doc Source

Documentation source: [NOT YET IMPLEMENTED...](2021-08-11-POEI-Prometheus/)


## Présentation de **Prometheus**

<iframe src="2021-08-11-POEI-Prometheus/" width="1200px" height="500px" allowfullscreen="yes"> </iframe>


### Fonctionnement de Prometheus

![](2021-08-11-POEI-Prometheus/2021-08-11_12h27_37.png)

Prometheus est composé des 3 grandes parties:

1. `Prometheus` : collecte, stockage ou transfert, exposition, alertes
2. `Alertmanager` : gestion des notifications
3. `Pushgateway` : réception de métriques *(sonde)*



>  **TSDB**:
> Time Series DataBase, *"Une Time Series DataBase est une base de données optimisée pour le stockage de données horodatées, telles que les données générées par l’internet des objets. Découvrez la définition complète d’une Time Series DataBase, ses différences avec les autres bases de données, ses fonctionnalités spécifiques, ses avantages pour l’entreprise, ainsi que le classement des bases de données TimeSeries les plus populaires."* 
>
>   --<https://www.lebigdata.fr/time-series-database-definition>


### Décomposition réseau

![](2021-08-11-POEI-Prometheus/2021-08-11_12h40_14.png)

Un serveur Prometheus de relai est placé dans la DMZ, permet de:

- Réduire les flux
- Réduire temps de latence => Augmenter la réactivité :D
- Augmenter la sécurité
- Déployer de nouveaux services sans trop affecter la supervision en place
- etc.

### Petit QCM *(Notions de base)*

![](2021-08-11-POEI-Prometheus/2021-08-11_14h43_28.png)


### Les Types de Données

- <https://prometheus.io/docs/concepts/metric_types/>

Prometheus permet d'utiliser quatre types de données pour les métriques : 

1. Le compteur (counter)
2. La jauge (gauge)
3. L’histogramme (histogram)
4. Le résumé (summary)


#### Counter
C'est une valeur qui ne peut qu'augmenter ou être remise à 0, dans le cas de redémarrage par exemple 

Exemple: nombre de requêtes, d'erreurs, ...

```go
# HELP node_softnet_processed_total Number of processed packets
# TYPE node_softnet_processed_total counter
node_softnet_processed_total{cpu="0"} 2.40324588e+08
node_softnet_processed_total{cpu="1"} 2.40305375e+08
node_softnet_processed_total{cpu="2"} 2.38303536e+08
node_softnet_processed_total{cpu="3"} 2.37670081e+08

```

#### Gauge
C'est une valeur entière qui peut être incrémentée ou décrémentée, à la différence du compteur

Exemple: les consommations mémoire, les températures, ...

```go
# HELP node_entropy_available_bits Bits of available entropy.
# TYPE node_entropy_available_bits gauge
node_entropy_available_bits 3941
```

#### Histogram
Permet de distribuer des valeurs sur un ensemble de poches.

Par exemple, pour connaître la répartition de requêtes par leur temps d'exécution.

Deux métriques sont automatiquement rajoutées en plus des poches :

- `sum` : la somme des valeurs
- `count` : le nombre de valeurs

On peut ensuite appliquer diverses fonctions.

Ex: le calcul de percentiles, via histogram_quantile()

##### Exemple
Exemple, un histogramme nommé http_request_duration_seconds :

- avec 5 poches ( 0.5 , 1 , 2 , 3 et 5 )
- ayant traité 3 requêtes qui ont respectivement duré 1s , 2s , 3s

```go
# HELP http_request_duration_seconds Request duration histogram
# TYPE http_request_duration_seconds histogram
http_request_duration_seconds_bucket{le="0.5"} 0
http_request_duration_seconds_bucket{le="1"} 1
http_request_duration_seconds_bucket{le="2"} 2
http_request_duration_seconds_bucket{le="3"} 3
http_request_duration_seconds_bucket{le="5"} 3
http_request_duration_seconds_bucket{le="+Inf"} 3
http_request_duration_seconds_sum 6
http_request_duration_seconds_count 3
```

#### Summary *(moins utilisé et plus compliqué)*
Ce type de métrique est l'équivalent d'un appel à histogram_quantile() mais traité coté client

- Deux métriques, `sum` et `count` , sont automatiquement ajoutées.
- Moins souple que l'histogramme et avec un certain nombre de limitations:
- Pas possible d'agréger les métriques si le service est distribué
- Besoin de connaître à l'avance les quantiles souhaités
- Plus consommateur en ressources au niveau du client
     
Je préconise l'utilisation des histogrammes pour ces besoins


---

# *Tips & Tricks*

## Documentations réseau

- <https://tls.ulfheim.net/>
- <https://www.frameip.com/>
