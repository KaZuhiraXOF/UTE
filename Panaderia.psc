Funcion correcto <- ValidarCedula ( cedula )
	Definir correcto Como Logico
	Definir i, suma, digito, provincia, tercerDigito Como Entero
	Definir digitoVerificador, ultimoDigito Como Entero
	
	correcto <- Verdadero
	
	Si Longitud(cedula) <> 10 Entonces
		correcto <- Falso
	Sino
		Para i <- 1 Hasta 10 Con Paso 1 Hacer
			Si Subcadena(cedula, i, i) < "0" O Subcadena(cedula, i, i) > "9" Entonces
				correcto <- Falso
			FinSi
		FinPara
		
		Si correcto = Verdadero Entonces
			provincia <- ConvertirANumero(Subcadena(cedula, 1, 2))
			tercerDigito <- ConvertirANumero(Subcadena(cedula, 3, 3))
			
			Si (provincia < 1 O provincia > 24) Y provincia <> 30 O tercerDigito > 5 Entonces
				correcto <- Falso
			Sino
				suma <- 0
				Para i <- 1 Hasta 9 Con Paso 1 Hacer
					digito <- ConvertirANumero(Subcadena(cedula, i, i))
					
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
	
	Definir opMetodoPago, continuarPago Como Caracter
	Definir pagoCompletado Como Logico
	
	Definir claveIngresada, claveCorrecta, opDueno Como Caracter
	Definir totPanQueso, totEnrollado, totCroissant, totCafe, totJugo, totChocolate, totTorta Como Entero
	Definir cajaEfectivo, cajaTarjeta, cajaTransferencia, cajaTotalGeneral Como Real
	
	facturaTotal <- 0
	cPanQueso <- 0; cEnrollado <- 0; cCroissant <- 0
	cCafe <- 0; cJugo <- 0; cChocolate <- 0; cTorta <- 0
	
	stockPanQueso <- 50; stockEnrollado <- 100; stockCroissant <- 40
	
	totPanQueso <- 0; totEnrollado <- 0; totCroissant <- 0
	totCafe <- 0; totJugo <- 0; totChocolate <- 0; totTorta <- 0
	cajaEfectivo <- 0; cajaTarjeta <- 0; cajaTransferencia <- 0; cajaTotalGeneral <- 0
	claveCorrecta <- "admin123" 
	
	opciones <- "0"
	
	//BLOQUE DEDICADO PARA LA CONSTRUCCIÓN DE LOS MENÚS XD
	esqSupIzq   <- "X"
	esqSupDer   <- "X"
	esqInfIzq   <- "X"
	esqInfDer   <- "X"
	lineaH      <- "-"
	lineaV      <- "|"
	conectorIzq <- "|"
	conectorDer <- "|"
	bloque      <- "#"
	
	Borrar Pantalla
	Escribir ""
	Escribir "  Cargando interfaz de la tienda..."
	barra <- ""
	Para j <- 1 Hasta 20 Hacer
		barra <- barra + bloque
		Borrar Pantalla
		Escribir ""
		Escribir "  Cargando interfaz de la tienda..."
		Escribir "  [" + barra + "]"
		Esperar 50 Milisegundos
	FinPara
	
	//CREANDO LA OPCIÓN PARA DEFINIR LA LINEA HORIZONTAL DEL CÓDIGO
	Definir bordeHorizontal, separadorHorizontal Como Caracter
	Definir bordeHorizontalSuperior, bordeHorizontalInferior, lineaSeparadoraCentral Como Caracter
	Definir k Como Entero
	
	bordeHorizontal <- ""
	separadorHorizontal <- ""
	
	// Este bucle dibuja una línea horizontal de 56 caracteres de largo
	Para k <- 1 Hasta 56 Hacer
		bordeHorizontal <- bordeHorizontal + lineaH
		separadorHorizontal <- separadorHorizontal + lineaH
	FinPara
	
	bordeHorizontalSuperior <- esqSupIzq + bordeHorizontal + esqSupDer
	bordeHorizontalInferior <- esqInfIzq + bordeHorizontal + esqInfDer
	lineaSeparadoraCentral  <- conectorIzq + separadorHorizontal + conectorDer
	//**********************************************************
	Borrar Pantalla
	Escribir ""
	Escribir "  Cargando interfaz de la tienda..."
	barra <- ""
	Para j <- 1 Hasta 20 Hacer
		barra <- barra + bloque
		Borrar Pantalla
		Escribir ""
		Escribir "  Cargando interfaz de la tienda..."
		Escribir "  [" + barra + "]"
		Esperar 50 Milisegundos
	FinPara
	
	Repetir
		
		Borrar Pantalla		
		Escribir bordeHorizontalSuperior
		Escribir lineaV, "               D U L C E  T E N T A C I Ó N             ", lineaV
		Escribir lineaV, "                  - P A N A D E R Í A -                 ", lineaV
		Escribir lineaSeparadoraCentral
		Escribir lineaV, "           " "Porque siempre tendrás ganas de más" "          ", lineaV
		Escribir lineaSeparadoraCentral
		Escribir lineaV, "                                                        ", lineaV
		Escribir lineaV, "    [1] > INGRESAR A LA TIENDA                          ", lineaV
		Escribir lineaV, "    [2] X SALIR DEL SISTEMA                             ", lineaV
		Escribir lineaV, "                                                        ", lineaV
		Escribir bordeHorizontalInferior
		Escribir " Seleccione una opción (1-2): " Sin Saltar
		Leer opcion_inicial
		
		Si opcion_inicial = "1" Entonces
			recargo <- 0
			Repetir
				Si opciones <> "4" Entonces
					Borrar Pantalla
					Escribir bordeHorizontalSuperior
					Escribir lineaV, "               D U L C E  T E N T A C I Ó N             ", lineaV
					Escribir lineaV, "                  - P A N A D E R Í A -                 ", lineaV
					Escribir lineaSeparadoraCentral
					Escribir lineaSeparadoraCentral
					Escribir lineaV, "                M E N Ú  P R I N C I P A L              ", lineaV
					Escribir lineaSeparadoraCentral
					Escribir lineaSeparadoraCentral
					Escribir lineaV, "                                                        ", lineaV
					Escribir lineaV, "    [1] > INGRESAR A LA TIENDA                          ", lineaV
					Escribir lineaV, "    [2] X SALIR DEL SISTEMA                             ", lineaV
					Escribir lineaV, "                                                        ", lineaV
					
					
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
							Escribir "1. Pan de Queso (Stock: ", stockPanQueso, ")_____$1.00"
							Escribir "2. Pan Enrollado (Stock: ", stockEnrollado, ")____$0.15"
							Escribir "3. Pan Cachito (Stock: ", stockCroissant, ")______$0.50"
							Escribir "4. VOLVER"
							Escribir "Ingresa la opción:"
							Leer opPan
							
							Si opPan >= "1" Y opPan <= "3" Entonces
								Escribir "Cantidad:"
								Leer numeroPedidos
								
								Definir stockDisponible Como Logico
								stockDisponible <- Verdadero
								
								Si opPan = "1" Y numeroPedidos > stockPanQueso Entonces
									stockDisponible <- Falso 
								FinSi
								Si opPan = "2" Y numeroPedidos > stockEnrollado Entonces
									stockDisponible <- Falso
								FinSi
								Si opPan = "3" Y numeroPedidos > stockCroissant Entonces
									stockDisponible <- Falso 
								FinSi
								
								Si stockDisponible = Falso Entonces
									Escribir "¡Lo sentimos! No contamos con suficiente stock para esa cantidad."
									Escribir "Presione una tecla para continuar..."
									Esperar Tecla
								Sino
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
							Escribir "=========================================="
							Escribir "            TIPO DE FACTURACIÓN           "
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
									
									Si cedulaValida = Falso Entonces
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
								pagoCompletado <- Falso
								Repetir
									Borrar Pantalla
									Escribir "=========================================="
									Escribir "          SELECCIONE FORMA DE PAGO        "
									Escribir "=========================================="
									Escribir " VALOR A PAGAR: $", totalConDescuento
									Escribir "------------------------------------------"
									Escribir "1. Efectivo"
									Escribir "2. Tarjeta de Crédito"
									Escribir "3. Transferencia / De Una"
									Escribir "4. CANCELAR PROCESO DE PAGO"
									Escribir "=========================================="
									Escribir "Ingrese una opción:"
									Leer opMetodoPago
									
									Segun opMetodoPago Hacer
										"1":
											Escribir "Procesando pago en Efectivo..."
											cajaEfectivo <- cajaEfectivo + totalConDescuento
											pagoCompletado <- Verdadero
										"2":
											Escribir "Por favor, pase la tarjeta..."
											cajaTarjeta <- cajaTarjeta + totalConDescuento
											pagoCompletado <- Verdadero
										"3":
											Escribir "Mostrando código QR..."
											cajaTransferencia <- cajaTransferencia + totalConDescuento
											pagoCompletado <- Verdadero
										"4":
											Escribir "¿Está seguro que desea cancelar el pago? (S/N)"
											Leer continuarPago
											Si continuarPago = "s" O continuarPago = "S" Entonces
												pagoCompletado <- Verdadero 
												confirmacion <- "N" 
											FinSi
										De Otro Modo:
											Escribir "Opción inválida. Intente nuevamente."
											Esperar Tecla
									FinSegun
								Hasta Que pagoCompletado = Verdadero
								
								Si confirmacion = "s" O confirmacion = "S" Entonces
									stockPanQueso <- stockPanQueso - cPanQueso
									stockEnrollado <- stockEnrollado - cEnrollado
									stockCroissant <- stockCroissant - cCroissant
									
									totPanQueso <- totPanQueso + cPanQueso
									totEnrollado <- totEnrollado + cEnrollado
									totCroissant <- totCroissant + cCroissant
									totCafe <- totCafe + cCafe
									totJugo <- totJugo + cJugo
									totChocolate <- totChocolate + cChocolate
									totTorta <- totTorta + cTorta
									
									cajaTotalGeneral <- cajaTotalGeneral + totalConDescuento
									
									Escribir "¡Pago recibido con éxito! Retira tu ticket de compra."
									facturaTotal <- 0; cPanQueso <- 0; cEnrollado <- 0; cCroissant <- 0
									cCafe <- 0; cJugo <- 0; cChocolate <- 0; cTorta <- 0
									opciones <- "5" 
								Sino
									Escribir "Pago cancelado. Volviendo al menú de categorías..."
									opciones <- "0"
								FinSi
							Sino
								Escribir "Orden mantenida. Regresando al menú de categorías..."
								opciones <- "0" 
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
			Si opcion_inicial = "admin" O opcion_inicial = "ADMIN" Entonces
				Borrar Pantalla
				Escribir "=========================================="
				Escribir "       INGRESO AL MODO ADMINISTRADOR       "
				Escribir "=========================================="
				Escribir "Digite la clave de acceso:"
				Leer claveIngresada
				
				Si claveIngresada = claveCorrecta Entonces
					Repetir
						Borrar Pantalla
						Escribir "=========================================="
						Escribir "         SISTEMA DE CONTROL - DUEÑO       "
						Escribir "=========================================="
						Escribir "1. REVISAR DINERO EN CAJA (INGRESOS)"
						Escribir "2. REVISAR STOCK DISPONIBLE (INVENTARIO)"
						Escribir "3. REVISAR HISTORIAL DE VENTAS DEL DÍA"
						Escribir "4. VOLVER AL MENÚ PRINCIPAL"
						Escribir "=========================================="
						Escribir "Seleccione una opción:"
						Leer opDueno
						
						Segun opDueno Hacer
							"1":
								Borrar Pantalla
								Escribir "========= REPORTE DE CAJA ========="
								Escribir "Efectivo Recaudado:     $", cajaEfectivo
								Escribir "Tarjetas de Crédito:    $", cajaTarjeta
								Escribir "Transferencias/De Una:  $", cajaTransferencia
								Escribir "-----------------------------------"
								Escribir "TOTAL RECAUDADO EN EL DÍA: $", cajaTotalGeneral
								Escribir "==================================="
								Escribir "Presione una tecla para regresar..."
								Esperar Tecla
							"2":
								Borrar Pantalla
								Escribir "====== STOCK RESTANTE EN VITRINA ======"
								Escribir "Pan de Queso:   ", stockPanQueso, " unidades."
								Escribir "Pan Enrollado:  ", stockEnrollado, " unidades."
								Escribir "Pan Cachito:    ", stockCroissant, " unidades."
								Escribir "======================================="
								Escribir "Presione una tecla para regresar..."
								Esperar Tecla
							"3":
								Borrar Pantalla
								Escribir "====== UNIDADES VENDIDAS HOY ======"
								Escribir "Pan de Queso:        ", totPanQueso
								Escribir "Pan Enrollado:       ", totEnrollado
								Escribir "Pan Cachito:         ", totCroissant
								Escribir "Café Pasado:         ", totCafe
								Escribir "Jugo Natural:        ", totJugo
								Escribir "Chocolate Caliente:  ", totChocolate
								Escribir "Porción de Torta:    ", totTorta
								Escribir "==================================="
								Escribir "Presione una tecla para regresar..."
								Esperar Tecla
							"4":
								Escribir "Saliendo del modo Administrador..."
							De Otro Modo:
								Escribir "Opción no válida."
								Esperar Tecla
						FinSegun
					Hasta Que opDueno = "4"
				Sino
					Escribir "¡Clave Incorrecta! Acceso denegado."
					Escribir "Presione una tecla para continuar..."
					Esperar Tecla
				FinSi
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
			FinSi
		Fin Si
	Hasta Que opcion_inicial = "2"
FinProceso