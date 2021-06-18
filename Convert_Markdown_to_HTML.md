---
title: How To Use Python-Markdown to Convert Markdown Text to HTML
author: Digital Ocean Tutorials
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
---
<link rel="icon" href="favicon.png" type="image/png" />

![](Convert_Markdown_to_HTML/DigitalOcean.png)

<https://www.digitalocean.com/community/tutorial_series/how-to-build-a-website-with-css>

## Prerequisite: Setup Python Programming Environement

- On Windows 10: <https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-local-programming-environment-on-windows-10>

<span class='info'> Although it's easier to use **GitBash** 😉 </span>

- On MacOS: <https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-local-programming-environment-on-macos>

### Build Programming Environment:

```bash
# Upgrade PIP
python -m pip install --upgrade pip

# Creates the Virtual Environement folder "Environments"
mkdir Environments
cd Environments

# Builds the Virtual Environement
python -m venv my_env

# Activates the Virtual Environement
my_env\Scripts\activate
```

# Introduction

[Markdown](https://daringfireball.net/projects/markdown/) is a markup language commonly used to simplify the process of writing content in an easy-to-read text format, which a software tool or programming library can convert into [HTML](https://www.digitalocean.com/community/tags/html) to display in a browser or another writing program. Because it uses plain-text syntax, Markdown is compatible with any text editor and can convert headings, lists, links, and other components. Bloggers, tutorial authors, and documentation writers use Markdown widely and websites, such as [Github](https://github.com/), [StackOverflow](https://stackoverflow.com/), and [The Python Package Index (PyPI)](https://pypi.org/), support it.

You can learn how to use Markdown from the [Markdown syntax](https://daringfireball.net/projects/markdown/syntax) standard. Alternatively, you can also try a different Markdown implementation in a web editor, like the [DigitalOcean Markdown Preview](https://www.digitalocean.com/community/markdown) or the [StackEdit](https://stackedit.io/) editor.

[Python-Markdown](https://python-markdown.github.io/) is a Python library that allows you to convert Markdown text to HTML in various ways. You can extend its functionality using its different [extensions](https://python-markdown.github.io/extensions/) that provide additional features. Note however, that the Python-Markdown has a few minor [differences with the standard Markdown syntax](https://python-markdown.github.io/#differences).

In this tutorial, you will install the [Python-Markdown](https://python-markdown.github.io/) library, use it to convert Markdown strings to HTML, convert Markdown files to HTML files, and use the Python-Markdown command line interface to convert Markdown to HTML.


# Prerequisites
Before you start following this guide, you will need:

  + A local Python 3 programming environment. Follow the tutorial for your distribution in the [How To Install and Set Up a Local Programming Environment for Python 3](https://www.digitalocean.com/community/tutorial_series/how-to-install-and-set-up-a-local-programming-environment-for-python-3) series. In this tutorial, we’ll call our project directory ``pymark``.

  + An understanding of basic Python and HTML concepts, You can review our [How To Code in Python 3](https://www.digitalocean.com/community/tutorial_series/how-to-code-in-python-3) and [How To Build a Website with HTML](https://www.digitalocean.com/community/tutorial_series/how-to-build-a-website-with-html) tutorial series for background knowledge.

# 1. Installing Python-Markdown
n this step, you will install Python-Markdown and explore one of its functions to convert Markdown strings to HTML in the [Python REPL](https://www.digitalocean.com/community/tutorials/how-to-work-with-the-python-interactive-console).

If you haven’t already activated your programming environment, make sure you’re in your project directory (``pymark``) and use the following command to activate the environment:

```bash
$ source env/bin/activate
```

Once you have activated your programming environment, your prompt will now have an ``env`` prefix like the following:

```bash
(env)sammy@localhost:$
```

Now you’ll install Python packages and isolate your project code away from the main Python system installation.

Use ``pip`` to install the Python-Markdown library (``markdown``) by running the following command:

```bash
(env)sammy@localhost:$ python
```

You will notice a new prompt with the prefix ``>>>``; you can use this to type in Python code and receive immediate output.

First you will import the ``markdown`` package and use it to convert a piece of Markdown text from Markdown syntax to HTML:

```python
import markdown
markdown.markdown('#Hi')
```

In this code, you import the ``markdown`` package you installed earlier. You use the ``markdown.markdown()`` function to convert the Markdown text ``#Hi`` (with ``#`` representing an H1-level header) to its HTML equivalent. If you type the code into the Python REPL, you will receive the following output:

```html
<!-- Output -->
'<h1>Hi</h1>'
```

The HTML output is the equivalent of the ``#Hi ``Markdown text.

You can use triple single quotes (``'''``) to type multi-line Markdown text into the Python REPL like so:

```python
import markdown
output = markdown.markdown('''
# Step 1
## Step 2
* item 1
* item 2

Visit [the tutorials page](https://www.digitalocean.com/community/tutorials) for more tutorials!
''')
print(output)
```

In this example, you pass an H1 header, an H2 header, two list items, and a paragraph containing a link. You then save the output in a variable called ``output`` and print it with the ``print()`` Python function.

You will receive the following output:

```html
Output
<h1>Step 1</h1>
<h2>Step 2</h2>
<ul>
<li>item 1</li>
<li>item 2</li>
</ul>
<p>Visit <a href="https://www.digitalocean.com/community/tutorials">the tutorials page</a> for more tutorials!</p>
```

You’ll notice that the output results in the HTML version of the provided Markdown text.

Now that you’ve used the ``markdown`` package to convert Markdown text to HTML, you will make a small program to read and convert Markdown files to HTML files.


# 2. Creating a Program to Convert Markdown Files to HTML
In this step, you will create a Python program that reads a Markdown file, converts its contents to HTML using the ``markdown.markdown()`` function, and saves the HTML code in a new file.

First, open a new file called ``Picnic.md`` to hold the Markdown text:

```bash
(env)sammy@localhost:$ nano Picnic.md
```

Type the following Markdown text into it:

```markdown
[label pymark/Picnic.md]

# Things to bring

* Food.
* Water.
* Knife.
* Plates.
```

In this file you have an H1 header and four list items.

Once you’re done, save and close the file.

Next, open a new file called ``convert.py`` to hold the code for converting the ``Picnic.md`` Markdown file to an HTML file:

```bash
(env)sammy@localhost:$ nano convert.py
```

Type the following Python code into it:

```python
import markdown

with open('Picnic.md', 'r') as f:
    text = f.read()
    html = markdown.markdown(text)

with open('Picnic.html', 'w') as f:
    f.write(html)
```

Here, you first import the ``markdown`` package. You use the ``open()`` function to open the ``Picnic.md`` file; passing the value ``'r'`` to the mode parameter to signify that Python should open it for reading.

You save the file object in a variable called ``f``, which you can use to reference the file. Then you read the file and save its contents inside the ``text`` variable. After, you convert the text using ``markdown.markdown()``, saving the result in a variable called ``html``.

With the same pattern, you open a new file called ``Picnic.html`` in writing mode (``'w'``)—note that this file does not yet exist—and write the contents of the ``html`` variable to the file. This creates and saves the new file on your system. Using the ``with`` statement when opening a file guarantees that Python will close it once processing has finished.

Save and close the file.

Run the ``convert.py`` program:

```bash
(env)sammy@localhost:$ python convert.py
```

This creates a new file called ``Picnic.html`` in your project directory with the following contents:

```html
[Label: pymark/Picnic.html]

<h1>Things to bring</h1>
<ul>
<li>Food.</li>
<li>Water.</li>
<li>Knife.</li>
<li>Plates.</li>
</ul>
```

Now that you know how to open and convert Markdown files using the ``markdown.markdown()`` function, you can generate Markdown text in Python and convert Markdown files without the need to read them first.


# 3. Generating Markdown from Data and Converting it to HTML
In this step, you will create a program that generates Markdown text from a Python dictionary, saves it to a Markdown file, and converts the Markdown text to an HTML file using the ``markdown.markdownFromFile()`` function.

Your program will generate a Markdown file called cities.md with a list of countries and their top three largest cities. After, the program will convert the generated Markdown text into HTML, then it will save the HTML in a file called ``cities.html``.

First open a new Python file called ``citygen.py``:

```bash
(env)sammy@localhost:$ nano citygen.py
```

Then add the following Python code:

```python
# [Label: pymark/citygen.py]

import markdown


country_cities = {'Japan': ['Tokyo', 'Osaka', 'Nagoya'],
                  'France': ['Paris', 'Marseille', 'Lyon'],
                  'Germany': ['Berlin', 'Hamburg', 'Munich'],
                  }
```

In this code you first import the Python-Markdown library with ``import markdown``. Then you define a ``country_cities`` dictionary containing a few countries as the keys and a [list](https://www.digitalocean.com/community/tutorials/understanding-lists-in-python-3) of the largest three cities for each country as the value. This dictionary is an example data structure; you can replace it with fetched data from a web API, a database, or any other data source.

Next add the following code after your dictionary:

```python
# [Label: pymark/citygen.py]

. . .
with open('cities.md', 'bw+') as f:
    for country, cities in country_cities.items():
        f.write('# {}\n'.format(country).encode('utf-8'))
        for city in cities:
            f.write('* {}\n'.format(city).encode('utf-8'))
    f.seek(0)
    markdown.markdownFromFile(input=f, output='cities.html')
```

After constructing the dictionary that holds the data, you use the ``with open(...) as ...`` syntax to open a file called ``cities.md``, which doesn’t exist yet. You open it in binary mode (``'b'``) for writing and reading (``'w+'``). You use binary mode, because if you pass a string to ``markdown.markdownFromFile()``, it will be interpreted as a path to a readable file on the file system (that is, ``'/home/file.md'``). Also [binary mode](https://python-markdown.github.io/reference/#markdownFromFile) allows you to avoid issues related to converting characters to a platform-specific representation; this guarantees that the Python program will behave the same way on any platform.

You then go through the dictionary’s items extracting each key that contains the country’s name and saving it in the ``country`` variable. Alongside this, you extract the value that represents the list of the country’s largest cities and save it in the ``cities`` variable.

Inside the first loop, you write the country’s name to the new ``cities.md`` file in a ``#`` Markdown header (the ``<h1>`` HTML tag). ``\n`` is a special character for inserting a new line. You use ``.encode()`` because you have opened the file in binary mode. The second ``for`` loop iterates through each city and writes its name to the Markdown file as a ``*`` list item (the ``<li>`` HTML tag).

After the first loop finishes, you have moved to the end of the file, which means ``markdown.markdownFromFile()`` won’t be able to read its contents; therefore, you use ``f.seek(0)`` to go back to the top of the file. Before passing the ``f`` object to ``markdown.markdownFromFile()`` as input, to convert it to HTML and save it to a new file called ``cities.html``.

Once you’re done, save and close the file.

Run the ``citygen.py`` program:

```bash
(env)sammy@localhost:$ citygen.py
```

This command will generate two files:

- ``cities.md``: A Markdown file with the following contents:

```markdown
<!-- [Label: pymark/cities.md] -->

# Japan
* Tokyo
* Osaka
* Nagoya
# France
* Paris
* Marseille
* Lyon
# Germany
* Berlin
* Hamburg
* Munich
```

- **cities.html**: An HTML file that contains the result of converting the contents of **cities.md**:

```html
<!-- [Label:pymark/cities.html] -->

<h1>Japan</h1>
<ul>
<li>Tokyo</li>
<li>Osaka</li>
<li>Nagoya</li>
</ul>
<h1>France</h1>
<ul>
<li>Paris</li>
<li>Marseille</li>
<li>Lyon</li>
</ul>
<h1>Germany</h1>
<ul>
<li>Berlin</li>
<li>Hamburg</li>
<li>Munich</li>
</ul>
```

You can also use the function **markdown.markdownFromFile()** to convert an existing Markdown file. For example, you can convert the **Picnic.md** file to a file called **Picnic-out.html** using the following code:

```python
# [Label: example.py]

import markdown

markdown.markdownFromFile(input='Picnic.md', output='Picnic-out.html')
```

You can use the ``markdown.markdownFromFile()`` function to directly convert a file, if the file does not need any modification. If you do need to modify the Markdown file, you can read it, then convert it using the method demonstrated in [**Step 2**](#creating-a-program-to-convert-markdown-files-to-html).

You’ve converted Markdown text to HTML in Python code, but Python-Markdown also provides a helpful command line interface (CLI) to quickly convert Markdown files to HTML—you’ll review this tool in the next step.

# 4. Using Python-Markdown’s Command Line Interface
In this step you will use Python-Markdown’s CLI to convert a Markdown file to HTML and print the output, or save it to an HTML file.

You can run the Python-Markdown command line script using the ``-m`` flag supported by Python, which runs a library module as a script. For example, to convert a Markdown file, you can pass it to the ``markdown`` command as follows, replacing ``filename.md`` with the name of the file you want to convert:

```bash
(env)sammy@localhost:$ python -m markdown filename.md
```

Executing this command will print the HTML code for the Markdown text that’s present in the ``filename.md`` file.

For example, to convert the ``Picnic.md`` file, run the following command:

This will print the following output:

```html
<!-- Output -->
<h1>Things to bring</h1>
<ul>
<li>Food.</li>
<li>Water.</li>
<li>Knife.</li>
<li>Plates.</li>
</ul>
```

To save the output to a file called output.html, use the following command:

```bash
(env)sammy@localhost:$ python -m markdown Picnic.md -f output.html
```
 
With this, you’ve now used the ``markdown`` command line interface to convert a Markdown file to HTML.

# Conclusion

In this tutorial, you have used Python to convert Markdown text to HTML. You can now write your own Python programs that take advantage of the Markdown syntax in different contexts, such as web applications using a web framework like [Flask](https://www.digitalocean.com/community/tags/flask) or [Django](https://www.digitalocean.com/community/tags/django). For a tutorial on how to build an app with Python-Markdown and Flask, read [How To Use Python-Markdown with Flask and SQLite](https://digitalocean.com/community/tutorials/how-to-use-python-markdown-with-flask-and-sqlite).

For more on how to use Markdown, check out the [Markdown website](https://daringfireball.net/projects/markdown/). For more information on using Markdown with Python, check out the [Python-Markdown documentation](https://python-markdown.github.io/).

Here are a few extensions officially supported by Python-Markdown:

  + [Extra](https://python-markdown.github.io/extensions/extra/): An extension that adds extra features to the standard Markdown syntax, such as defining abbreviations, adding attributes to various HTML elements, footnotes, tables, and other features.
  + [CodeHilite](https://python-markdown.github.io/extensions/code_hilite/): An extension that adds syntax highlighting to code blocks.
  + [Table of Contents](https://python-markdown.github.io/extensions/toc/): An extension that generates a table of contents from a Markdown document and adds it into the resulting HTML document.



---

<p style="text-align: center"> [How To Use Python-Markdown to Convert Markdown Text to HTML - Version PDF](template.pdf) </p>

---

