Proceso LaHuecaDelPelao_Kiosko
	Definir numeroPedidos Como Entero
	Definir facturaTotal, subtotal, descuento, totalConDescuento Como Real
	Definir opcion_inicial, opciones, opSalchipapa, opBebida, opPostre, confirmacion Como Caracter
	
	facturaTotal <- 0
	
	Repetir
		Escribir "=================================="
		Escribir "======= LA HUECA DEL PELA´O ======"
		Escribir "=================================="
		Escribir "1. PARA LLEVAR"
		Escribir "2. PARA COMER"
		Escribir "3. SALIR DEL SISTEMA"
		Leer opcion_inicial
		
		Si opcion_inicial = "1" o opcion_inicial = "2" Entonces
			Repetir
			Escribir "======= MENU PRINCIPAL ======="
			Escribir "1. Salchipapas"
			Escribir "2. Bebidas"
			Escribir "3. Postres"
			Escribir "4. GENERAR PAGO / RESUMEN"
			Escribir "5. REGRESAR (Inicio)"
			Escribir "=============================="
			Escribir "   SALDO ACTUAL: $", facturaTotal
			Escribir "=============================="
			Escribir "Seleccione una categoria:"
			Leer opciones
				
			Segun opciones Hacer
				"1":
					Repetir
					Escribir "=============================="
					Escribir "***** MENU SALCHIPAPAS *******"
					Escribir "1. Salchi guagua_________$1.25"
					Escribir "2. Salchi normal_________$1.75"
					Escribir "3. Salchi volquetera_____$2.75"
					Escribir "4. VOLVER"
					Leer opSalchipapa
							
					Si opSalchipapa >= "1" y opSalchipapa <= "3" Entonces
					Escribir "Cantidad:"
					Leer numeroPedidos
					Si opSalchipapa = "1" Entonces
						subtotal <- numeroPedidos * 1.25
					FinSi
					Si opSalchipapa = "2" Entonces
						subtotal <- numeroPedidos * 1.75
					FinSi
					Si opSalchipapa = "3" Entonces
						subtotal <- numeroPedidos * 2.75
					FinSi
					
					facturaTotal <- facturaTotal + subtotal
					Escribir "Agregado. Subtotal: $", facturaTotal
					Sino
						Si opSalchipapa <> "4" Entonces
							Escribir "Opción inválida, intente de nuevo..."
						FinSi
					FinSi
					Hasta Que opSalchipapa = "4"
				"2":
				Repetir
					Escribir "=============================="
					Escribir "******** MENU BEBIDAS ********"
					Escribir "1. Cola 500ml____________$0.50"
					Escribir "2. Agua 500ml____________$0.70"
					Escribir "3. Limonada (Vaso)_______$1.25"
					Escribir "4. VOLVER"
					Leer opBebida
					
					Si opBebida >= "1" y opBebida <= "3" Entonces
					Escribir "Cantidad:"
						Leer numeroPedidos
						Si opBebida = "1" Entonces
							subtotal <- numeroPedidos * 0.50
						FinSi
						Si opBebida = "2" Entonces
							subtotal <- numeroPedidos * 0.70
						FinSi
						Si opBebida = "3" Entonces
							subtotal <- numeroPedidos * 1.25
						FinSi
						facturaTotal <- facturaTotal + subtotal
						Escribir "Agregado. Subtotal: $", facturaTotal
						Sino
						Si opBebida <> "4" Entonces
							Escribir "Opción inválida, intente de nuevo..."
						FinSi
					FinSi
				Hasta Que opBebida = "4"
				"3":
				Repetir
					Escribir "=============================="
					Escribir "********** POSTRES ***********"
					Escribir "1. Helado de Salcedo...$1.00"
					Escribir "2. VOLVER"
					Leer opPostre
					Segun opPostre Hacer
						"1":
						Escribir "Cantidad:"
						Leer numeroPedidos
							facturaTotal <- facturaTotal + (numeroPedidos * 1.00)
							Escribir "Agregado. Subtotal: $", facturaTotal
						De Otro Modo:
							Si opPostre = "2" Entonces
								Escribir "Saliendo del menù..."
							SiNo
								Escribir "Opción inválida, intente de nuevo..."
							FinSi
					FinSegun
				Hasta Que opPostre = "2"
					"4":
						Si facturaTotal > 0 Entonces
							Escribir "--- RESUMEN DE ORDEN ---"
							Escribir "Subtotal: $", facturaTotal
							descuento <- 0
							Si facturaTotal >= 30 Entonces
								descuento <- 0.25
							Sino 
								Si facturaTotal >= 10 Entonces
									descuento <- 0.10
								FinSi
							FinSi
							totalConDescuento <- facturaTotal - (facturaTotal * descuento)
							Escribir "Descuento: ", (descuento * 100), "%"
							Escribir "TOTAL FINAL: $", totalConDescuento
							Escribir "Confirmar pago y generar ticket? (S/N)"
							Leer confirmacion
							Si confirmacion = "s" o confirmacion = "S" Entonces
								Escribir "Ticket impreso con exito. Gracias!"
								facturaTotal <- 0
								opciones <- "5"
							Sino
								Escribir "Orden mantenida. Puedes continuar pidiendo..."
							FinSi
						Sino
							Escribir "El carrito está vacío..."
						FinSi
						
					"5": 
						Si facturaTotal > 0 Entonces
							Escribir "Seguro que desea volver? Se perdera su orden de $", facturaTotal, " (S/N)"
							Leer confirmacion
							Si confirmacion = "s" o confirmacion = "S" Entonces
								facturaTotal <- 0
							Sino
								opciones <- "0"
							FinSi
						FinSi
						
					De Otro Modo:
						Escribir "Opción inválida, intente de nuevo..."
				Fin Segun
			Hasta Que opciones = "5"
			
		Sino
			Si opcion_inicial <> "3" Entonces
				Escribir "Opción inválida, intente de nuevo..."
			Sino
				Si facturaTotal > 0 Entonces
					Escribir "ADVERTENCIA: Hay un pedido pendiente de $", facturaTotal
					Escribir "Desea salir y borrar la orden? (S/N)"
					Leer confirmacion
					Si confirmacion = "n" o confirmacion = "N" Entonces
						opcion_inicial <- "0" 
					FinSi
				FinSi
				Si opcion_inicial = "3" Entonces
					Escribir "Gracias por visitarnos!!!"
				FinSi
			FinSi
		Fin Si
	Hasta Que opcion_inicial = "3"
FinProceso