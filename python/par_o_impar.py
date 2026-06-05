opcion = 1

while opcion != 0:
    while True:
        try:
            numero = int(input("Ingresa el numero del que quieras saber si es par o impar: "))
            break
        except:
            print ("LO INGRESADO NO ES UN NÚMERO ENTERO...")
    
    if numero % 2 == 0:
        print("EL NÚMERO INGRESADO ES PAR")
    else:
        print("EL NÚMERO INGRESADO ES IMPAR")

    match numero:
        case n if n % 3 == 0 and n % 5 == 0:
            print ("EL NÚMERO INGRESADO ES MÚLTIPLO TANTO DE 3 COMO DE 5")
        case n if n % 3 == 0:
            print ("EL NÚMERO INGRESADO ES UN MÚLTIPLO DE 3")
        case n if n % 5 == 0:
            print ("EL NÚMERO INGRESADO ES UN MÚLTIPLO DE 5")
        case _:
            print ("NO ES MÚLTIPLO DE 3 O 5")

    while True:
        try:
            opcion = int(input("¿Quieres continuar? Presiona cualquier número, o 0 para salir: "))
            break
        except:
            print("Por favor, ingresa un número válido.")