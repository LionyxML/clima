#!/bin/bash
# clima.sh - Extrator de previsão do tempo para cidades brasileiras 
#
# Requerimentos: w3m
# Autor        : Rahul Martim Juliato (rahul.juliato@gmail.com)
#
# Versão 1     : Inicial (18.09.2016)

ESTADO="sp"
CIDADE="indaiatuba"

[[ $1 ]] && CIDADE="$1"
[[ $2 ]] && ESTADO="$2"
[[ $3 ]] && {
    echo ERRO! Esperado no máximo 2 argumentos 
    echo Utilize: $(basename "$0") [cidade] [estado]
    exit 1
}

URL="http://tempo.folha.uol.com.br/"$ESTADO"/"$CIDADE""

echo -e "\nPrevisão do tempo para: "$CIDADE"-"$ESTADO""
w3m -dump "$URL" | sed -n "/CINCO/,/CINCO/p" | sed -n "/\//,+2p"
echo
