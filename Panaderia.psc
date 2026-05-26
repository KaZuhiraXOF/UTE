Funcion correcto <- ValidarCedula ( cedula )
	Definir correcto Como Logico
	Definir i, suma, digito, provincia, tercerDigito Como Entero
	Definir digitoVerificador, ultimoDigito Como Entero
	
	// En el perfil Flexible es vital asegurar el estado inicial
	correcto <- Verdadero
	
	Si Longitud(cedula) <> 10 Entonces
		correcto <- Falso
	Sino
		// Validar que sean solo números (Índices del 1 al 10 para Modo Flexible)
		Para i <- 1 Hasta 10 Con Paso 1 Hacer
			Si Subcadena(cedula, i, i) < "0" O Subcadena(cedula, i, i) > "9" Entonces
				correcto <- Falso
			FinSi
		FinPara
		
		Si correcto = Verdadero Entonces
			// En modo Flexible, la subcadena empieza en 1
			provincia <- ConvertirANumero(Subcadena(cedula, 1, 2))
			tercerDigito <- ConvertirANumero(Subcadena(cedula, 3, 3))
			
			Si (provincia < 1 O provincia > 24) Y provincia <> 30 O tercerDigito > 5 Entonces
				correcto <- Falso
			Sino
				suma <- 0
				// Multiplicaciones posicionales (Del 1 al 9)
				Para i <- 1 Hasta 9 Con Paso 1 Hacer
					digito <- ConvertirANumero(Subcadena(cedula, i, i))
					
					// En Base 1, los multiplicadores por 2 caen en posiciones impares (1, 3, 5, 7, 9)
					Si i % 2 <> 0 Entonces
						digito <- digito * 2
						Si digito > 9 Entonces 
							digito <- digito - 9
						FinSi
					FinSi
					suma <- suma + digito
				FinPara
				
				ultimoDigito <- ConvertirANumero(Subcadena(cedula, 10, 10))
				digitoVerificador <- (10 - (suma % 10)) % 10
				
				Si digitoVerificador <> ultimoDigito Entonces
					correcto <- Falso
				FinSi
			FinSi
		FinSi
	FinSi
Fin Funcion

