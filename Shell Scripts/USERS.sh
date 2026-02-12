#!/bin/bash
# Alejandro Torrado Alonso
# Informe de usuarios
# Fecha: 12/02/2026

if [ ! $UID -eq 0 ]; then
	echo "Necesitas permisos root"
	exit
fi

UI=$1
if [ -z $UI ]; then
	UI=1000
fi

fecha=$(date +"%d-%m-%y")
hora=$(date | cut -d " " -f 5)
lineas=$(cat /etc/passwd)

echo "============================================="
echo "Informe de usuario el dia $fecha a las $hora"
for l in $lineas; do
	UIS=$(echo $l | cut -d ":" -f 3)
	nombre=$(echo $l | cut -d ":" -f 1)
	if [ "$UIS" -ge "$UI" ] 2>/dev/null; then
		echo "$nombre -- $UIS"
	fi
done
echo "=============================================" 

echo "$fecha - $hora - El usuario $USER ha solicitado un informe de usuarios" >> /tmp/logeventos.txt
