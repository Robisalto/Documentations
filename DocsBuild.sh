#!/bin/bash
cd /mnt/c/Users/Admin stagiaire.DESKTOP-8967908/GitHub/Documentations
clear
echo " " > nav.txt

ls -R | grep "md" > nav.txt
sed -i -e 's/.md//g' nav.txt

for n in $(cat nav.txt); do pandoc $n.md -s -c styleDark.css -A footer.html --toc -o KnowledgeBase/$n.html; done


echo ""
echo "" 
echo -e "Contents of KnowledgeBase: "
echo "" 
ls -al KnowledgeBase/ | grep "html"
echo ""
