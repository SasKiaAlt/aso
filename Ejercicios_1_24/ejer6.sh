#!/bin/bash

echo "Dime una palabra: " 
read palabra

echo ""

echo "La agregamos al archivo:"

#Pasamos la palabra al archivo

touch lista.txt

echo "$palabra" >> lista.txt

cat lista.txt


