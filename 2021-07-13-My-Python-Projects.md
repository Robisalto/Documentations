---
title: My Python Projects
author: David Debray
date: 2021-07-13
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
extensions: 'extra'
---
<link rel="icon" href="favicon.png" type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

# Video2Audio.py

Extract audio from video file. To do this we will use the `moviepy.editor` module.


```python
#!/usr/bin/python3

# ------- IMPORTS ------- #
import os, sys
import  shutil
import moviepy.editor 

# ------- FOLDERS VARIABLES ------- #
video_srcdir = "/home/david/dwhelper/"
audio_destdir = "/home/david/DATA/DL/MUSIC/FromDWHELPER/"
done_dir =  "/home/david/DATA/DL/MUSIC/ConvertedVids/"

# ------- PROGRAM START ------- #
list_of_vids = os.listdir(video_srcdir)
for file in list_of_vids:
    print(file)
    FileAndExt = os.path.basename(file)
    (filename, ext) = os.path.splitext(FileAndExt)
        
    video = moviepy.editor.VideoFileClip(video_srcdir+file)
    audio = video.audio
    audio.write_audiofile(audio_destdir+filename+".mp3")

    Vids2Move = os.path.join(video_srcdir, file)
    shutil.move(Vids2Move, done_dir)

```


# CODCALC.py

```python
# --------------------- Imports --------------------- #
# ___________________________________________________ #
import os

# --------------------- Variables --------------------- #
# _____________________________________________________ #
tailleMaj = float(input("Entrez la taille de la mise à jour (en GB): "))
tailleEnKilos = (tailleMaj * 1000000)
debit = float(input(" Rentrez la vitesse de téléchargement (en KB/s): "))

# --------------------- Functions --------------------- #
# _____________________________________________________ #
def TimeToDownload(seconds):
    minutes, seconds = divmod(seconds, 60)
    hours, minutes = divmod(minutes, 60)
    days, hours = divmod(hours, 24)
    weeks, days = divmod(days, 7)

    print("TimeToDownload()")
    print(int(weeks), 'weeks', int(days), 'days', int(hours),
          'hours', int(minutes), 'minutes', int(seconds), 'seconds')

# --------------------- Program --------------------- #
# ___________________________________________________ #
DelaiSecondes = (tailleEnKilos / debit)
print("Délai en Secondes: ", DelaiSecondes)
TimeToDownload(DelaiSecondes)

```