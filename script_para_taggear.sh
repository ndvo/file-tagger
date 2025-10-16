#!/bin/bash 

#chmod -x script_para_taggear.sh = comando para tornar executável no terminal

read -p "Qual o nome do arquivo que deseja taggear: " nome_arquivo # lê o nome do arquivo

caminho_do_arquivo=$(find / -name  "$nome_arquivo" 2>/dev/null) # procura se o arquivo existe, se sim, armazena seu caminho na váriavel: caminho_do_arquivo


if [ ! -d "$HOME/file-tagger/tags" ]; then  #se o diretório file-tagger/tags não existir, ele o cria

	mkdir $HOME/file-tagger/tags

fi



 #verifica se a variavel nao esta vazia
if [ -n "$caminho_do_arquivo" ]; then

	read -p "Qual o nome da tag: " nome_tag
	
	
	# verifica se o diretorio $nome_tag já existe
	if [ -d $HOME/file-tagger/tags/$nome_tag ]; then
	
		ln -s "$caminho_do_arquivo" "$HOME/file-tagger/tags/${nome_tag}/${nome_arquivo}_${nome_tag}" #cria um link simbólico para $nome_arquivo no diretorio $nome_tag
	
	else
	
		mkdir $HOME/file-tagger/tags/$nome_tag #cria no diretorio tags um subdiretorio chamado $nome_tag
	
		ln -s "$caminho_do_arquivo" "$HOME/file-tagger/tags/${nome_tag}/${nome_arquivo}_${nome_tag}" #cria um link simbólico para $nome_arquivo no diretorio $nome_tag
	fi
	
else
	echo "Arquivo não encontrado, verifique se digitou corretamente."
	
fi
	
