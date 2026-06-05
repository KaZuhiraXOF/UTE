opcion = 1
while opcion != 0:
    nota = float(input("Ingresa tu nota: ")) 
    
    match nota:
        case n if 9 <= n <= 10:
            print("Sobresaliente")
        case n if 7 <= n < 9:
            print("Buena")
        case n if 5 <= n < 7:
            print("Regular")
        case n if 0 <= n < 5:
            print("REPROBADO")
        case _:
            print("Nota no válida")
    
    print("—" * 30)
    opcion = int(input("¿Quieres terminar el programa? Presiona 0 para salir, o cualquier otro número para continuar: "))

print("¡ADIOS Y BUENA SUERTA!")