#!/bin/bash

echo ""
echo "AGENDA"
echo ""
echo "============================"
echo "1) Añadir registro"
echo "2) Buscar"
echo "3) Listar todos los registros"
echo "4) Odenar alfabéticamente" 
echo "5) Borrar agenda"
echo "6) Salir"
echo "============================="
echo ""

read -p "Dime que quieres hacer [1 al 6]: " seleccion

archivo="agenda.txt"

case $seleccion in

	1) 
		read -p "Dime el nombre: " nombre
		read -p "Dime el apellido: " apellido
		read -p "Dime su número de teléfono: " phone
		echo "$nombre, $apellido, $phone" >> "$archivo"
	;;

	2)
	if [ ! -f $archivo ] || [ ! -s $archivo ]; then
		echo "El archivo no existe o está vacío, comprueba que se haya guardado algún registro."
	else
		read -p "Introduce el dato a buscar (nombre, apellido o teléfono): " busqueda
		echo ""
		echo "Resultado de la búsqueda: "
		grep -i "$busqueda" "$archivo"
		echo ""
	fi
	;;
	3)
	if [ ! -f $archivo ] || [ ! -s $archivo ]; then
		echo "No existe ningún registro guardado. "
	else
		echo "Se muestra la agenda completa:"
		echo ""
		cat "$archivo"
		echo ""
	fi
	;;

	4)
	if [ ! -f $archivo ] || [ ! -s $archivo ]; then
		echo "No existe ninguna agenda o registro, por favor crea registros primero."
	else
		echo "Agenda ordenada alfabéticamente:"
		echo ""
		sort "$archivo"
		echo ""
	fi
	;;

	5)
	if [ ! -f $archivo ]; then
		echo "La agenda no existe"
	else
		read -p "Estas seguro de que quieres borrar la agenda: " confirma
		if [ "$confirma" == "s" ] || [ "$confirma" == "S" ]; then
			rm "$archivo"
			echo "Archivo borrado correctamente"
		else
			echo "Se ha cancelado el borrado."
		fi
	fi
	;;
	6)
	echo ""
	echo "Hasta la próxima!"
	echo ""
	exit 0
	;;

esac 