Proceso DulceTentacion_Kiosko 
	Definir cPanQueso, cEnrollado, cCroissant, cCafe, cJugo, cChocolate, cTorta, numeroPedidos Como Entero  
	Definir stockPanQueso, stockEnrollado, stockCroissant Como Entero
	Definir facturaTotal, subtotal, descuento, totalConDescuento Como Real 
	Definir opcion_inicial, opciones, opPan, opBebida, opPostre, confirmacion, irAPagar Como Caracter
	Definir recargo Como Real
	
	Definir opFactura, nombreCliente, cedulaRuc Como Caracter
	Definir cedulaValida Como Logico
	
	facturaTotal <- 0
	cPanQueso <- 0; cEnrollado <- 0; cCroissant <- 0
	cCafe <- 0; cJugo <- 0; cChocolate <- 0; cTorta <- 0
	stockPanQueso <- 50; stockEnrollado <- 100; stockCroissant <- 40
	
	Repetir
		Borrar Pantalla
		Escribir "=========================================="
		Escribir "======= DULCE TENTACIÓN - PANADERÍA ======"
		Escribir "=========================================="
		Escribir "== PORQUE SIEMPRE TENDRÁS GANAS DE MÁS =="
		Escribir "=========================================="
		Escribir "============== BIENVENIDO ================"
		Escribir "1. INGRESAR"
		Escribir "2. SALIR DEL SISTEMA"
		Escribir "DIGÍTA EL NÚMERO DE LA OPCIÓN QUE DESEAS"
		Leer opcion_inicial
		
		Si opcion_inicial = "1" Entonces
			recargo <- 0
			Repetir
				Si opciones <> "4" Entonces
					Borrar Pantalla
					Escribir "======= MENU PRINCIPAL ======="
					Escribir "1. Variedad de Panes"
					Escribir "2. Bebidas Calientes/Frías"
					Escribir "3. Postres y Tortas"
					Escribir "4. GENERAR PAGO / RESUMEN"
					Escribir "5. REGRESAR (Inicio)"
					Escribir "=============================="
					Escribir " SALDO ACTUAL: $", facturaTotal
					Escribir "=============================="
					Escribir "Seleccione una categoria:"
					Leer opciones
				FinSi
				
				Segun opciones Hacer
					"1":
						Repetir
							Borrar Pantalla
							Escribir "********* MENU DE PANES *********"
							Escribir "1. Pan de Queso_____________$1.00"
							Escribir "2. Pan Enrollado____________$0.15"
							Escribir "3. Pan Cachito______________$0.50"
							Escribir "4. VOLVER"
							Escribir "Ingresa la opción:"
							Leer opPan
							
							Si opPan >= "1" Y opPan <= "3" Entonces
								Escribir "Cantidad:"
								Leer numeroPedidos
								Segun opPan Hacer
									"1":
										subtotal <- numeroPedidos * 1.00
										cPanQueso <- cPanQueso + numeroPedidos
									"2":
										subtotal <- numeroPedidos * 0.15
										cEnrollado <- cEnrollado + numeroPedidos
									"3":
										subtotal <- numeroPedidos * 0.50
										cCroissant <- cCroissant + numeroPedidos
								Fin Segun
								
								facturaTotal <- facturaTotal + subtotal
								Escribir "¡Excelente elección! Tu saldo actual es de: $", facturaTotal
								Escribir "¿Desea ir directo a pagar su orden? (S/N)"
								Leer irAPagar
								
								Si irAPagar = "s" O irAPagar = "S" Entonces
									opPan <- "4"   
									opciones <- "4" 
								Sino
									Escribir "Presiona cualquier tecla para seguir pidiendo..."
									Esperar Tecla
								FinSi
							Sino
								Si opPan <> "4" Entonces
									Escribir "¡Ups! Esa opción no la tenemos. Intenta con los números del menú."
									Escribir "Presiona una tecla para reintentar..."
									Esperar Tecla
								FinSi
							FinSi
						Hasta Que opPan = "4"
						
					"2":
						Repetir
							Borrar Pantalla
							Escribir "******** MENU BEBIDAS ********"
							Escribir "1. Café Pasado___________$0.75"
							Escribir "2. Jugo Natural__________$1.25"
							Escribir "3. Chocolate Caliente____$1.50"
							Escribir "4. VOLVER"
							Escribir "Ingresa la opción:"
							Leer opBebida
							
							Si opBebida >= "1" Y opBebida <= "3" Entonces
								Escribir "Cantidad:"
								Leer numeroPedidos
								Segun opBebida Hacer
									"1":
										subtotal <- numeroPedidos * 0.75
										cCafe <- cCafe + numeroPedidos
									"2":
										subtotal <- numeroPedidos * 1.25
										cJugo <- cJugo + numeroPedidos
									"3":
										subtotal <- numeroPedidos * 1.50
										cChocolate <- cChocolate + numeroPedidos
								Fin Segun
								
								facturaTotal <- facturaTotal + subtotal
								Escribir "¡Perfecto! Agregado a tu cuenta. Saldo: $", facturaTotal
								Escribir "¿Desea ir directo a pagar su orden? (S/N)"
								Leer irAPagar
								
								Si irAPagar = "s" O irAPagar = "S" Entonces
									opBebida <- "4"   
									opciones <- "4" 
								Sino
									Escribir "Presiona cualquier tecla para seguir pidiendo..."
									Esperar Tecla
								FinSi
							Sino
								Si opBebida <> "4" Entonces
									Escribir "Esa bebida no está en la lista. Intenta de nuevo."
									Escribir "Presiona una tecla para reintentar..."
									Esperar Tecla
								FinSi
							FinSi
						Hasta Que opBebida = "4"
						
					"3":
						Repetir
							Borrar Pantalla
							Escribir "********** POSTRES ***********"
							Escribir "1. Porción de Torta......$1.00"
							Escribir "2. VOLVER"
							Escribir "Ingresa la opción:"
							Leer opPostre
							
							Segun opPostre Hacer
								"1":
									Escribir "Cantidad:"
									Leer numeroPedidos
									cTorta <- cTorta + numeroPedidos
									facturaTotal <- facturaTotal + (numeroPedidos * 1.00)
									Escribir "¡Buen provecho! Dulce agregado. Subtotal: $", facturaTotal
									Escribir "¿Desea ir directo a pagar su orden? (S/N)"
									Leer irAPagar
									
									Si irAPagar = "s" O irAPagar = "S" Entonces
										opPostre <- "2"   
										opciones <- "4" 
									Sino
										Escribir "Presiona cualquier tecla para continuar..."
										Esperar Tecla
									FinSi
								"2":
									Escribir "Regresando al menú principal..."
								De Otro Modo:
									Escribir "Opción de postre no válida."
									Escribir "Presiona una tecla para reintentar..."
									Esperar Tecla
							FinSegun
						Hasta Que opPostre = "2"
						
					"4":
						Borrar Pantalla
						Si facturaTotal > 0 Entonces
							// Selección del tipo de documento
							Escribir "=========================================="
							Escribir "          TIPO DE FACTURACIÓN             "
							Escribir "=========================================="
							Escribir "1. CONSUMIDOR FINAL"
							Escribir "2. CON DATOS"
							Escribir "Seleccione una opción:"
							Leer opFactura
							
							Si opFactura = "2" Entonces
								Escribir "Ingrese el Nombre del Cliente:"
								Leer nombreCliente
								
								Repetir
									Escribir "Ingrese el número de Cédula (10 dígitos):"
									Leer cedulaRuc
									cedulaValida <- ValidarCedula(cedulaRuc)
									
									Si No cedulaValida Entonces
										Escribir "¡Error! La cédula es incorrecta o contiene caracteres no permitidos."
										Escribir "Inténtelo de nuevo."
										Escribir "------------------------------------------"
									FinSi
								Hasta Que cedulaValida = Verdadero
							Sino
								nombreCliente <- "CONSUMIDOR FINAL"
								cedulaRuc <- "9999999999"
							FinSi
							
							Borrar Pantalla
							Escribir "======== FACTURA DE VENTA ========"
							Escribir "CLIENTE: ", nombreCliente
							Escribir "RUC/CI:  ", cedulaRuc
							Escribir "=================================="
							
							Si cPanQueso > 0 Entonces
								Escribir cPanQueso, " Pan de Queso________$", (cPanQueso * 1)
							FinSi
							Si cEnrollado > 0 Entonces
								Escribir cEnrollado, " Pan Enrollado_______$", (cEnrollado * 0.15)
							FinSi
							Si cCroissant > 0 Entonces
								Escribir cCroissant, " Pan cachito_________$", (cCroissant * 0.5)
							FinSi
							Si cCafe > 0 Entonces
								Escribir cCafe, " Café Pasado________$", (cCafe * 0.75)
							FinSi
							Si cJugo > 0 Entonces
								Escribir cJugo, " Jugo Natural_______$", (cJugo * 1.25)
							FinSi
							Si cChocolate > 0 Entonces
								Escribir cChocolate, " Chocolate Caliente__$", (cChocolate * 1.50)
							FinSi
							Si cTorta > 0 Entonces
								Escribir cTorta, " Porción de Torta____$", (cTorta * 1.00)
							FinSi
							
							subtotal <- facturaTotal
							Escribir "==============================="
							Escribir "Subtotal: $", subtotal
							descuento <- 0
							
							Si subtotal >= 10 Entonces
								descuento <- 0.25
							Sino
								Si subtotal >= 5 Entonces
									descuento <- 0.10
								FinSi
							FinSi
							
							totalConDescuento <- subtotal - (subtotal * descuento)
							Escribir "Descuento (", (descuento * 100), "%): -$", (subtotal * descuento)
							Escribir "TOTAL FINAL A PAGAR: $", totalConDescuento
							Escribir "¿Confirmar el pago de tu orden? (S/N)"
							Leer confirmacion
							
							Si confirmacion = "s" O confirmacion = "S" Entonces
								Escribir "¡Pago recibido con éxito! Retira tu ticket de compra."
								facturaTotal <- 0; cPanQueso <- 0; cEnrollado <- 0; cCroissant <- 0
								cCafe <- 0; cJugo <- 0; cChocolate <- 0; cTorta <- 0
								opciones <- "5" // Sale al menú de bienvenida
							Sino
								Escribir "Orden mantenida. Regresando al menú de categorías..."
								opciones <- "0" // Mantiene al usuario dentro del menú de compras
							FinSi
							Escribir "Presiona una tecla para continuar..."
							Esperar Tecla
						Sino
							Escribir "Tu carrito todavía está vacío. ¡Antójate de algo!"
							Escribir "Presiona una tecla para continuar..."
							Esperar Tecla
							opciones <- "0"
						FinSi
						
					"5":
						Si facturaTotal > 0 Entonces
							Escribir "Si regresas al inicio, se cancelará tu pedido actual de $", facturaTotal, ". ¿Deseas continuar? (S/N)"
							Leer confirmacion
							Si confirmacion = "s" O confirmacion = "S" Entonces
								facturaTotal <- 0
								cPanQueso <- 0; cEnrollado <- 0; cCroissant <- 0
								cCafe <- 0; cJugo <- 0; cChocolate <- 0; cTorta <- 0
							Sino
								opciones <- "0"
							FinSi
						FinSi
					De Otro Modo:
						Escribir "Esa opción no es válida. Por favor, selecciona una del menú."
						Escribir "Presiona una tecla para continuar..."
						Esperar Tecla
						opciones <- "0"
				Fin Segun
			Hasta Que opciones = "5"
		Sino
			Si opcion_inicial <> "2" Entonces
				Escribir "¡Ups! Opción no válida. Intenta con los números del menú (1 o 2)."
				Escribir "Presiona una tecla para reintentar..."
				Esperar Tecla
			Sino
				Si facturaTotal > 0 Entonces
					Escribir "¡Espera! Tienes productos en el carrito. ¿Realmente quieres salir del sistema? (S/N)"
					Leer confirmacion
					Si confirmacion = "n" O confirmacion = "N" Entonces
						opcion_inicial <- "0"
					FinSi
				FinSi
				Si opcion_inicial = "2" Entonces
					Escribir "¡Gracias por visitarnos! Te esperamos pronto en Dulce Tentación Panadería."
					Escribir "=========================================="
					Escribir "======== PROGRAMA ELABORADO POR: ========="
					Escribir "===== 1. RONALD GUALOTO =================="
					Escribir "===== 2. DERECK MERA ====================="
					Escribir "===== 3. MATEO ROGERON ==================="
					Escribir "=========================================="
				FinSi
			FinSi
		Fin Si
	Hasta Que opcion_inicial = "2"
FinProceso