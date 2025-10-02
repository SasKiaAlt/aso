#!/bin/bash

#Creamos archivo
touch listado.txt

#Listamos /etc y lo guardamos en archivo
ls -a /etc > listado.txt

#mostramos contenido de archivo
cat listado.txt

#Contamos numeros y palabras 
lineas=$(wc -l < listado.txt)
palabras=$(wc -w < listado.txt)

#Mostramos por pantalla 
echo "Número de líneas: $lineas"
echo "Número de palabras: $palabras"
