#!/bin/bash

echo "¡Veamos si el número que me das es par o impar!"

echo ""

read -p "Por favor dime el número que quieres comprobar: " num

echo ""

if ((num % 2 == 0)); then 
	echo "Tu número $num es: PAR"
else 
	echo "Tu número $num es: IMPAR"
fi


