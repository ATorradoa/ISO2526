#!/bin/bash
# Alejandro Torrado Alonso
# Fire or More
# Fecha: 10/02/2026

if [ ! $# -eq 2 ]; then
	echo "Debe introducir dos paramtros, un fichero y directorio"
	exit
fi

if [ -e $1 ]; then
	echo "El fichero no debe de existir"
	exit
fi

if [ ! -d $2 ]; then
	echo "El directorio no existe"
	exit
fi

direct=$(ls $2 2>/dev/null)

if [ -z $direct 2>/dev/null ]; then
	echo "EL directorio esta vacio"
	exit
fi

function contador (){
	canti=0
	for i in $2/*; do
		if [ -f $i ]; then
			exten=$(echo $i | rev | cut -d "." -f 1 | rev)
			num=$(cat $i | wc -l )
			palabras=$(cat $i | wc -w)
			if [ $num -ge 5 ] && [ $exten == txt ]; then
				echo "$i tiene 5 o mas lineas"
				echo "$i" >> $1
				canti=$(($canti+1))
				echo "El fichero tiene $palabras palabras en total" > $i.q
				cat $i >> $i.q
			fi
		fi
	done
	echo "Se has identificado $canti ficheros con 5 lineas o mas" >> $1
}

echo
echo "Autor: Alejandro Torrado Alonso"
echo
contador $1 $2
