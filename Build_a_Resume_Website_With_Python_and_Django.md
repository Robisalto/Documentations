---
title: Build a Resume Website With Python and Django
author: Codemy.com
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
---
<link rel="icon" href="favicon.png" type="image/png" />

# Tutorial on Youtube:

<iframe width="600" height="337" src="https://www.youtube.com/embed/F5WXNI3Dq8U" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Tools:
- Python
- Django
- Sublime Text
- GitBash Terminal

### Prerequisites

Install **pip**:
```bash
sudo apt update
sudo apt install python3-pip
sudo apt-get install python3-venv
```

# Procedure
## Environment configuration
### 1. Virtual Environment
1. To **install** the virtual environment:
```bash
pip3 install virtualenv
```

2. To **create** the virtual environment:
```bash
python3 -m venv MyVirtualEnv
```

3. To **activate** the virtual environment:
```bash
source MyVirtualEnv/Scripts/activate
# OR
source MyVirtualEnv/bin/activate # Linux
```

4. Installing **Django**:
```bash
pip install django # Install the lastest version of Django
```

5. To **see what is installed** within the virtual environment:
```bash
pip freeze

# Result:
asgiref==3.3.1
Django==3.1.7
pytz==2021.1
sqlparse==0.4.1
```

6. Create **Django Project**:
```bash
django-admin.py startproject MyDjangoResume

# Contenu du s
ls
MyDjangoResume/  MyVirtualEnv/
```

7. Move into _MyDjangoResume/_:
```
cd MyDjangoResume/
```

8. Migrate Database:
```bash
# Sur GitBash
winpty python manage.py migrate

```

9. Run the server:
```bash
python manage.py runserver
```

Then go to: http://127.0.0.1:800

If Django is installed then you should see this:
![mange.py runserver](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\runserver.png)

## Start Project
### Sublime Text
- open Sublime Text
- Project -> Add Folder to Project...

![](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\addfoldertoproject.png)

### Create New **APP**
In the Terminal *(Cmder)*:

```bash
python manage.py startapp ResumeSite
```

Dans **Sublime Text**:

![](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\ResumeSite.png)



# Initialise **Git**

To initialize **Git**, use:
```bash
git config --global user.name "David Debray"
git config --global user.email "david.debray@protonmail.com"
git config --global push.default matching
git config --global alias.co checkout
git init 


# Add to repository
git add .
git commit -am 'initial commit'
```


# Configure **Heroku**

Install **Heroku**  from <https://devcenter.heroku.com/articles/heroku-cli#download-and-install>. Then restart *Cmder.exe*

```bash
# Verifying Heroku install:
heroku -v
  # Result
heroku/7.51.0 win32-x64 node-v12.21.0
```

## SSH Keys for Heroku Connection

- Create new **ssh folder**: ``mkdir ~/.ssh``
- Moving into *~/.ssh*: ``cd ~/.ssh``
- To create the ssh keys: ``ssh-keygen.exe``

![](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\ssh_key.png)

<span class='info'>👉 INFO: cd to *../MyDjangoResume*, until you can see: _**(master)**_</span>

### Login into **Heroku**
In Terminal: ``heroku login`` and open browser. In console:

![](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\heroku_login.png)

### Add SSH KEYS to Heroku
In Terminal: ``heroku keys:add``

![](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\heroku_upload_keys.png)

<span class="info"> 👉 INFO: Previoulsy created keys were not detected... No matter new keys have been **generated** and **uploaded** :D </span>

### Prepare App for Upload to Heroku
In active folder create *Procfile*: ``touch Procfile``.

![](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\Heroku_Procfile.png)

> ***gunicorn*** is a webserver for Django ;)

<span class="warning"> WARNING: Do not forget to install *gunicorn*. ``pip install gunicorn`` </span>

In *settings.py*, add:
```python
import django_heroku
from decouple import config
import dj_database_url
```

In Terminal, install those libraries:
```bash
pip install django_heroku
pip install python-decouple
pip install dj_database_url
```

Installed packages:

![](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\2021-03-22_18h16_36.png)

To use _whitenoise==5.2.0_ we need to modify the _settings.py_:

- In the *MIDDLEWARE* section add the line:

![](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\2021-03-22_18h19_27.png)

- In the end of the file, in the *STATIC* section:

![](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\2021-03-22_18h31_44.png)

## Build **requirements.txt**

In the terminal: ``pip freeze > requirements.txt``

![](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\requirements_txt.png)

# Save to **Git** & **Heroku**
## Save to **Git**
In the Terminal:

```bash
git add .
git commit -am 'Heroku config'

```

## Save to **Heroku**
To create a new app on Heroku:

![](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\heroku_create.png)

To **rename** the Heroku App:

```bash
heroku rename ddresume
```

![](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\heroku_rename.png)

Result:

![](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\heroku_rename2.png)


### Push code to Heroku
```bash
git push heroku master
```

<span class='alert'>  **⚠️ ALERT:** Failed to push! </span>

![](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\heroku_push_fail.png)

<span class="success"> To solve this: ``heroku config:set DISABLE_COLLECTSTATIC=1`` </span>

Result on <https://dashboard.heroku.com/apps/ddresume/activity>:

![](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\heroku_activity.png)

<span class="alert"> **⚠️ ALERT:** Another error ! </span>

![](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\heroku_error.png)



<span class='info'> **Info:** To check and solve problems
👉 **heroku logs** </span>

<span class='info'> **Info:** To Restart Heroku 👉 **heroku restart** </span>

Then rebuilt & upload:
```bash
git add .
git commit -am 'update comment'
git push heroku master
```

<span class="success"> 👌 SUCCESS: Yes it works !!! 👌✌️😆😆 </span>

![](Build_a_Resume_Website_With_Python_and_Django\MarkdownFiles\heroku_success.png)

Link to app: <https://ddresume.herokuapp.com/>


# Add Heroku App to Domain Name
The End of the Tutorial is about the inscription of a **Domain Name**.

Popular Domain Name Providers:

- [GoDaddy](https://fr.godaddy.com/domainsearch/find?checkAvail=1&domainToCheck=DavidDebray)
- [NameCheap](https://www.namecheap.com/domains/registration/results/?domain=daviddebray)


---

<p style="text-align: center"> [Build a Resume Website With Python and Django - Version PDF](Build_a_Resume_Website_With_Python_and_Django.pdf) </p>

---

