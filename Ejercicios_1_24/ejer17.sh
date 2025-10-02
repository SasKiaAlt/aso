#!/bin/bash

suma=0

echo "Introduce 0 si quieres terminar"

while  true;do

	read -p "Dime que número quieres sumar: " num

	if [[ $num -eq 0 ]]; then
		echo "La suma total es de: $suma"
		exit 0
	fi

	suma=$(( suma + num ))
	echo "Llevas sumado: $suma"
done

