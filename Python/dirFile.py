# Ficheros y directorios (Entregable)
# Alejandro Torrado Alonso
# 25/03/2026
import os
import shutil as s

uid = os.getuid()
if uid != 0:
    print("Debes tener permisos de root")
    exit()

directorios=[]
ficheros=[]

file=open("rutas.txt","r")
lineas=file.readlines()

for i in lineas:
    ruta = i.strip()
    if os.path.exists(ruta) and os.path.isfile(ruta):
        ficheros.append(ruta)

for i in lineas:
    ruta = i.strip()
    if os.path.exists(ruta) and os.path.isdir(ruta):
        directorios.append(ruta)

while True:
    print("")
    print("A - Eliminar fichero")
    print("B - Mostrar informacion de un directorio")
    print("C - Copiar fichero")
    print("D - Mostrar lista")
    print("E - Salir")
    print("")
    opcion=input("Dime la accion que desea realizar: ")
    print("")

    match opcion:
        case "A":
            fic=input("Dime el nombre de un fichero: ")
            if os.path.exists(fic):
                os.system(f"rm {fic}")
            else:
                print("EL fichero no existe")
        case "B":
             direct =input("Dime el nombre de un directorio: ")
             if os.path.exists(direct):
                print(os.listdir(direct))
             else:
                print("EL directorio no existe")
        case "C":
            files=input("Dime el nombre de un fichero")
            destino=input("Dime el destino donde desea copiarlo")
            if os.path.exists(files):
                s.copy(files, destino)
        case "D":
            elec = input("Que lista desea consultar? D/F ")
            match elec:
                case "D":
                    print("Lista de directorios:")
                    print(directorios)
                case "F":
                    print("Lista de ficheros: ")
                    print(ficheros)
                case _:
                    print("Opcion incorrecta")
        case "E":
            print("Saliendo....")
            break
        case _:
            print("Opcion incorrecta")
