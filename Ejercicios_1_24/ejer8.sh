#!/bin/bash

echo "Dime un número: "
read num1

echo ""

echo "Dime otro número: "
read num2

echo ""

if [[ "$num1" -lt "$num2" ]]; then
	echo "El número $num2 es mayor"
elif [[ "$num1" -gt "$num2" ]]; then
	echo "El número $num1 es mayor"
else 
	echo "Ambos números son iguales"
fi
 

