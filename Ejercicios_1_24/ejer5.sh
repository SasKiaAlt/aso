#!/bin/bash

echo "Dime un número: "
read num1

echo "Dime otro número: "
read num2

resultado=$(echo "scale=2; ($num1 + $num2) / 2" | bc)

echo "El resultado de la media aritmética es: $resultado"


