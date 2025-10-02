#!/bin/bash

suma_for=0

for ((i=1; i<=1000; i++)); do
	suma_for=$((suma_for + i))
done
echo ""
echo "Suma usando for: $suma_for"
echo ""

suma_while=0

i=1

while [ $i -le 1000 ]; do
	suma_while=$((suma_while + i))
	i=$((i + 1))
done

echo "" 
echo "Suma usando while: $suma_while"
echo ""

suma_until=0
i=1

until [ $i -gt 1000 ]; do
	suma_until=$((suma_until + i))
	i=$((i +1))
done

echo ""
echo "Suma usando until: $suma_until"
echo""


