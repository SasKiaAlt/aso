#!/bin/bash

while true; do

	clear 
	echo "-------Gestión de Procesos-------"
	echo "1.- Mostrar procesos activos"
	echo "2.- Cambiar prioridad de un procesos"
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
			read -p "Introduca el PID del proceso: " pid
			read -p "Introduce el nuevo valor (-20 [mucha prioridad] a 19 [poca prioridad]): " prioridad
			echo 
			sudo renice "$prioridad" -p "$pid"
			echo
			echo "Se muestra a contiuación el cambio aplicado..." 
			echo
			ps -eo pid,user,ni,stat,comm | grep "$pid"
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

