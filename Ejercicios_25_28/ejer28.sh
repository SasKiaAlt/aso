#!/bin/bash

archivo="$1"

if [[ $# -ne 1 ]]; then 
	echo "Debes pasar un parámetro"
	exit 1
fi

existe () {
	if [[ ! -f "$archivo" ]]; then
		echo "Debes pasar un archivo como parámetro"
		exit 1
	else
		chmod u+x,go-x $archivo
		echo ""
		echo "Permisos de ejecución cambiados para propietario del archivo $archivo"
		ls -l $archivo
		echo ""
	fi

}

existe

