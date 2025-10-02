#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Debes pasar un parámetro"
	exit 1
fi

directorio="$1"

if [[ ! -d "$directorio" ]]; then
	echo "Error: $directorio no es un directorio válido!"
	exit 1
fi

contador=0

echo "Listado de entradas en $directorio"

for entrada in "$directorio"/*; do

	[[ ! -e "$entrada" ]] && continue

	if [[ -d "$entrada" ]]; then
		tipo="Directorio"
	elif [[ -f "$entrada" ]]; then
		tipo="Fichero"
	elif [[ -b "$entrada" ]];then
		tipo="Bloque"
	elif [[ -c "$entrada" ]]; then
		tipo="Carácter especial"
	elif [[ -L "$entrada" ]]; then
		tipo="Enlace simbólico"
	else
		tipo="Otro"
	fi

	echo "$entrada --> $tipo"
	((contador++))
done

if (( contador == 0 )); then
	echo "El directorio está vacio"
else
	echo ""
	echo "El número total de entradas procesadas es: $contador"
fi


