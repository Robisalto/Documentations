#!/bin/bash
cd /mnt/c/Users/david/MyDocuments/Documentations/
clear
echo " " > nav.txt
ls -R | grep  "md" > nav.txt
sed -i -e 's/.md//g' nav.txt

echo " " > PandocDoc.log # Clearing log file

## Light html theme
for n in $(cat nav.txt); do pandoc $n.md -s -c styleLight.css -A footer.html --toc -o KnowledgeBase/$n.html --log=PandocDoc.log ; done


## Default HTML theme
# for n in $(cat nav.txt); do pandoc $n.md -s -c styleDark.css -A footer.html --toc -o KnowledgeBase/$n.html; done

## TEST html theme
# for n in $(cat nav.txt); do pandoc $n.md -s -c test.css -A footer.html --toc -o KnowledgeBase/$n.html; done

## Mozilla html theme
# for n in $(cat nav.txt); do pandoc $n.md -s -c Mozilla.css -A footer.html --toc -o KnowledgeBase/$n.html; done

## Digital Ocean theme
# for n in $(cat nav.txt); do pandoc $n.md -s -c digitalocean.css -A footer.html --toc -o KnowledgeBase/$n.html; done




#### --------------------- Generate PDFs --------------------- ####
#### --------------------------------------------------------- ####

# read -r -p "Do you want to generate PDF files as well? [Y/n] " input
# case $input in 
# 	[yY][eE][sS]|[yY])
# 		for n in $(cat nav.txt); do pandoc $n.md --template=template.tex --pdf-engine=xelatex -o KnowledgeBase/$n.pdf; done
# 		;;
# 	[nN][oO]|[Nn])
# 		echo "Alright then, "
# 		;;
# 	*)
# 		echo "Eeeuu... Sorry man, dis not workin... ;("	
# 		;;
# esac

echo " "
echo " "
echo -e "\e[31;43m# --------------------- Contents of KnowledgeBase --------------------- #\e[0m"
echo " "
ls -al KnowledgeBase/ | grep "html"
echo " "
# ls -al KnowledgeBase/ | grep "pdf"
# echo " "
echo " "