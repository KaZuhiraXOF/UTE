'''
En un colegio necesitan un programa que calcule las notas de varios alumnos
no debe repetirse el codigo del alumno,
que regrese tres notas y regrese el promedio
la funcion debe ser usada en dos alumnos diferentes
debe mostar las notas de cada uno y que me diga si aprobó
los datos deben ser ingresados
'''

def calculo_prom(notas_l):
    promedio = sum(notas_l) / len(notas_l)
    if promedio > 6.99:
        estado = "Aprobado"
    else:
        estado = "Reprobado"
    return promedio, estado

notas = []
alumnos_registrados = 0
codigos_registrado = set()

while alumnos_registrados < 2:
    codigo = input("Ingresa el código del alumno: ").strip()
    if codigo in codigos_registrado:
        print ("EL CÓDIGO DEL ESTUDIANTE YA EXISTE... INGRESA OTRO")
        continue

    nombre = input("Ingresa el nombre del alumno: ")
    
    while len(notas) < 3:
        try:
            nota = float(input(f"Ingresa la nota Nª{len(notas)+1}: "))
            if nota >= 0 and nota <= 10:
                notas.append(nota)
            else:
                print("EL NUMERO INGRESADO NO CORRESPONDE A UNA NOTA VÁLIDA")
        except ValueError:
            print("NO ACEPTAMOS LETRAS U SÍMBOLOS, INGRESA UN")
    
    codigos_registrado.add(codigo)

    promedio, estado = calculo_prom(notas)
    print(f"Alumno: {nombre} (Código: {codigo})")
    print(f"Notas: {notas}")
    print(f"Promedio: {promedio:.2f}")
    print(f"Estado: {estado}")



