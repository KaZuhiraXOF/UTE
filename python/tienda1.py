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

    if opcion_inicial == "1" or opcion_inicial == "2":
        opciones = "0"
        while opciones != "5":
            print("======= MENU PRINCIPAL =======")
            print("1. Salchipapas")
            print("2. Bebidas")
            print("3. Postres")
            print("4. GENERAR PAGO / RESUMEN")
            print("5. REGRESAR (Inicio)")
            print("==============================")
            print("   SALDO ACTUAL: $", factura_total)
            print("==============================")
            print("Seleccione una categoria:")
            opciones = input()

            if opciones == "1":
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
                        print("Cantidad:")
                        numero_pedidos = int(input())
                        if op_salchipapa == "1":
                            subtotal = numero_pedidos * 1.25
                        if op_salchipapa == "2":
                            subtotal = numero_pedidos * 1.75
                        if op_salchipapa == "3":
                            subtotal = numero_pedidos * 2.75

                        factura_total = factura_total + subtotal
                        print("Agregado. Subtotal: $", factura_total)
                    else:
                        if op_salchipapa != "4":
                            print("Opción inválida, intente de nuevo...")

            elif opciones == "2":
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
                        if op_bebida == "1":
                            subtotal = numero_pedidos * 0.50
                        if op_bebida == "2":
                            subtotal = numero_pedidos * 0.70
                        if op_bebida == "3":
                            subtotal = numero_pedidos * 1.25

                        factura_total = factura_total + subtotal
                        print("Agregado. Subtotal: $", factura_total)
                    else:
                        if op_bebida != "4":
                            print("Opción inválida, intente de nuevo...")

            elif opciones == "3":
                op_postre = "0"
                while op_postre != "2":
                    print("==============================")
                    print("********** POSTRES ***********")
                    print("1. Helado de Salcedo...$1.00")
                    print("2. VOLVER")
                    op_postre = input()

                    if op_postre == "1":
                        print("Cantidad:")
                        numero_pedidos = int(input())
                        factura_total = factura_total + (numero_pedidos * 1.00)
                        print("Agregado. Subtotal: $", factura_total)
                    else:
                        if op_postre == "2":
                            print("Saliendo del menú...")
                        else:
                            print("Opción inválida, intente de nuevo...")

            elif opciones == "4":
                if factura_total > 0:
                    print("--- RESUMEN DE ORDEN ---")
                    
                    # Aquí aplicamos el cargo por empaque si es para llevar
                    if opcion_inicial == "1":
                        factura_total = factura_total + 0.25
                        print("Cargo por empaque (Para llevar): $0.25")
                    
                    print("Subtotal: $", factura_total)
                    descuento = 0.0
                    if factura_total >= 30:
                        descuento = 0.25
                    else:
                        if factura_total >= 10:
                            descuento = 0.10

                    total_con_descuento = factura_total - (factura_total * descuento)
                    print("Descuento: ", (descuento * 100), "%")
                    print("TOTAL FINAL: $", total_con_descuento)
                    print("Confirmar pago y generar ticket? (S/N)")
                    confirmacion = input()
                    if confirmacion == "s" or confirmacion == "S":
                        print("Ticket impreso con exito. Gracias!")
                        factura_total = 0.0
                        opciones = "5"
                    else:
                        # Si cancela, le restamos los 25 ctvs para que el carrito no se quede con el cargo duplicado si vuelve a entrar a pagar
                        if opcion_inicial == "1":
                            factura_total = factura_total - 0.25
                        print("Orden mantenida. Puedes continuar pidiendo...")
                else:
                    print("El carrito está vacío...")

            elif opciones == "5":
                if factura_total > 0:
                    print("Seguro que desea volver? Se perdera su orden de $", factura_total, " (S/N)")
                    confirmacion = input()
                    if confirmacion == "s" or confirmacion == "S":
                        factura_total = 0.0
                    else:
                        opciones = "0"

            else:
                print("Opción inválida, intente de nuevo...")

    else:
        if opcion_inicial != "3":
            print("Opción inválida, intente de nuevo...")
        else:
            if factura_total > 0:
                print("ADVERTENCIA: Hay un pedido pendiente de $", factura_total)
                print("Desea salir y borrar la orden? (S/N)")
                confirmacion = input()
                if confirmacion == "n" or confirmacion == "N":
                    opcion_inicial = "0"

            if opcion_inicial == "3":
                print("Gracias por visitarnos!!!")