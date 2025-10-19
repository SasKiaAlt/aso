#!/bin/bash

salida="archivos_peligrosos.txt"
tmp="temporal.txt"

touch "$salida"
touch "$tmp"

#ejecutamos el comando con find y lo pasamos a temporal

find /home/ -type f -exec ls -l {} \; > "$tmp"

awk '$1 ~ /rwx$/ { print }' "$tmp" > "$salida"

rm "$tmp"

echo "Se muestran los resultados en $salida"

