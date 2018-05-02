#!/bin/bash
###############################################
#Nome: Rosner Pelaes Nascimento               #
#Materia: Programação Shell Script            #
#Curso: Pós Graduação em Redes de Computadores#
#Unimep										  #
#Prova Final								  #
###############################################
clear
while true
do
usuario=root
banco=prova_script
tabela=prova
echo "Bem Vindo ao Sistema de Cadastro - $USER##"
echo "Digite a opção desejada"
echo "1 - Cadastrar Usuário"
echo "2 - Consulta por nome"
echo "3 - Lista todos os usuários"
echo "4 - Deletar por nome"
echo "Sair do Sistema Ctrl+c"
echo "##############################################"
read menu
case $menu in
1)
	printf "Digite o Nome: "
	read nome
	printf "Digite o email: "
	read email
	printf "Digite o telefone: "
	read telefone
	sql="insert into $tabela (nome,email,telefone)values('$nome','$email','$telefone')"
	mysql -u $usuario -e "$sql" -D$banco
	status=$?

	if [ $status -eq 0 ]
	then
		echo "Usuário $nome cadastrado com sucesso"
	else
		echo "Não foi possivel cadastrar o usuário: $nome"
fi;;

2)
	 echo "Digite um nome para pesquisar: "
        read nome
        consulta=`mysql -uroot -e "select * from $tabela where nome = '$nome'" -D$banco`
		if [ -z $consulta ]
		then
			echo "Usuário $nome não localizado"
		else
			echo "$consulta"
		fi;;
		
3)
	echo "Listagem de todos usuário"
	echo "`mysql -uroot -e "select * from $tabela" -D$banco`";;
4)
	echo "Digite o nome que deseja deletar: "
	read nome
	consulta=`mysql -u$usuario -e "select * from $tabela where nome = '$nome'" -D$banco`
	if [ -z $consulta ]
	then
	echo "Usuário: $nome não pode ser excluido"
	else
	`mysql -u$usuario -e "delete from $tabela where nome = '$nome'" -D$banco`
	echo "Usuário: $nome excluido com sucesso"

fi;; 
*)
echo "Nenhuma opção seleceionada"

esac
done
