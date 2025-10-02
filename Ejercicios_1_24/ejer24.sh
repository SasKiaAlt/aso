#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Debes pasar un parámetro"
	exit 1
fi

direct="$1"

if [[ ! -d "$direct" ]]; then
	echo "No has pasado un directorio o no existe"
	exit 1
fi

directorios=0
ficheros=0

for entrada in "$direct"/*; do

	[[ ! -e "$entrada" ]] && continue

	if [[ -d "$entrada" ]]; then
		((directorios++))
	elif [[ -f "$entrada" ]]; then
		((ficheros++))
	fi
done

echo
echo "Estadísticas del directorio $direct"
echo
echo "Ficheros encontrados: $ficheros"
echo
echo "Directorios encontrados: $directorios"
echo

