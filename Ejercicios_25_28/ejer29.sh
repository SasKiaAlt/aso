#!/bin/bash

archivo="informe_ip.txt"

obtener_ip_local() {
	ip_local=$(hostname -I | awk '{print $1}')
	echo "$ip_local"
}

obtener_prefijo_ip() {
	ip_local="$1"
	prefijo=$(echo "$ip_local" | cut -d'.' -f1-3)
	echo "$prefijo"
}

comprobar_ip_red() {
	prefijo="$1"
	echo "Analizando red ${prefijo}.0/24..."
	echo ""
	echo "Informe de IP en la red ${prefijo}.0/24" > $archivo
	echo "Fecha: $(date)" >> $archivo
	echo "" >> $archivo

	for i in $(seq 1 254); do
		ip="${prefijo}.${i}"
		if ping -c 2 -W 2 "$ip" &>/dev/null; then
			echo "$ip >> OCUPADA"
			echo "$ip >> OCUPADA" >> $archivo
		else
			echo "$ip >> LIBRE"
			echo "$ip >> LIBRE" >> $archivo
		fi
	done

	echo ""
	echo "Informe generado: $archivo"
}


ip_local=$(obtener_ip_local)
echo "IP local es: $ip_local"

prefijo=$(obtener_prefijo_ip "$ip_local")
echo "Prefijo de red: $prefijo"

comprobar_ip_red "$prefijo"

