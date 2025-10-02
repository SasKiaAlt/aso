#!/bin/bash

if [[ $# -eq 1 && -d "$1" ]]; then
	fecha=$(date +%F)
	nombre=$(basename "$1")
	tar -czf "${fecha}_${nombre}.tar.gz" "$1" && echo "Archivo creado: ${fecha}_${nombre}.tar.gz"
else 
	echo "No has pasado un parámetro válido"
fi

