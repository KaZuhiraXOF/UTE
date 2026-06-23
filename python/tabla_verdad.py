import itertools

esquina_der_sup = "╔"
esquina_izq_sup = "╗"
horizontal = "═"
esquina_der_inf = "╚"
esquina_izq_inf = "╝"
vertical = "║"

variables = []

print(esquina_der_sup, horizontal * 45, esquina_izq_sup)
print(vertical,"       T A B L A S   D E    V E R D A D      ", vertical)
print(esquina_der_inf, horizontal * 45, esquina_izq_inf)
print(esquina_der_sup, horizontal * 45, esquina_izq_sup)
print(vertical," "*45, vertical)
print(vertical,"  USA LETRAS MAYÚSCULAS PARA LAS VARIABLES   ", vertical)
print(vertical," "*45, vertical)
print(esquina_der_inf, horizontal * 45, esquina_izq_inf)
print(esquina_der_sup, horizontal * 45, esquina_izq_sup)
print(vertical,"                OPERADORES:                  ", vertical)
print(vertical,"               CONJUNCION = AND              ", vertical)
print(vertical,"               DISYUNCION = OR               ", vertical)
print(vertical,"                 NEGACION = NOT              ", vertical)
print(vertical,"              CONDICIONAL = =>               ", vertical)
print(vertical,"            BICONDICIONAL = <=>              ", vertical)
print(esquina_der_inf, horizontal * 45, esquina_izq_inf)
print(esquina_der_sup, horizontal * 45, esquina_izq_sup)
print(vertical,"     PARA SALIR, ESCRIBE LA PALABRA: EXIT    ", vertical)
print(esquina_der_inf, horizontal * 45, esquina_izq_inf)

expresion = input("DIGITA LA EXPRESIÓN DE PROPOSICIÓN: \n")

for letra in expresion:
    #Aquí revisamos si la letra esta en mayusculas y si consta dentro del alfabeto
    #Irónicamente, aquí empelamos tablas de verdad xd
    if letra.isupper() and letra.isalpha():
        #Aquí solo verificamos si está en la lista de variables que me permite dibujar la tabla
        if letra not in variables:
            variables.append(letra)
#sort es para que ordene la lista una vez hecha la comprobación
variables.sort()

#Mensaje para validar la expresión
if len(expresion) == 0:
    print("NO EXITE NINGÚN TIPO DE EXPRESIÓN")
    exit()

#intertools. hasta donde veo, me permite generar tablas sin necesidad de usar for's anidados.
#Pero el problema radica que eso lo transforma a tuplas, la solución es list
#Ese list permite transformar esas tuplas a listas simples que si me permitan realizar operaciones
combinaciones = list(itertools.product([True, False], repeat=len(variables)))

