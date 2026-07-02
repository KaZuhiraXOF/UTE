#ESto solo es una prueba para ver si esto funciona, no recuerdo si el clean code lo permite
def mostrar_menu_principal(saldo_actual):
    print("======= MENU PRINCIPAL =======")
    print("1. Salchipapas")
    print("2. Bebidas")
    print("3. Postres")
    print("4. GENERAR PAGO / RESUMEN")
    print("5. REGRESAR (Inicio)")
    print("==============================")
    print("   SALDO ACTUAL: $", saldo_actual)
    print("==============================")
    print("Seleccione una categoria:")

def calcular_subtotal_producto(precio_unitario):
    print("Cantidad:")
    cantidad = int(input())
    return cantidad * precio_unitario

def aplicar_descuento_y_pago(total, es_para_llevar):
    print("--- RESUMEN DE ORDEN ---")
    
    if es_para_llevar:
        total = total + 0.25
        print("Cargo por empaque (Para llevar): $0.25")
    
    print("Subtotal: $", total)
    descuento = 0.0
    if total >= 30:
        descuento = 0.25
    else:
        if total >= 10:
            descuento = 0.10

    total_con_descuento = total - (total * descuento)
    print("Descuento: ", (descuento * 100), "%")
    print("TOTAL FINAL: $", total_con_descuento)
    
    print("Confirmar pago y generar ticket? (S/N)")
    confirmacion = input()
    
    if confirmacion == "s" or confirmacion == "S":
        print("Ticket impreso con exito. Gracias!")
        return [True, 0.0]
    else:
        if es_para_llevar:
            total = total - 0.25
        print("Orden mantenida. Puedes continuar pidiendo...")
        return [False, total]

factura_total = 0.0
opcion_inicial = "0"

while opcion_inicial != "3":
    print("==================================")
    print("======= LA HUECA DEL PELAO =======")
    print("==================================")
    print("1. PARA LLEVAR")
    print("2. PARA COMER")
    print("3. SALIR DEL SISTEMA")
    opcion_inicial = input()

    '''
    match es una funcion exclusiva de python en sus versiones
    mayores a la 3.10. Si esta fuera de esa versión no funcionará
    en ese caso se usan if, elif, else... No olvidarme.
    '''
    match opcion_inicial:
        case "1" | "2":
            opciones = 0
            while opciones != "5":
                mostrar_menu_principal(factura_total)
                opciones = input()

                match opciones:
                    case "1":
                        op_salchipapa = "0"
                        while op_salchipapa != "4":
                            print("==============================")
                            print("***** MENU SALCHIPAPAS *******")
                            print("1. Salchi guagua_________$1.25")
                            print("2. Salchi normal_________$1.75")
                            print("3. Salchi volquetera_____$2.75")
                            print("4. VOLVER")
                            op_salchipapa = input()

                            if op_salchipapa >= "1" and op_salchipapa <= "3":
                                match op_salchipapa:
                                    case "1": precio = 1.25
                                    case "2": precio = 1.75
                                    case "3": precio = 2.75

                                subtotal = calcular_subtotal_producto(precio)
                                factura_total = factura_total + subtotal
                                print("Agregado. Subtotal: $", factura_total)
                            else:
                                if op_salchipapa != "4":
                                    print("Opción inválida, intente de nuevo...")
                    case "2":
                        op_bebida = "0"
                        while op_bebida != "4":
                            print("==============================")
                            print("******** MENU BEBIDAS ********")
                            print("1. Cola 500ml____________$0.50")
                            print("2. Agua 500ml____________$0.70")
                            print("3. Limonada (Vaso)_______$1.25")
                            print("4. VOLVER")
                            op_bebida = input()

                            if op_bebida >= "1" and op_bebida <= "3":
                                print("Cantidad:")
                                numero_pedidos = int(input())
                                match op_bebida:
                                    case "1": precio = 0.50
                                    case "2": precio = 0.70
                                    case "3": precio = 1.25

                                subtotal = calcular_subtotal_producto(precio)
                                factura_total = factura_total + subtotal
                                print("Agregado. Subtotal: $", factura_total)
                            else:
                                if op_bebida != "4":
                                    print("Opción inválida, intente de nuevo...")
                    case "3":
                        op_postre = "0"
                        while op_postre != "2":
                            print("==============================")
                            print("********** POSTRES ***********")
                            print("1. Helado de Salcedo...$1.00")
                            print("2. VOLVER")
                            op_postre = input()

                            match op_postre:
                                case "1":
                                    subtotal = calcular_subtotal_producto(1.00)
                                    factura_total = factura_total + subtotal
                                    print("Agregado. Subtotal: $", factura_total)
                                case "2":
                                    print("Saliendo del menú...")
                                case _:
                                    print("Opción inválida, intente de nuevo...")
                    case "4":
                        if factura_total > 0:
                            para_llevar = (opcion_inicial == "1")
                            resultado_pago = aplicar_descuento_y_pago(factura_total, para_llevar)
                            
                            pago_exitoso = resultado_pago[0]
                            factura_total = resultado_pago[1]
                            
                            if pago_exitoso:
                                opciones = "5"
                        else:
                            print("El carrito está vacío...")
                    case "5":
                        if factura_total > 0:
                            print("Seguro que desea volver? Se perdera su orden de $", factura_total, " (S/N)")
                            confirmacion = input()
                            if confirmacion == "s" or confirmacion == "S":
                                factura_total = 0.0
                            else:
                                opciones = "0"
                    case _:
                        print("Opción inválida, intente de nuevo...")
        case "3":
            if factura_total > 0:
                print("ADVERTENCIA: Hay un pedido pendiente de $", factura_total)
                print("Desea salir y borrar la orden? (S/N)")
                confirmacion = input()
                if confirmacion == "n" or confirmacion == "N":
                    opcion_inicial = "0"

            if opcion_inicial == "3":
                print("Gracias por visitarnos!!!")
        #Este solo sirve por si ninguna opción cuadra.
        case _:
            print("Opción inválida, intente de nuevo...")