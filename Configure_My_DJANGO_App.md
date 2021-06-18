---
title: Configure My DJANGO App
author: David DEBRAY
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
---
<link rel="icon" href="favicon.png" type="image/png" />

## Introduction & Sources

This article decribes the configuration how my Django Apps.
Link to the Apps:

- [DDresume](https://ddresume.herokuapp.com/#) on Heroku


# Activate DJANGO Login
To activate Django Login, see: <https://www.digitalocean.com/community/tutorials/how-to-enable-and-connect-the-django-admin-interface>

## Modifiy Django configuration
**Move** to the Virtual Environment:
```bash
$ cd  ~/MyDocuments/Documentations/KnowledgeBase/Build_a_Resume_Website_With_Python_and_Django/djangoresume/
```

**Activate** the Virtual Environment:
```bash
$ source MyVirtualEnv/Scripts/activate
```

Then **create** the **superuser**:
```bash
python manage.py createsuperuser
```





---

<p style="text-align: center"> [Configure My DJANGO App - Version PDF](template.pdf) </p>

---

