#!/bin/bash

num_win=60

echo "Bienvenido al juego de adivinar el número (1-100)"
echo
echo "Introduce 0 su quieres rendirte"
echo

while true; do
	read -p "Dime el número: " num

	if [[ $num -eq 0 ]];then
		echo "Te has rendido!"
		echo "El número era: $num_win"
		exit 0
	fi

	if [[ $num == $num_win ]]; then
		echo "Enhorabuena!! Has acertado!!"
		echo "El número era: $num_win"
		exit 0
	fi

	if [[ $num -lt $num_win ]]; then
		echo "El número es más grande"
	else 
		echo "El número es más pequeño"
	fi
done

