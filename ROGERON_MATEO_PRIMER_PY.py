print("¿Qué onda? Mi nombre es Mateo")
nombre = input("Cuéntame, ¿Cuál es tu nombre?\n")
print("------------------------------------------------")

#f es una función de formato que me permite insertar el valor de la variable nombre dentro de la cadena de texto, en el lugar donde se encuentra {nombre}.
#Esto hace que el mensaje sea más personalizado y directo al usuario.
#ESTA FUNCION NACE A PARTIR DE PYTHON 3.6 CON EL METODO F-STRING
print(f"Hola, {nombre} Cuentame sobre ti, ¿Cuántos años tienes?")
edad = input()
print("------------------------------------------------")

print(f"Así que {edad} ¿De qué colegio saliste?")
colegio = input()
print("------------------------------------------------")

print(f"{colegio}... Lo escuché de algún lado... Oye, ¿Cuál es tu hobby? Eso que te suele relajar cuando te ajetreas")
hobby = input()
print("------------------------------------------------")

print(f"Si {hobby} es lo que disfrutas... Mejor me ahorro mis comentarios. Tengo otras preguntas, ¿te las puedo hacer? Responde con si o no")
opciones = input()
print("------------------------------------------------")

intentos = 0
while intentos < 3:
    if opciones == "si":
        print("Gracias... ¿Tienes alguna mascota? Responde con si o no")
        consultaMascota = input()
        print("------------------------------------------------")
        
        if consultaMascota == "si":
            print("¡Genial! Tambien tengo una...")
            print("------------------------------------------------")
            break  
        elif consultaMascota == "no":
            print("Qué lástima... No importa espero puedas conseguir una muy pronto")
            print("------------------------------------------------")
            break  
        else:
            print("Si no me querías decir hubieras puesto no... Tampoco me puedo enojar")
            print("------------------------------------------------")
            break  
    elif opciones == "no":
        print("Okey... No hay problema")
        print("------------------------------------------------")
        break
        
    else:
        intentos += 1
        if intentos < 3:
            print("Esa respuesta no buscaba. Debes escribir si o no, en minúsculas... Inténtalo otra vez")
            opciones = input()
            print("------------------------------------------------")
        else:
            print("Se agotaron los intentos de respuesta.")
            print("------------------------------------------------")

print("Fue un placer conocerte un poquito... Disfruta de estar en la UTE. Bye Bye")
print("------------------------------------------------")