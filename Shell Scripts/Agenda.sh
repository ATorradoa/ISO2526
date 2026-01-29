#!/bin/bash
# Administrar agenda de contactos
# Alejandro Torrado Alonso
# Fecha: 29/01/2026

while true ; do
	echo
	echo
	echo "Opciones de la agenda: "
	echo
	echo "############################################"
	echo "a) Añadir una entrada."
	echo "b) Buscar por dni."
	echo "c) Ver la agenda completa."
	echo "d) Eliminar todas las entradas de la agenda."
	echo "e) Finalizar"
	echo "############################################"
	echo
	echo
	read -p "Introduce la accion a realizar: " ints
	echo
	echo

	case $ints in
		a)
			read -p "Dime el DNI de la persona: " dni
			echo
			if grep ^$dni agenda.txt >/dev/null ; then
				echo "El usuario ya existe"
			else
				read -p "Dime el nombre: " nom
				read -p "Dime los apellidos: " ape
				read -p "Dime su localidad: " loca
				echo "$dni:$nom:$ape:$loca" >> agenda.txt
			fi
		;;
		b)
			read -p "Dime el DNI de la persona: " dni
			echo
                	if grep ^$dni agenda.txt >/dev/null ; then
                        	nombre=$(grep ^$dni agenda.txt | cut -d ":" -f 2)
							apellidos=$(grep ^$dni agenda.txt | cut -d ":" -f 3)
							localidad=$(grep ^$dni agenda.txt | cut -d ":" -f 4)
							echo "La persona con DNI número $dni es: $nombre $apellidos, y vive en $localidad"
                	else
                       		echo "EL usuario no existe"
                fi
		;;
		c)
			if [ -s agenda.txt ]; then
				echo "Agenda: "
				echo
				cat agenda.txt
			else
				echo "Agenda vacia"
			fi
		;;
		d)
			echo "Vaciando agenda..."
			> agenda.txt
		;;
		e)
		 	echo "Saliendo..."
		 	break;
		;;
	esac
done
