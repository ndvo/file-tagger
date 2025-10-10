#!/bin/bash 

read -p "Ver arquivos marcados com a TAG: " nome_tag # lê oque o usurário digitar e armazena na variável: nome_tag

caminho_da_tag=$(find / -name "$nome_tag" 2>/dev/null) # procuro se o diretório "nome_tag" existe, se sim, armazena seu caminho na variável: caminho_da_tag


if [ -n "$caminho_da_tag" ]; then # verifica se a variavel "caminho_da_tag" não está vazia e entao executa o próximo comando

	ls $caminho_da_tag #lista todos os arquivos dentro do diretório "nome_tag"

	
else
	echo "TAG:$nome_tag não encontrada, verifique se digitou corretamente"
	
fi

