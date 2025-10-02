#!/bin/bash

read -p "Introduce el número a comprobar: " num

if ((num < 2 )); then
	echo "El número $num no es primo"
	exit 0
fi

for ((i=2; i*i<=num; i++)); do
	((num % i == 0)) && { echo "$num no es primo"; exit 0; }
done

echo "$num es primo"

