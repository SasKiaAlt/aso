#!/bin/bash

echo ""
echo "Vamos a multiplicar un número"
echo ""
read -p "Dime cual será: " num

echo ""

for (( i=1; i<=10; i++)); do 
	resultado=$((i * $num))
	echo "$i x $num = $resultado"
done

echo ""
