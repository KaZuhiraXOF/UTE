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
					Escribir lineaV, "                                                        ", lineaV
					Escribir lineaV, "    [1] > NUESTRA VARIEDAD DE PANES                     ", lineaV
					Escribir lineaV, "    [2] > BEBIDAS CALIENTES/FRÍAS                       ", lineaV
					Escribir lineaV, "    [3] > POSTRES                                       ", lineaV
					Escribir lineaV, "    [4] > GENERAR PAGO / FACTURA                        ", lineaV
					Escribir lineaV, "    [5] X SALIR                                         ", lineaV
					Escribir lineaV, "                                                        ", lineaV
					Escribir lineaSeparadoraCentral
					textoSaldo <- "    SALDO ACTUAL: $" + ConvertirATexto(facturaTotal)
					largoTexto <- Longitud(textoSaldo)
					espaciosNecesarios <- 56 - largoTexto
					Para m <- 1 Hasta espaciosNecesarios Con Paso 1 Hacer
						textoSaldo <- textoSaldo + " "
					FinPara
					Escribir lineaV, textoSaldo, lineaV
					Escribir bordeHorizontalInferior
					Escribir " Seleccione una categoría: " Sin Saltar
					Leer opciones
				FinSi
				
				Segun opciones Hacer
					"1":
						Repetir
							Borrar Pantalla
							Escribir bordeHorizontalSuperior
							Escribir lineaV, "                 M E N Ú  D E  P A N E S                ", lineaV
							Escribir lineaSeparadoraCentral
							Escribir lineaV, "                                                        ", lineaV
							Escribir lineaV, "    [1] > Pan de Queso (Disponible: ", stockPanQueso, ")      $1.00      ", lineaV 
							Escribir lineaV, "    [2] > Pan Enrollado (Disponible: ", stockEnrollado, ")   $0.15       ", lineaV
							Escribir lineaV, "    [3] > Pan Cachito (Disponible: ", stockCroissant, ")     $0.50        ", lineaV
							Escribir lineaV, "    [4] < VOLVER AL MENÚ PRINCIPAL                      ", lineaV
							Escribir lineaV, "                                                        ", lineaV
							Escribir bordeHorizontalInferior
							Escribir " Ingresa la opción: " Sin Saltar
							Leer opPan
							
							Segun opPan Hacer
								"1", "2", "3":
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
								"4":
								De Otro Modo:
									Escribir "¡Ups! Esa opción no la tenemos. Intenta con los números del menú."
									Escribir "Presiona una tecla para reintentar..."
									Esperar Tecla
							FinSegun
						Hasta Que opPan = "4"
						
					"2":
						Repetir
							Borrar Pantalla
							Escribir bordeHorizontalSuperior
							Escribir lineaV, "               M E N Ú  D E  B E B I D A S              ", lineaV
							Escribir lineaSeparadoraCentral
							Escribir lineaV, "                                                        ", lineaV
							Escribir lineaV, "    [1] > Café Pasado __________________________ $0.75  ", lineaV
							Escribir lineaV, "    [2] > Jugo Natural _________________________ $1.25  ", lineaV
							Escribir lineaV, "    [3] > Chocolate Caliente ___________________ $1.50  ", lineaV
							Escribir lineaV, "    [4] < VOLVER AL MENÚ PRINCIPAL                      ", lineaV
							Escribir lineaV, "                                                        ", lineaV
							Escribir bordeHorizontalInferior
							Escribir " Ingresa la opción: " Sin Saltar
							Leer opBebida
							
							Segun opBebida Hacer
								"1", "2", "3":
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
								"4":
								De Otro Modo:
									Escribir "Esa bebida no está en la lista. Intenta de nuevo."
									Escribir "Presiona una tecla para reintentar..."
									Esperar Tecla
							FinSegun
						Hasta Que opBebida = "4"
						
					"3":
						Repetir
							Borrar Pantalla
							Escribir bordeHorizontalSuperior
							Escribir lineaV, "               M E N Ú  D E  P O S T R E S              ", lineaV
							Escribir lineaSeparadoraCentral
							Escribir lineaV, "                                                        ", lineaV
							Escribir lineaV, "    [1] > Porción de Torta _____________________ $1.00  ", lineaV
							Escribir lineaV, "    [2] < VOLVER AL MENÚ PRINCIPAL                      ", lineaV
							Escribir lineaV, "                                                        ", lineaV
							Escribir bordeHorizontalInferior
							Escribir " Ingresa la opción: " Sin Saltar
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
								De Otro Modo:
									Escribir "Opción de postre no válida."
									Escribir "Presiona una tecla para reintentar..."
									Esperar Tecla
							FinSegun
						Hasta Que opPostre = "2"
						
					"4":
						Borrar Pantalla
						Si facturaTotal > 0 Entonces
							Escribir bordeHorizontalSuperior
							Escribir lineaV, "               T I P O  D E  F A C T U R A              ", lineaV
							Escribir lineaSeparadoraCentral
							Escribir lineaV, "                                                        ", lineaV
							Escribir lineaV, "    [1] > CONSUMIDOR FINAL                              ", lineaV
							Escribir lineaV, "    [2] > CON DATOS                                     ", lineaV
							Escribir lineaV, "                                                        ", lineaV
							Escribir bordeHorizontalInferior
							Escribir " Seleccione una opción (1-2): " Sin Saltar
							Leer opFactura
							
							Si opFactura = "2" Entonces
								Escribir " Ingrese el Nombre del Cliente: " Sin Saltar
								Leer nombreCliente
								
								Repetir
									Escribir " Ingrese la Cédula (10 dígitos): " Sin Saltar
									Leer cedulaRuc
									cedulaValida <- ValidarCedula(cedulaRuc)
									
									Si cedulaValida = Falso Entonces
										Escribir " [!] Cédula incorrecta o con caracteres inválidos."
										Escribir "--------------------------------------------------------"
									FinSi
								Hasta Que cedulaValida = Verdadero
							Sino
								nombreCliente <- "CONSUMIDOR FINAL"
								cedulaRuc <- "9999999999"
							FinSi
							
							Borrar Pantalla
							Escribir bordeHorizontalSuperior
							Escribir lineaV, "               F A C T U R A  D E  V E N T A            ", lineaV
							Escribir lineaSeparadoraCentral
							// Ajuste dinámico visual para los datos del cliente
							Escribir lineaV, "  CLIENTE: ", nombreCliente
							// Rellenar espacios faltantes para mantener rígido el borde derecho
							Para m <- 1 Hasta (45 - Longitud(nombreCliente)) Hacer; Escribir " " Sin Saltar; FinPara; Escribir lineaV
							
							Escribir lineaV, "  RUC/CI:  ", cedulaRuc, "                                   ", lineaV
							Escribir lineaSeparadoraCentral
							
							Si cPanQueso > 0 Entonces
								Escribir lineaV, "  ", cPanQueso, " Pan de Queso _______________________ $", (cPanQueso * 1.00), "   ", lineaV
							FinSi
							Si cEnrollado > 0 Entonces
								Escribir lineaV, "  ", cEnrollado, " Pan Enrollado ______________________ $", (cEnrollado * 0.15), "   ", lineaV
							FinSi
							Si cCroissant > 0 Entonces
								Escribir lineaV, "  ", cCroissant, " Pan Cachito ________________________ $", (cCroissant * 0.50), "   ", lineaV
							FinSi
							Si cCafe > 0 Entonces
								Escribir lineaV, "  ", cCafe, " Café Pasado ________________________ $", (cCafe * 0.75), "   ", lineaV
							FinSi
							Si cJugo > 0 Entonces
								Escribir lineaV, "  ", cJugo, " Jugo Natural _______________________ $", (cJugo * 1.25), "   ", lineaV
							FinSi
							Si cChocolate > 0 Entonces
								Escribir lineaV, "  ", cChocolate, " Chocolate Caliente _________________ $", (cChocolate * 1.50), "   ", lineaV
							FinSi
							Si cTorta > 0 Entonces
								Escribir lineaV, "  ", cTorta, " Porción de Torta ___________________ $", (cTorta * 1.00), "   ", lineaV
							FinSi
							
							subtotal <- facturaTotal
							Escribir lineaSeparadoraCentral
							Escribir lineaV, "  Subtotal: $", subtotal, "                                     ", lineaV
							descuento <- 0
							
							Si subtotal >= 10 Entonces
								descuento <- 0.25
							Sino
								Si subtotal >= 5 Entonces
									descuento <- 0.10
								FinSi
							FinSi
							
							totalConDescuento <- subtotal - (subtotal * descuento)
							Escribir lineaV, "  Descuento (", (descuento * 100), "%): -$", (subtotal * descuento), "                         ", lineaV
							Escribir lineaV, "  TOTAL FINAL A PAGAR: $", totalConDescuento, "                         ", lineaV
							Escribir bordeHorizontalInferior
							Escribir " ¿Confirmar el pago de tu orden? (S/N): " Sin Saltar
							Leer confirmacion
							
							Si confirmacion = "s" O confirmacion = "S" Entonces
								pagoCompletado <- Falso
								Repetir
									Borrar Pantalla
									Escribir bordeHorizontalSuperior
									Escribir lineaV, "               F O R M A  D E  P A G O                  ", lineaV
									Escribir lineaSeparadoraCentral
									Escribir lineaV, "   VALOR A PAGAR: $", totalConDescuento, "                               ", lineaV
									Escribir lineaSeparadoraCentral
									Escribir lineaV, "    [1] > Efectivo                                      ", lineaV
									Escribir lineaV, "    [2] > Tarjeta de Crédito                            ", lineaV
									Escribir lineaV, "    [3] > Transferencia / De Una                        ", lineaV
									Escribir lineaV, "    [4] < CANCELAR PROCESO DE PAGO                      ", lineaV
									Escribir lineaV, "                                                        ", lineaV
									Escribir bordeHorizontalInferior
									Escribir " Ingrese una opción (1-4): " Sin Saltar
									Leer opMetodoPago
									
									Segun opMetodoPago Hacer
										"1":
											Escribir " Procesando pago en Efectivo..."
											cajaEfectivo <- cajaEfectivo + totalConDescuento
											pagoCompletado <- Verdadero
										"2":
											Escribir " Por favor, pase la tarjeta por el lector..."
											cajaTarjeta <- cajaTarjeta + totalConDescuento
											pagoCompletado <- Verdadero
										"3":
											// VISUAL: Código QR simulado dinámico para la consola
											Borrar Pantalla
											Escribir " ??????????????????????????????????????????????????????"
											Escribir " ?       ESCANEA EL CÓDIGO PARA PROCEDER AL PAGO      ?"
											Escribir " ??????????????????????????????????????????????????????"
											Escribir " ?                                                    ?"
											Escribir " ?            ##  ######  ##    ##  ######            ?"
											Escribir " ?            ##  ##  ##  ##    ##  ##  ##            ?"
											Escribir " ?            ######  ##  ########  ######            ?"
											Escribir " ?            ##  ######  ##    ##  ####              ?"
											Escribir " ?            ##  ##  ##  ##    ##  ##  ##            ?"
											Escribir " ?                                                    ?"
											Escribir " ?         Monto a Transferir: $", totalConDescuento, "                 ?"
											Escribir " ??????????????????????????????????????????????????????"
											Escribir " Presione cualquier tecla una vez realizada la transferencia..."
											Esperar Tecla
											cajaTransferencia <- cajaTransferencia + totalConDescuento
											pagoCompletado <- Verdadero
										"4":
											Escribir " ¿Está seguro que desea cancelar el pago? (S/N): " Sin Saltar
											Leer continuarPago
											Si continuarPago = "s" O continuarPago = "S" Entonces
												pagoCompletado <- Verdadero 
												confirmacion <- "N" 
											FinSi
										De Otro Modo:
											Escribir " Opción inválida. Intente nuevamente."
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
									
									Borrar Pantalla
									Escribir bordeHorizontalSuperior
									Escribir lineaV, "  ", visto, " ¡PAGO RECIBIDO CON ÉXITO!                          ", lineaV
									Escribir lineaV, "     Por favor retira tu ticket de compra.              ", lineaV
									Escribir bordeHorizontalInferior
									
									facturaTotal <- 0; cPanQueso <- 0; cEnrollado <- 0; cCroissant <- 0
									cCafe <- 0; cJugo <- 0; cChocolate <- 0; cTorta <- 0
									opciones <- "5" 
								Sino
									Escribir " Pago cancelado. Volviendo al menú de categorías..."
									opciones <- "0"
								FinSi
							Sino
								Escribir " Orden mantenida en el carrito. Regresando..."
								opciones <- "0" 
							FinSi
							Escribir " Presione una tecla para continuar..."
							Esperar Tecla
						Sino
							Escribir " Tu carrito todavía está vacío. ¡Antójate de algo!"
							Escribir " Presiona una tecla para continuar..."
							Esperar Tecla
							opciones <- "0"
						FinSi
						
					"5":
						Si facturaTotal > 0 Entonces
							Escribir " Si regresas al inicio se borrará tu pedido de: $", facturaTotal
							Escribir " ¿Deseas continuar y vaciar el carrito? (S/N): " Sin Saltar
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
						Escribir " Opcón no válida. Selecciona un número del menú principal."
						Escribir " Presiona una tecla para continuar..."
						Esperar Tecla
						opciones <- "0"
				Fin Segun
			Hasta Que opciones = "5"
			
		Sino
			Si opcion_inicial = "admin" O opcion_inicial = "ADMIN" Entonces
				Borrar Pantalla
				Escribir "??????????????????????????????????????????????????????????"
				Escribir "?             MODO ADMINISTRACIÓN DE SISTEMA             ?"
				Escribir "??????????????????????????????????????????????????????????"
				Escribir " Digite la clave de acceso seguro: " Sin Saltar
				Leer claveIngresada
				
				Si claveIngresada = claveCorrecta Entonces
					Repetir
						Borrar Pantalla
						Escribir bordeHorizontalSuperior
						Escribir lineaV, "             M O D O   S U P E R V I S O R              ", lineaV
						Escribir lineaSeparadoraCentral
						Escribir lineaV, "    [1] > REVISAR TOTAL RECAUDADO (CAJA)                ", lineaV
						Escribir lineaV, "    [2] > REVISAR INVENTARIO DISPONIBLE                 ", lineaV
						Escribir lineaV, "    [3] > REVISAR UNIDADES VENDIDAS HOY                 ", lineaV
						Escribir lineaV, "    [4] < VOLVER AL MENÚ DE INICIO                      ", lineaV
						Escribir bordeHorizontalInferior
						Escribir " Seleccione una opción (1-4): " Sin Saltar
						Leer opDueno
						
						Segun opDueno Hacer
							"1":
								Borrar Pantalla
								Escribir bordeHorizontalSuperior
								Escribir lineaV, "                R E P O R T E  D E  C A J A             ", lineaV
								Escribir lineaSeparadoraCentral
								Escribir lineaV, "  Efectivo Recaudado:      $", cajaEfectivo, "                           ", lineaV
								Escribir lineaV, "  Tarjetas de Crédito:     $", cajaTarjeta, "                           ", lineaV
								Escribir lineaV, "  Transferencias Bancarias: $", cajaTransferencia, "                           ", lineaV
								Escribir lineaSeparadoraCentral
								Escribir lineaV, "  TOTAL RECAUDADO DEL DÍA: $", cajaTotalGeneral, "                           ", lineaV
								Escribir bordeHorizontalInferior
								Escribir " Presione una tecla para regresar..."
								Esperar Tecla
							"2":
								Borrar Pantalla
								Escribir bordeHorizontalSuperior
								Escribir lineaV, "             I N V E N T A R I O  A C T U A L           ", lineaV
								Escribir lineaSeparadoraCentral
								Escribir lineaV, "  Pan de Queso:   ", stockPanQueso, " unidades disponibles.               ", lineaV
								Escribir lineaV, "  Pan Enrollado:  ", stockEnrollado, " unidades disponibles.              ", lineaV
								Escribir lineaV, "  Pan Cachito:    ", stockCroissant, " unidades disponibles.               ", lineaV
								Escribir bordeHorizontalInferior
								Escribir " Presione una tecla para regresar..."
								Esperar Tecla
							"3":
								Borrar Pantalla
								Escribir bordeHorizontalSuperior
								Escribir lineaV, "          U N I D A D E S  D E S P A C H A D A S        ", lineaV
								Escribir lineaSeparadoraCentral
								Escribir lineaV, "  Pan de Queso:        ", totPanQueso, " unidades.                       ", lineaV
								Escribir lineaV, "  Pan Enrollado:       ", totEnrollado, " unidades.                      ", lineaV
								Escribir lineaV, "  Pan Cachito:         ", totCroissant, " unidades.                       ", lineaV
								Escribir lineaV, "  Café Pasado:         ", totCafe, " unidades.                            ", lineaV
								Escribir lineaV, "  Jugo Natural:        ", totJugo, " unidades.                            ", lineaV
								Escribir lineaV, "  Chocolate Caliente:  ", totChocolate, " unidades.                       ", lineaV
								Escribir lineaV, "  Porción de Torta:    ", totTorta, " unidades.                           ", lineaV
								Escribir bordeHorizontalInferior
								Escribir " Presione una tecla para regresar..."
								Esperar Tecla
							"4":
								Escribir " Saliendo del panel de control de administrador..."
							De Otro Modo:
								Escribir " Opción inválida dentro del panel."
								Esperar Tecla
						FinSegun
					Hasta Que opDueno = "4"
				Sino
					Escribir " [!] Clave Incorrecta. Intento denegado."
					Escribir " Presione una tecla para continuar..."
					Esperar Tecla
				FinSi
			Sino
				Si opcion_inicial <> "2" Entonces
					Escribir " ¡Ups! Selección inválida. Elige 1 o 2."
					Escribir " Presiona una tecla para reintentar..."
					Esperar Tecla
				Sino
					Si facturaTotal > 0 Entonces
						Escribir " ¡Atención! Dejarás productos en el carrito. ¿Salir igual? (S/N): " Sin Saltar
						Leer confirmacion
						Si confirmacion = "n" O confirmacion = "N" Entonces
							opcion_inicial <- "0"
						FinSi
					FinSi
					Si opcion_inicial = "2" Entonces
						Borrar Pantalla
						Escribir bordeHorizontalSuperior
						Escribir lineaV, "         ¡GRACIAS POR VISITARNOS VUELVA PRONTO!         ", lineaV
						Escribir lineaSeparadoraCentral
						Escribir lineaV, "    SISTEMA DESARROLLADO POR:                           ", lineaV
						Escribir lineaV, "      1. RONALD GUALOTO                                 ", lineaV
						Escribir lineaV, "      2. DERECK MERA                                    ", lineaV
						Escribir lineaV, "      3. MATEO ROGERON                                  ", lineaV
						Escribir bordeHorizontalInferior
					FinSi
				FinSi
			FinSi
		Fin Si
	Hasta Que opcion_inicial = "2"
FinProceso