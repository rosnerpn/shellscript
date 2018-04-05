######################################################
# Nome: Rosner Pelaes Nascimento 					 #
# Máteria: Programação Shell Scritp					 #	
# Curso: Pós Graduação em Redes de Computadores 	 #
# Unimep     								 		 #
# Tarefa - 1										 #
######################################################

#!/bin/bash
echo "Bem Vindo $USER"
echo "Digite a opção desejada: 1 - Copiar | 2 - Exibir"
read opcao

case $opcao in
1)
  if [ -e /root/backup ]
   then
    cp -r /etc/network /root/backup
    cp /etc/resolv.conf /root/backup
    cp  -r /etc/passwd /root/backup
   else
    mkdir /root/backup
    cp -r /etc/network /root/backup
    cp /etc/resolv.conf /root/backup
    cp -r /etc/passwd /root/backup
fi;;
2)
  echo "Qual arquivo deseja exibir: ?"
	read arquivo
  	if [ -e /root/backup/$arquivo ] && [ $arquivo == "passwd" ]
        then
                cat /root/backup/passwd
        elif [ -e /root/backup/$arquivo ] && [ $arquivo == "network" ]
         then
            ls /root/backup/network

        elif [ -e /root/backup/$arquivo ] || [ $arquivo == "resolv" ]
         then
           cat /root/backup/resolv.conf
else
                echo "arquivo $arquivo não localizado"
               
fi;;
*)
  echo "Nenhum opção desejada";;
esac
