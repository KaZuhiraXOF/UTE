import itertools
import os
import pandas as pd

esquina_der_sup = "╔"
esquina_izq_sup = "╗"
horizontal = "═"
esquina_der_inf = "╚"
esquina_izq_inf = "╝"
vertical = "║"

while True:
    os.system("clear")

    print("\n" + esquina_der_sup + horizontal * 45 + esquina_izq_sup)
    print(vertical, "       T A B L A S   D E    V E R D A D      ", vertical)
    print(esquina_der_inf + horizontal * 45 + esquina_izq_inf)
    print(esquina_der_sup + horizontal * 45 + esquina_izq_sup)
    print(vertical, " " * 45, vertical)
    print(vertical, "  USA LETRAS MAYÚSCULAS PARA LAS VARIABLES   ", vertical)
    print(vertical, " " * 45, vertical)
    print(esquina_der_inf + horizontal * 45 + esquina_izq_inf)
    print(esquina_der_sup + horizontal * 45 + esquina_izq_sup)
    print(vertical, "                OPERADORES:                  ", vertical)
    print(vertical, "               CONJUNCION = AND              ", vertical)
    print(vertical, "               DISYUNCION = OR               ", vertical)
    print(vertical, "                 NEGACION = NOT              ", vertical)
    print(vertical, "              CONDICIONAL = =>               ", vertical)
    print(vertical, "            BICONDICIONAL = <=>              ", vertical)
    print(esquina_der_inf + horizontal * 45 + esquina_izq_inf)
    print(esquina_der_sup + horizontal * 45 + esquina_izq_sup)
    print(vertical, "     PARA SALIR, ESCRIBE LA PALABRA: EXIT    ", vertical)
    print(esquina_der_inf + horizontal * 45 + esquina_izq_inf)
    print("")

    expresion = input("DIGITA LA EXPRESIÓN DE PROPOSICIÓN:\n")
    print("")

    if expresion.upper() == "EXIT":
        os.system("clear")
        print("\nPrograma finalizado. Gracias por usar el generador.")
        break

    if len(expresion) == 0:
        print("ERROR: NO SE INGRESÓ NINGUNA EXPRESIÓN.")
        input("\nPresiona ENTER para continuar...")
        continue

    expresion_normalizada = (
        expresion.replace("{", "(")
        .replace("}", ")")
        .replace("[", "(")
        .replace("]", ")")
    )

    expresion_limpia = (
        expresion_normalizada.replace("AND", "")
        .replace("OR", "")
        .replace("NOT", "")
        .replace("<=>", "")
        .replace("=>", "")
        .replace("(", "")
        .replace(")", "")
    )

    variables = []

    for letra in expresion_limpia:
        # Aquí revisamos si la letra esta en mayusculas y si consta dentro del alfabeto
        # Irónicamente, aquí empelamos tablas de verdad xd
        if letra.isupper() and letra.isalpha():
            # Aquí solo verificamos si está en la lista de variables que me permite dibujar la tabla
            if letra not in variables:
                variables.append(letra)

    # sort es para que ordene la lista una vez hecha la comprobación
    variables.sort()

    if len(variables) == 0:
        print("\nERROR: NO SE DETECTARON VARIABLES EN MAYÚSCULA.")
        input("\nPresiona ENTER para continuar...")
        continue

    # DETECCIÓN DINÁMICA DE SUB-OPERACIONES (DE ADENTRO HACIA AFUERA)
    pasos_intermedios = []
    
    for v in variables:
        if f"NOT {v}" in expresion_normalizada:
            pasos_intermedios.append(f"NOT {v}")

    # ESTA REVISA QUE HAYA PARENTESIS, CORCHETES, ETC. PARA PODER RESOLVER LO QUE VAYA DENTRO
    if "(" in expresion_normalizada or "[" in expresion or "{" in expresion:
        elementos = expresion_normalizada.split(")")
        for elem in elementos:
            if "(" in elem:
                sub_err = elem[elem.rfind("(") + 1 :].strip()
                if (
                    sub_err 
                    and sub_err not in variables 
                    and sub_err not in pasos_intermedios
                    and len(sub_err) > 2
                ):
                    pasos_intermedios.append(sub_err)

    ''' intertools. hasta donde veo, me permite generar tablas sin necesidad de usar for's anidados.
    Pero el problema radica que eso lo transforma a tuplas, la solución es list
    Ese list permite transformar esas tuplas a listas simples que si me permitan realizar operaciones'''
    combinaciones = list(
        itertools.product([True, False], repeat=len(variables))
    )

    filas_tabla = []

    for combinacion in combinaciones:
        valores_fila = list(combinacion)
        dic_valores = dict(zip(variables, valores_fila))

        for paso in pasos_intermedios:
            op_paso = paso
            
            op_paso = (
                op_paso.replace("AND", " and ")
                .replace("OR", " or ")
                .replace("NOT", " not ")
                .replace("<=>", " == ")
                .replace("=>", " <= ")
            )
            
            valores_fila.append(eval(f"({op_paso})", {}, dic_valores))

        expresion_temporal = (
            expresion_normalizada.replace("AND", " and ")
            .replace("OR", " or ")
            .replace("NOT", " not ")
            .replace("<=>", " == ")
            .replace("=>", " <= ")
        )

        try:
            '''Al pasar 'dic_valores' como el entorno de variables de eval(), Python se encarga 
            de asignar el valor a cada letra directamente sin romper las palabras booleanas nativas.
            En otras palabras, ya no sucederá que la T solo em imprima V (TRUE)'''
            resultado = eval(f"({expresion_temporal})", {}, dic_valores)
        except Exception:
            print(
                "\nERROR: Estructura incorrecta. Revisa los paréntesis."
            )
            break

        valores_fila.append(resultado)
        filas_tabla.append(valores_fila)

    if len(filas_tabla) == 0:
        input("\nPresiona ENTER para continuar...")
        continue

    columnas_tabla = variables + pasos_intermedios + ["Resultado"]

    df = pd.DataFrame(filas_tabla, columns=columnas_tabla)
    df = df.replace({True: "V", False: "F"})

    os.system("clear")

    print("TABLA DE VERDAD GENERADA:")
    print("\t" + "═" * 50 + "\n")

    anchos = [max(len(col), 3) + 2 for col in columnas_tabla]
    
    linea_encabezado = ""
    for i in range(len(columnas_tabla)):
        linea_encabezado += columnas_tabla[i].center(anchos[i])
    print(linea_encabezado)

    print("-" * len(linea_encabezado))
    
    for _, fila in df.iterrows():
        linea_fila = ""
        for i in range(len(columnas_tabla)):
            linea_fila += str(fila[columnas_tabla[i]]).center(anchos[i])
        print(linea_fila)
        
    print("\n" + "═" * len(linea_encabezado))

    input("\nPresiona ENTER para regresar al menú principal...")