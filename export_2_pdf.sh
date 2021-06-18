#!/bin/sh
cd /mnt/c/Users/david/MyDocuments/Documentations/
clear
echo " " > nav.txt
ls -R | grep  "md" > nav.txt
sed -i -e 's/.md//g' nav.txt

for n in $(cat nav.txt); do pandoc $n.md --template=template.tex --pdf-engine=xelatex -o KnowledgeBase/$n.pdf; done

echo "# --------------------- Contents of KnowledgeBase --------------------- #"
ls -al KnowledgeBase/ | grep "pdf"
echo "# ---------------------------------------------------------------------- #"
echo " "