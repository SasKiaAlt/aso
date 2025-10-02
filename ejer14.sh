#!/bin/bash

if [[ $# -lt 4 || $# -gt 5 ]]; then
	echo "Error. La sintaxis correcta es: "
	echo "./ejer14.sh alta/baja nombre apellido1 apellido2 [grupo] --> Opcional"
	exit 1
fi

accion="$1"
nombre="$2"
apellido1="$3"
apellido2="$4"
grupo="${5:-}"

a1=${apellido1:0:2}
a1=${a1^^}

a2=${apellido2:0:2}
a2=${a2^^}

n=${nombre:0:1}
n=${n^^}

id="alu${a1}${a2}${n}"

case $accion in
	alta) 
	#Proceso de alta usuario
	if getent passwd "$id" >/dev/null; then
		echo "El usuario ya existe en el sistema."
		exit 1
	fi
	if [ -z "$grupo" ]; then
		grupo="$id"
		#No se indicó gurpo, se crea con el mismo nombre de usuario
		if ! getent group "$grupo" >/dev/null; then
			#Se crea grupo ya que no existe
			groupadd "$grupo"
		else
			echo "El grupo $grupo ya existía en el sistema"
		fi
	else
		#Se indicó el grupo 
		if ! getent group "$grupo" >/dev/null; then
			#Se crea el grupo
			groupadd "$grupo"
		else
			echo "El grupo ya existía en el sistema."
		fi
	fi

	#Creamos el usuario con el grupo que le corresponde
	useradd -m -g "$grupo" -c "$nombre $apellido1 $apellido2" "$id"
	echo "Se ha creado con éxito el usuario $id con el grupo $grupo"
	;;

	baja) 
	#Proceso de baja del usuario
	echo "El usuario que quiere eliminar es: $id"

	read -p "¿Estás seguro de eliminar el usuario? [S/N]" respuesta
	if [[ "$respuesta" == s || "$respuesta" == S ]]; then
		if getent passwd "$id" >/dev/null; then
			#Eliminamos usuario
			userdel -r "$id"
			echo "El usuario $id ha sido eliminado del sistema."
		else
			echo "El usuario $id no existe en el sistema." 
		fi
	else
		echo "Operación cancelada, no se ha borrado ningún usuario."
	fi
	;;
esac

