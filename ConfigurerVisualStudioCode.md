---
title: Configurer Visual Studio Code
author: David DEBRAY
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
---
<link rel="icon" href="favicon.png" type="image/png" />

# Installer Python sur le Système
- [https://www.python.org/downloads/](https://www.python.org/downloads/)

## Windows
Install [Python from python.org](https://www.python.org/downloads/). You can typically use the **Download Python** button that appears first on the page to download the latest version.

> Note: If you don't have admin access, an additional option for installing Python on Windows is to use the Microsoft Store. The Microsoft Store provides installs of [Python 3.7](https://www.microsoft.com/en-us/p/python-37/9nj46sx7x90p) and [Python 3.8](https://www.microsoft.com/en-us/p/python-38/9mssztt1n39l). Be aware that you might have compatibility issues with some packages using this method.

For additional information about using Python on Windows, see [Using Python on Windows at Python.org](https://docs.python.org/3.7/using/windows.html).

### Windows Subsystem for Linux
**Windows Subsystem for Linux**: If you are working on Windows and want a Linux environment for working with Python, the [Windows Subsystem for Linux](https://docs.microsoft.com/windows/wsl/about) (WSL) is an option for you. If you choose this option, you'll also want to install the [Remote - WSL extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl). For more information about using WSL with VS Code, see [VS Code Remote Development](https://code.visualstudio.com/docs/remote/remote-overview) or try the [Working in WSL tutorial](https://code.visualstudio.com/docs/remote/wsl-tutorial), which will walk you through setting up WSL, installing Python, and creating a Hello World application running in WSL.

## MacOS
The system install of Python on macOS is not supported. Instead, an installation through Homebrew is recommended. To install Python using Homebrew on macOS use ``brew install python3`` at the Terminal prompt.

> Note On macOS, make sure the location of your VS Code installation is included in your PATH environment variable. [See these setup instructions](https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line) for more information.

## LINUX
The built-in Python 3 installation on Linux works well, but to install other Python packages you must install ``pip`` with [get-pip.py](https://pip.pypa.io/en/stable/installing/#installing-with-get-pip-py).


# Sources

- [Setting up a Python Development Environment in Sublime Text 3](https://www.youtube.com/watch?v=xFciV6Ew5r4)
- [https://code.visualstudio.com/docs/python/python-tutorial](https://code.visualstudio.com/docs/python/python-tutorial)

---

<p style="text-align: center"> [Template - Version PDF](template.pdf) </p>

---

