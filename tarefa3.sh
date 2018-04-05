######################################################
# Nome: Rosner Pelaes Nascimento 					 #
# Máteria: Programação Shell Scritp					 #	
# Curso: Pós Graduação em Redes de Computadores 	 #
# Unimep     								 		 #
# Tarefa - 3										 #
######################################################

#!/bin/bash
user=$1
if [ -z $1 ] || [ $# -gt $1 ]
then
	echo "Você não informou nenhum parametro"
else
   busca=$(cat /etc/passwd | grep $user | cut -d":" -f1)
if [ $user == $busca ]
then
	clear
	echo "Selecione a opção Desejada"
	echo "1 - Nome do Usuário"
	echo "2 - ID do Grupo do Usuário"
	echo "3 - home do Usuário"
	echo "4 - Shell do Usuário"
	echo "5 - Tamanho da pasta do Usuário"
	read op
     case $op in
	1)
		nome=$(cat /etc/passwd |grep $user | cut -d":" -f1)
		echo " Nome do Usuário: $busca";;
	2)
		id=$(cat /etc/passwd |grep $user | cut -d":" -f4)
		echo "ID do Grupo: $id";;

	3)
		home=$(cat /etc/passwd |grep $user | cut -d":" -f6)
		echo "Pasta Home do Usuário: $home";;

	4) 
		shell=$(cat /etc/passwd |grep $user | cut -d":" -f7)
		echo "Shell do Usuário: $shell";;

	5) 
		tamanho=$(du -lhs /home/$user | cut -f1)
		echo "Tamanho pasta Home do usuário $user: $tamanho";;
	*)
		echo "Nada funcionou";;
esac
else
	echo "Usuário não encontrado"
	echo "Deseja incluir Usuário [s/n]"
	read resposta
	if [ $resposta == "s" ]
	then
          adduser $user
fi
fi
fi
