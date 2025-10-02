#!/bin/bash

#Comprobamos que hayan 2 parámetros

if [ $# -ne 2 ]; then 
	echo "Error: Debes indicar 2 parametros. Origen y nombre copia."
	exit 1
fi

origen=$1
destino=$2

if [ ! -f "$origen" ]; then 
	echo "Error: El archivo $origen no exite o no es un archivo ordinario."
	exit 2
fi

if [ -e "$destino" ]; then
	echo "Error: Ya existe un archivo, directorio u objeto llamado: $destino."
	exit 3
fi

cp "$origen" "$destino"

echo "El archivo $origen se ha copiado correctamente como: $destino" 


