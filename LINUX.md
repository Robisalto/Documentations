---
title: LINUX
author: David DEBRAY
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
---
<link rel="icon" href="favicon.png" type="image/png" />

# Suspend & Wakeup Automatically
## Using RTCWAKE

```bash
sudo rtcwake -m disk --date 06:00
```

- [https://www.maketecheasier.com/alarm-automatically-power-on-linux/](https://www.maketecheasier.com/alarm-automatically-power-on-linux/)

### Script from [AskUbuntu.com](https://askubuntu.com/questions/61708/automatically-sleep-and-wake-up-at-specific-times)

This script is called **suspend_until** see ``/opt/Scripts``.
This script can be executed as **Root without Password**. See the contents of ``visudo`` or ``/etc/sudoers``:

```bash
# --------------------- My Scripts --------------------- #
# ------------------------------------------------------ #
# All scripts below can be executed as ROOT without      #
# PASSWORD. Be careful...                                #
# ------------------------------------------------------ #
david ALL=(ALL) NOPASSWD: /opt/Scripts/MountShares.sh
david ALL=(ALL) NOPASSWD: /opt/Scripts/suspend_until.sh

```

# Notifications using **Telegram**

[https://www.assistanz.com/get-server-notification-telegram-app/](https://www.assistanz.com/get-server-notification-telegram-app/)

## Requirements
1. ChatID
2. Token

Example:

```shell
#!/bin/bash

TOKEN=<TOKEN>
CHAT_ID=<CHAT_ID>
MESSAGE="Hello World"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="$MESSAGE"
```

# Start Scripts on System Reboot using **CRON**
Example of crontab:

```bash
# --------------------- My Scripts -------------------- #
# Mount Shares from Vali on Startup
@reboot /opt/Scripts/MountShares.sh
# VNC Server
@reboot /opt/Scripts/StartVNCServer.sh
# PRTG Monitoring
@reboot /opt/Scripts/AZGARD_Autostart.sh
```


<p style="text-align: center"> [LINUX - Version PDF](LINUX.pdf) </p>

---

---

