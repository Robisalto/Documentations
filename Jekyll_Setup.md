---
title: Jekyll setup
author: David DEBRAY
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
---
<link rel="icon" href="favicon.png" type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

--- 

## Introduction
Pour simplifier le **_bordel_** lié à l'installation de [Ruby](https://www.ruby-lang.org/en/) et à la maintenance des mises à jour, etc.

=> J'utiliserai pour ma Documentation une solution plus adaptée et plus intéressante, [Docker](https://www.docker.com/products/docker-desktop)!

### Sources & Bibliography

- <https://habd.as/post/simple-websites-jekyll-docker/>
- <https://odewahn.github.io/docker-jumpstart/>
- <https://mademistakes.com/work/jekyll-themes/>

### Steps

```
steps
│
└───Create Docker Image
    │   
    |    Install Docker
    |     Clone Jekyll seed
    |      Configure Docker host container
    |       Install Ruby dependencies
    |        Build and run container image locally
    |         Connect to Jekyll site
    |   
    └──────────Configure Server for Docker deployments
               │
               │    Create Docker Droplet
               │     Create New User
               │      Add SSH Key for Deployer
    

```






---

<p style="text-align: center"> [Jekyll setup - Version PDF](template.pdf) </p>

---

