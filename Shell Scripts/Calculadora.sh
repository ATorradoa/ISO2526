#!/bin/bash
# Calculadora
# Alejandro Torrado Alonso
# Fecha: 04/02/2026

repe=1

echo "Calculadora por Alejandro Torrado Alonso"

if [ $# -gt 2 ]; then
	echo
	echo "Solo se pueden introducir como maximo 2 parametros"
fi
if [ -f $1 ]; then
	echo "El fichero ya existe"
fi

while [ $repe -le $2 ]; do 

echo
echo "S - Suma"
echo "R - Resta"
echo "D - Division"
echo "M - Multiplicación"
echo "X - Salida"
echo
echo
read -p "Introduce la operacion a realizar: " opera
read -p "Introduce el primer numero: " ope1
read -p "Introduce el segundo numero: " ope2

case $opera in

	S)
		echo
		echo "$opera $ope1 $ope2" >> $1
		Suma=$(($ope1+$ope2))
		echo "El resultado de la suma $Suma"
		repe=$(($repe+1))
	;;
	R)
		echo
		echo "$opera $ope1 $ope2" >> $1
		resta=$(($ope1-$ope2))
		echo "El resultado de la resta es $Resta"
		repe=$(($repe+1))
	;;
	D)
		echo
		echo "$opera $ope1 $ope2" >> $1
		Divi=$(($ope1/$ope2))
		echo "El resultado de la division es $Divi"
		repe=$(($repe+1))
	;;
	M)
		echo
		echo "$opera $ope1 $ope2" >> $1
		Multi=$(($ope1*$ope2))
		echo "El resultado de la multiplicación es $Multi"
		repe=$(($repe+1))
	;;
	X)
		echo
		echo "Saliendo.."
		break;
	;;
	*)
		echo
		echo "Parametro no valido"
	;;
esac
	ruta=$(pwd $1)
	echo
	echo "La ruta del fichero es: $ruta"
	echo
	echo "Su contenido es:"
	cat $1
done
