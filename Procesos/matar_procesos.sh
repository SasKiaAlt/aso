#!/bin/bash

while true; do

	clear 
	echo "-------Gestión de Procesos-------"
	echo "1.- Mostrar procesos activos"
	echo "2.- Finalizar algún proceso"
	echo "3.- Salir"
	echo "----------------------------------"
	read -p "Elige un opción [1-3]: " opcion

	case $opcion in 
		1)
			echo 
			echo "Procesos activos"
			echo "-------------------------"
			ps -eo pid,user,ni,stat,comm --sort=ni
			echo "-------------------------"
			read -p "Pulsa enter para continuar..."
			;;

		2) 
			echo 
			ps -eo pid,user,ni,stat,comm --sort=ni
			echo
			read -p "Introduca el PID del proceso a finalizar: " pid
			echo 
			sudo kill -9 "$pid"
			echo
			echo "Se ha finalizado el proceso $pid"
			echo
			read -p "Pulse enter para continuar..."
			;;

		3) 
			echo "Saliendo...."
			exit 0
			;;

		*)
			echo "Opción no válida."
			exit 0
			;;

	esac
done

