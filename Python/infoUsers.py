# Informacion de SO y Usuarios.
# Alejandro Torrado Alonso
# 24/03/2026
import os
import cpuinfo

uid = os.getuid()
if uid != 0:
    print("Necesitas permisos de root")
    exit()

while True:
    print("1 - Mostrar informacion del sistema operativo e informacion de la CPU")
    print("2 - Informacion de usuario")
    print("3 - Comprobacion de directorio")
    print("4 - Salir")
    print("")
    option=input("Que opcion desera realziar? ")

    match option:
        case "1":
            print(f"El sistema operativo es {os.uname().sysname} y su arquitectura es {os.uname().machine}")
            print(f"El CPU es: {cpuinfo.get_cpu_info()['brand_raw']}")
        case "2":
            encontrado = 0
            file=open("/etc/passwd","r")
            lista=file.readlines()
            usuario=input("Dime un usuario: ")
            for i in lista:
                if usuario in i:
                    print(i)
                    encontrado = 1
            if encontrado == 0:
                    os.system(f"useradd -m {usuario}")
                    print("Usuario creado")
        case "3":
            direc=input("Dime un directorio: ")
            if os.path.isdir(direc) and os.path.exists(direc):
                print(f"EL directorio {direc} existe")
            else:
                os.mkdir(direc)
                print(f"El directorio {direc} se ha creado correctamente")
        case "4":
            print("Saliendo...")
            break
        case _:
            print("Error, opcion incorrecta")
