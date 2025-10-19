#!/bin/bash

archivo="agenda.csv"

validar_telefono() {
	if [[ $1 =~ ^[0-9]{9}$ ]]; then
		return 0
	else 
		return 1
	fi
}

validar_email() {
	if [[ $1 =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]; then
		return 0
	else
		return 1
	fi
}

imprimir_menu() {
echo ""
echo "AGENDA"
echo ""
echo "============================"
echo "1) Añadir registro"
echo "2) Buscar"
echo "3) Listar todos los registros"
echo "4) Ordenar alfabéticamente"
echo "5) Modificar registro" 
echo "6) Borrar agenda"
echo "7) Salir"
echo "============================="
echo ""
}

#1
agregar_contacto() {
	read -p "Dime el nombre: " nombre
	read -p "Dime el apellido/s: " apellido
	read -p "Dime su número de teléfono: " phone
	read -p "Correo electrónico: " email

	if ! validar_telefono "$phone"; then
		echo "Teléfono NO válido. Debe tener 9 números"
		return
	fi
	if ! validar_email "$email"; then
		echo "El correo electrónico introducido NO es válido."
		return
	fi

	echo "$nombre;$apellido;$phone;$email" >> "$archivo"
	echo "Registro añadido correctamente a la agenda!"
}
#2
buscar_registro() {
	if [ ! -f $archivo ] || [ ! -s $archivo ]; then
		echo "El archivo no existe o está vacío, comprueba que se haya guardado algún registro."
	else
		read -p "Introduce el dato a buscar (nombre, apellido o teléfono): " busqueda
		echo ""
		echo "Resultado de la búsqueda: "
		grep -i "$busqueda" "$archivo" || echo "No se encontraron coincidencias."
		echo ""
	fi
}
#3
listar_registros() {
	if [ ! -f $archivo ] || [ ! -s $archivo ]; then
		echo "No existe ningún registro guardado. "
	else
		echo "Se muestra la agenda completa:"
		echo ""
		cat "$archivo"
		echo ""
	fi
}
#4
ordenar() {
	if [ ! -f $archivo ] || [ ! -s $archivo ]; then
		echo "No existe ninguna agenda o registro, por favor crea registros primero."
	else
		echo "Agenda ordenada alfabéticamente:"
		echo ""
		sort "$archivo"
		echo ""
	fi
}
#5
modificar_registro() {
	if [ ! -f "$archivo" ];then
		echo "No existe la agenda"
		return
	fi

	read -p "Introduce el nombre o teléfono del contacto a editar: " modifica
	coincidencia=$(grep -i "$modifica" "$archivo")

	if [ -z "$coincidencia" ]; then
		echo "No se encontró ningún registro"
		return
	fi

	echo "Contacto encontrado:"
	echo "$coincidencia" 
	echo ""

	IFS=";" read -r nombre_actual apellido_actual phone_actual email_actual <<< "$coincidencia"

	read -p "Nuevo nombre [$nombre_actual]: " nuevo_nombre
	read -p "Nuevo apellido/s [$apellido_actual]: " nuevo_apellido
	read -p "Nuevo teléfono [$phone_actual]: " nuevo_phone
	read -p "Nuevo correo electónico [$email_actual]: " nuevo_email

	#Si no se introduce nuevo dato se conserva
	nuevo_nombre=${nuevo_nombre:-$nombre_actual}
	nuevo_apellido=${nuevo_apellido:-$apellido_actual}
	nuevo_phone=${nuevo_phone:-$phone_actual}
	nuevo_email=${nuevo_email:-$email_actual}

	if ! validar_telefono "$nuevo_phone"; then
		echo "Teléfono no válido. Debe tener 9 números"
		return
	fi

	if ! validar_email "$nuevo_email"; then
		echo "Email no válido"
		return
	fi

	#Reemplazamos la linea
	grep -vi "$modifica" "$archivo" > temp
	echo "$nuevo_nombre; $nuevo_apellido; $nuevo_phone; $nuevo_email" >> temp
	mv temp "$archivo"

	echo "Actualizado correctamente"
}
#6
borrar_registro() {
	if [ ! "$archivo" ]; then
		echo "No existe la agenda"
		return
	fi

	read -p "introduce el nombre o teleéfono del contacto a borrar: " borrar
	coincidencia=$(grep -i "$borrar" "$archivo")

	if [ -z "$coincidencia" ]; then
		echo "No existe ningún registro"
		return
	fi

	echo "Se eliminará el siguiente registro: " 
	echo "$coincidencia"
	read -p "¿Confirmamos eliminación de este registro?: " confirma

	if [ "$confirma" == "s" ] || [ "$confirma" == "S" ]; then
        	sed -i "/$borrar/I d" "$archivo"
		echo "Registro borrado con éxito"
	else
		echo "Se ha cancelado el borrado."
	fi
}
#7
borrar_agenda() {
	if [ ! -f "$archivo" ]; then
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
}
#8
salir() {
echo ""
echo "¡Ádios! Saliendo..."
echo ""
exit 0 
}

while true; do
	imprimir_menu
	echo ""
	read -p "Dime que quieres hacer [1 al 7]: " seleccion
	case $seleccion in
		1) agregar_contacto ;;
		2) buscar_registro ;;
		3) listar_registros ;;
		4) ordenar ;;
		5) modificar_registro ;;
		6) borrar_registro ;;
		7) salir ;;
		*) echo "Opción no válida" ;;
	esac
	done
