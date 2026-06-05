opcion_men = 0
lista_reservas = []

while opcion_men != 3:
    print("|", "="*40, "|")
    print("       R E S E R V A  D E  C I T A S")
    print("|", "="*40, "|")
    print("                 M E N U")
    print("|", "="*40, "|")
    print("       1. RESERVAR")
    print("       2. REVISAR RESERVAS")
    print("       3. SALIR           ")
    print("|", "="*40, "|")

    while True:
        try:
            opcion_men = int(input("SELECCIONA LA OPCIÓN: "))
            if 1 <= opcion_men <= 3:
                break
            else:
                print("ERROR: El número debe ser 1, 2 o 3.")
        except ValueError:
            print("OPCIÓN DESCONOCIDA. INGRESA UN NÚMERO VÁLIDO.")
    
    match opcion_men:
        case 1:
            print("\n|", "="*40, "|")
            print(" M O D U L O  D E  R E S E R V A S")
            print("|", "="*40, "|")
            
            paciente = input("Nombre del paciente: ").strip()
            while paciente == "":
                print("Error: El nombre no puede estar vacío.")
                paciente = input("Nombre del paciente: ").strip()

            fecha_valida = False
            while not fecha_valida:
                fecha_ingresada = input("Ingrese la fecha de la cita (AAAA-MM-DD): ")
                
                if len(fecha_ingresada) == 10 and fecha_ingresada[4] == "-" and fecha_ingresada[7] == "-":
                    partes_f = fecha_ingresada.split("-")
                    
                    if partes_f[0].isdigit() and partes_f[1].isdigit() and partes_f[2].isdigit():
                        anio = int(partes_f[0])
                        mes = int(partes_f[1])
                        dia = int(partes_f[2])
                        
                        if anio != 2026:
                            print("Error: El sistema solo gestiona citas para el año 2026.")
                        else:
                            dias_por_mes = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
                            
                            if 1 <= mes <= 12:
                                if 1 <= dia <= dias_por_mes[mes]:
                                    fecha_valida = True 
                                else:
                                    print(f"Error: El mes {mes} no tiene ese número de días.")
                            else:
                                print("Son 12 meses del año. Selecciona el correcto.")
                    else:
                        print("El formato de fecha debe ser numérico.")
                else:
                    print("Formato incorrecto. Debes usar AAAA-MM-DD (ej: 2026-06-15).")

            hora_valida = False
            minutos_inicio = 0
            hora_ini_txt = ""
            
            while not hora_valida:
                hora_ini_txt = input("Hora para la cita (HH:MM): ")
                
                if len(hora_ini_txt) == 5 and hora_ini_txt[2] == ":":
                    partes_h = hora_ini_txt.split(":")
                    
                    if partes_h[0].isdigit() and partes_h[1].isdigit():
                        hora = int(partes_h[0])
                        minutos = int(partes_h[1])
                        
                        if 8 <= hora <= 20 and 0 <= minutos <= 59:
                            minutos_inicio = (hora * 60) + minutos
                            hora_valida = True
                        else:
                            print("LA HORA DE ATENCION SOLO ES DE 8 A 20:59")
                    else:
                        print("Los números deben estar separados por un ':'")
                else:
                    print("Formato incorrecto. Ingresa en el siguiente (14:30).")

            nueva_reserva = {
                "paciente": paciente,
                "fecha": fecha_ingresada,
                "inicio_txt": hora_ini_txt,
                "inicio_min": minutos_inicio,
            }
            
            lista_reservas.append(nueva_reserva)
            print(f"\n¡ÉXITO! Cita registrada para {paciente} el {fecha_ingresada}.")
            
        case 2:
            print("\n|", "="*40, "|")
            print(" V I S T A  D E  R E S E R V A S")
            print("|", "="*40, "|")

            if len(lista_reservas) == 0:
                print("NO EXISTEN CITAS REGISTRADAS... DESCANSE DOCTOR")
            else:
                contador = 1
                for reserva in lista_reservas:
                    print(f"{contador}. Paciente: {reserva['paciente']}")
                    print(f"   Fecha:    {reserva['fecha']}")
                    print(f"   Hora:     {reserva['inicio_txt']}")
                    print("-" * 20)
                    contador += 1

        case 3:
            print("\n¡Gracias por usar el sistema! Saliendo...")