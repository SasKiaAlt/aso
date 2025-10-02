#!/bin/bash

echo "¡Buenas! Dime que es lo que quieres hacer: "

echo "Menú matemático"
echo "1) Sumar"
echo "2) Resta"
echo "3) Multiplicación"
echo "4) División"
echo ""
read -p "Elige una opción (1-5): " opcion

re='^-?[0-9]+([.][0-9]+)?$'

case $opcion in
	1) 
		read -p "Dime el primer número:" num1
		read -p "Dime el segundo número:" num2
		if [[ $# -eq 2 && $num1 =~ $re && $num2 =~ $re ]]; then
			suma=$(echo "$num1 + $num2" | bc)
			echo "La suma de $num1 y $num2 es igual: $suma"
		else
			echo "No has pasado números o te falta alguno"
		fi
		;;
	2) 
		read -p "Dime el primer número: " num1
		read -p "Dime el segundo número: " num2
		if [[ $# -eq 2 && $num1 =~ $re && $num2 =~ $re ]]; then
			resta=$(echo "$num1 - $num2" | bc)
			echo "La resta de $num1 y $num2 es igual: $resta"
		else
			echo "No has pasado números o te falta alguno"
		fi
		;;
	3) 
		read -p "Dime el primer número: " num1
		read -p "Dime el segundo número: " num2
		multi=$(echo "scale=2; $num1 * $num2" | bc)
		echo "La multiplicación de $num1 y $num2 es igual: $multi"
		;;
	4) 
		read -p "Dime el primer número: " num1
		read -p "Dime el segundo número: " num2
		if [ "$num2" == 0 ]; then
			echo "No se puede dividir por 0"
		else
			division=$(echo "scale=2; $num1 / $num2" | bc)
			echo "La división de $num1 y $num2 es igual: $division"
		fi
		;;
esac


