######################################################
# Nome: Rosner Pelaes Nascimento 					 #
# Máteria: Programação Shell Scritp					 #	
# Curso: Pós Graduação em Redes de Computadores 	 #
# Unimep     								 		 #
# Tarefa - 2										 #
######################################################

#!/bin/bash
echo "Digite um site para Testar"
read site

wget $site 2> /dev/null
resultado=$?
case $resultado in

0)
echo "Código: $resultado - Site Correto!!!";;

1)
	echo "$resultado - Erro genérico";;
2)
	echo "$resultado - Erro de análise";;
3)
	echo "$resultado - Erro de I/O de arquivo";;
4)
	echo "$resultado - Falha na Rede";;
5)
	echo "$resultado - Falha na verificação SSL";;
6)
	echo "$resultado - Falaha na Autenticação de nome de Usuário e/ou Senha";;
7)
	echo "$resultado - Erro de Protocolo";;
8)
	echo "$resultado - Servidor emitiu uma resposta de erro";;

*)
echo "Erro não Catalogado";;
esac
