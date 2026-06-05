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
	
	// VARIABLES DE DISEÑO COHESIVAS (NUEVAS Y SIN DUPLICADOS)
	Definir esqSupIzq, esqSupDer, esqInfIzq, esqInfDer, lineaH, lineaV, conectorIzq, conectorDer, bloque, visto Como Caracter
	Definir barra, textoSaldo, textoItem, textoPrecio, lineaQR Como Caracter
	Definir j, k, m, n, espaciosNecesarios, largoTexto, largoItem, largoPrecio, espaciosFaltantes Como Entero
	Definir stockDisponible Como Logico
	Definir precioCalculado Como Real
	
	// VARIABLES PARA LA SIMULACIÓN DEL CÓDIGO QR
	Definir dimension_qr, qri, qrj Como Entero
	dimension_qr <- 21
	Definir matriz Como Entero
	Dimension matriz[21, 21]
	
	facturaTotal <- 0
	cPanQueso <- 0; cEnrollado <- 0; cCroissant <- 0
	cCafe <- 0; cJugo <- 0; cChocolate <- 0; cTorta <- 0
	
	stockPanQueso <- 50; stockEnrollado <- 100; stockCroissant <- 40
	
	totPanQueso <- 0; totEnrollado <- 0; totCroissant <- 0
	totCafe <- 0; totJugo <- 0; totChocolate <- 0; totTorta <- 0
	cajaEfectivo <- 0; cajaTarjeta <- 0; cajaTransferencia <- 0; cajaTotalGeneral <- 0
	claveCorrecta <- "admin123" 
	
	opciones <- "0"
	
	// ASIGNACIÓN DE CARACTERES PARA ENTORNO COMPATIBLE
	esqSupIzq   <- "X"
	esqSupDer   <- "X"
	esqInfIzq   <- "X"
	esqInfDer   <- "X"
	lineaH      <- "-"
	lineaV      <- "|"
	conectorIzq <- "|"
	conectorDer <- "|"
	bloque      <- "#"
	visto       <- "V"
	
	// CONSTRUCCIÓN DINÁMICA DE LOS BORDES HORIZONTALES (56 espacios internos)
	bordeHorizontal <- ""
	separadorHorizontal <- ""
	Para k <- 1 Hasta 56 Hacer
		bordeHorizontal <- bordeHorizontal + lineaH
		separadorHorizontal <- separadorHorizontal + lineaH
	FinPara
	
	bordeHorizontalSuperior <- esqSupIzq + bordeHorizontal + esqSupDer
	bordeHorizontalInferior <- esqInfIzq + bordeHorizontal + esqInfDer
	lineaSeparadoraCentral  <- conectorIzq + separadorHorizontal + conectorDer
	
	// ANIMACIÓN DE CARGA INICIAL
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
		Escribir lineaV, "                D U L C E  T E N T A C I Ó N            ", lineaV
		Escribir lineaV, "                   - P A N A D E R Í A -                ", lineaV
		Escribir lineaSeparadoraCentral
		Escribir lineaV, "            Porque siempre tendrás ganas de más         ", lineaV
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
					Escribir lineaV, "                D U L C E  T E N T A C I Ó N            ", lineaV
					Escribir lineaV, "                   - P A N A D E R Í A -                ", lineaV
					Escribir lineaSeparadoraCentral
					Escribir lineaSeparadoraCentral
					Escribir lineaV, "                     M E N Ú  P R I N C I P A L         ", lineaV
					Escribir lineaSeparadoraCentral
					Escribir lineaV, "                                                        ", lineaV
					Escribir lineaV, "    [1] > NUESTRA VARIEDAD DE PANES                     ", lineaV
					Escribir lineaV, "    [2] > BEBIDAS CALIENTES/FRÍAS                       ", lineaV
					Escribir lineaV, "    [3] > POSTRES                                       ", lineaV
					Escribir lineaV, "    [4] > GENERAR PAGO / FACTURA                        ", lineaV
					Escribir lineaV, "    [5] X SALIR                                         ", lineaV
					Escribir lineaV, "                                                        ", lineaV
					Escribir lineaSeparadoraCentral
					
					// MANEJO DINÁMICO DEL SALDO
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
							Escribir lineaV, "                  M E N Ú  D E  P A N E S               ", lineaV
							Escribir lineaSeparadoraCentral
							Escribir lineaV, "                                                        ", lineaV
							Escribir lineaV, "    [1] > Pan de Queso (Disponible: ", stockPanQueso, ")           $1.00 ", lineaV 
							Escribir lineaV, "    [2] > Pan Enrollado (Disponible: ", stockEnrollado, ")         $0.15 ", lineaV
							Escribir lineaV, "    [3] > Pan Cachito (Disponible: ", stockCroissant, ")            $0.50 ", lineaV
							Escribir lineaV, "    [4] < VOLVER AL MENÚ PRINCIPAL                      ", lineaV
							Escribir lineaV, "                                                        ", lineaV
							Escribir bordeHorizontalInferior
							Escribir " Ingresa la opción: " Sin Saltar
							Leer opPan
							
							Segun opPan Hacer
								"1", "2", "3":
									Escribir "Cantidad:"
									Leer numeroPedidos
									
									stockDisponible <- Verdadero
									Si opPan = "1" Y numeroPedidos > stockPanQueso Entonces; stockDisponible <- Falso; FinSi
									Si opPan = "2" Y numeroPedidos > stockEnrollado Entonces; stockDisponible <- Falso; FinSi
									Si opPan = "3" Y numeroPedidos > stockCroissant Entonces; stockDisponible <- Falso; FinSi
									
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
									// Salida limpia
								De Otro Modo:
									Escribir "¡Ups! Esa opción no la tenemos. Intenta con los números del menú."
									Escribir "Presiona una tecla para reintentar..."
									Esperar Tecla
							FinSegun
						Hasta Que opPan = "4"
						opciones <- "0"
						
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
						opciones <- "0"
						
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
						opciones <- "0"
						
					"4":
						Borrar Pantalla
						Si facturaTotal > 0 Entonces
							subtotal <- facturaTotal
							descuento <- 0
							Si subtotal >= 10 Entonces; descuento <- 0.25; Sino; Si subtotal >= 5 Entonces; descuento <- 0.10; FinSi; FinSi
									totalConDescuento <- subtotal - (subtotal * descuento)
									
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
									
									// ========================================================
									// INTERFAZ DE FACTURA ESTILO TICKET REAL ALINEADO
									// ========================================================
									Borrar Pantalla
									Escribir bordeHorizontalSuperior
									Escribir lineaV, "             R E C I B O  D E  C O M P R A              ", lineaV
									Escribir lineaV, "               DULCE TENTACIÓN PANADERÍA                ", lineaV
									Escribir lineaV, "                 RUC: 1792456789001                     ", lineaV
									Escribir lineaSeparadoraCentral
									
									textoItem <- "  CLIENTE: " + nombreCliente
									largoItem <- Longitud(textoItem)
									Escribir lineaV, textoItem Sin Saltar
									Para m <- 1 Hasta (56 - largoItem) Hacer; Escribir " " Sin Saltar; FinPara; Escribir lineaV
									
									textoItem <- "  RUC/CI:  " + cedulaRuc
									largoItem <- Longitud(textoItem)
									Escribir lineaV, textoItem Sin Saltar
									Para m <- 1 Hasta (56 - largoItem) Hacer; Escribir " " Sin Saltar; FinPara; Escribir lineaV
									
									Escribir lineaSeparadoraCentral
									Escribir lineaV, "  CANT.   DESCRIPCIÓN                        TOTAL     ", lineaV
									Escribir lineaSeparadoraCentral
									
									Para n <- 1 Hasta 7 Hacer
										imprimirLinea <- Falso
										
										Segun n Hacer
											1: Si cPanQueso > 0 Entonces;   textoItem <- "   " + ConvertirATexto(cPanQueso) + "     Pan de Queso";   precioCalculado <- cPanQueso * 1.00;   imprimirLinea <- Verdadero; FinSi
											2: Si cEnrollado > 0 Entonces;  textoItem <- "   " + ConvertirATexto(cEnrollado) + "     Pan Enrollado";  precioCalculado <- cEnrollado * 0.15;  imprimirLinea <- Verdadero; FinSi
											3: Si cCroissant > 0 Entonces;  textoItem <- "   " + ConvertirATexto(cCroissant) + "     Pan Cachito";    precioCalculado <- cCroissant * 0.50;  imprimirLinea <- Verdadero; FinSi
											4: Si cCafe > 0 Entonces;       textoItem <- "   " + ConvertirATexto(cCafe) + "     Café Pasado";    precioCalculado <- cCafe * 0.75;       imprimirLinea <- Verdadero; FinSi
											5: Si cJugo > 0 Entonces;       textoItem <- "   " + ConvertirATexto(cJugo) + "     Jugo Natural";   precioCalculado <- cJugo * 1.25;       imprimirLinea <- Verdadero; FinSi
											6: Si cChocolate > 0 Entonces;  textoItem <- "   " + ConvertirATexto(cChocolate) + "     Choc. Caliente"; precioCalculado <- cChocolate * 1.50;  imprimirLinea <- Verdadero; FinSi
											7: Si cTorta > 0 Entonces;      textoItem <- "   " + ConvertirATexto(cTorta) + "     Porción Torta";  precioCalculado <- cTorta * 1.00;      imprimirLinea <- Verdadero; FinSi
										FinSegun
										
										Si imprimirLinea = Verdadero Entonces
											textoPrecio <- "$" + ConvertirATexto(precioCalculado)
											largoItem <- Longitud(textoItem)
											largoPrecio <- Longitud(textoPrecio)
											espaciosFaltantes <- 56 - largoItem - largoPrecio - 5
											
											Escribir lineaV, textoItem Sin Saltar
											Para m <- 1 Hasta espaciosFaltantes Hacer; Escribir " " Sin Saltar; FinPara
											Escribir textoPrecio, "     ", lineaV
										FinSi
									FinPara
									
									Escribir lineaSeparadoraCentral
									textoPrecio <- "$" + ConvertirATexto(subtotal)
									Escribir lineaV, "  SUBTOTAL: " Sin Saltar
									Para m <- 1 Hasta (41 - Longitud(textoPrecio)) Hacer; Escribir " " Sin Saltar; FinPara; Escribir textoPrecio, "     ", lineaV
									
									textoPrecio <- "-$" + ConvertirATexto(subtotal * descuento)
									Escribir lineaV, "  DESCUENTO (", (descuento * 100), "%): " Sin Saltar
									Para m <- 1 Hasta (32 - Longitud(textoPrecio)) Hacer; Escribir " " Sin Saltar; FinPara; Escribir textoPrecio, "     ", lineaV
									
									Escribir lineaSeparadoraCentral
									textoPrecio <- "$" + ConvertirATexto(totalConDescuento)
									Escribir lineaV, "  TOTAL A PAGAR: " Sin Saltar
									Para m <- 1 Hasta (36 - Longitud(textoPrecio)) Hacer; Escribir " " Sin Saltar; FinPara; Escribir textoPrecio, "     ", lineaV
									Escribir bordeHorizontalInferior
									
									Escribir " ¿Confirmar el pago de tu orden? (S/N): " Sin Saltar
									Leer confirmacion
									
									Si confirmacion = "s" O confirmacion = "S" Entonces
										pagoCompletado <- Falso
										Repetir
											Borrar Pantalla
											Escribir bordeHorizontalSuperior
											Escribir lineaV, "                F O R M A  D E  P A G O                 ", lineaV
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
													Borrar Pantalla
													Escribir bordeHorizontalSuperior
													Escribir lineaV, "        ESCANEA EL CÓDIGO PARA PROCEDER AL PAGO        ", lineaV
													Escribir lineaSeparadoraCentral
													Escribir lineaV, "                                                        ", lineaV
													
													Para qri <- 1 Hasta dimension_qr Hacer
														Para qrj <- 1 Hasta dimension_qr Hacer
															matriz[qri, qrj] <- Azar(2)
														FinPara
													FinPara
													
													Para qri <- 1 Hasta 7 Hacer
														Para qrj <- 1 Hasta 7 Hacer
															Si qri=1 O qri=7 O qrj=1 O qrj=7 O (qri>=3 Y qri<=5 Y qrj>=3 Y qrj<=5) Entonces
																matriz[qri, qrj] <- 1
															Sino 
																matriz[qri, qrj] <- 0
															FinSi
														FinPara
															Para qrj <- 15 Hasta 21 Hacer
																Si qri=1 O qri=7 O qrj=15 O qrj=21 O (qri>=3 Y qri<=5 Y qrj>=17 Y qrj<=19) Entonces
																	matriz[qri, qrj] <- 1
																Sino; matriz[qri, qrj] <- 0
																FinSi
															FinPara
													FinPara
													Para qri <- 15 Hasta 21 Hacer
														Para qrj <- 1 Hasta 7 Hacer
															Si qri=1 O qri=15 O qri=21 O qrj=1 O qrj=7 O (qri>=17 Y qri<=19 Y qrj>=3 Y qrj<=5) Entonces
																matriz[qri, qrj] <- 1 
															Sino 
																matriz[qri, qrj] <- 0
															FinSi
														FinPara
													FinPara
																
													Para qri <- 1 Hasta dimension_qr Con Paso 1 Hacer
														lineaQR <- ""
														Para qrj <- 1 Hasta dimension_qr Con Paso 1 Hacer
															Si matriz[qri, qrj] = 1 Entonces
																lineaQR <- lineaQR + "##"
															Sino
																lineaQR <- lineaQR + "  "
															FinSi
														FinPara
														Escribir lineaV, "       ", lineaQR, "       ", lineaV
													FinPara
																	
																	Escribir lineaSeparadoraCentral
																	textoPrecio <- "  Monto a Transferir: $" + ConvertirATexto(totalConDescuento)
																	Escribir lineaV, textoPrecio Sin Saltar
																	Para m <- 1 Hasta (56 - Longitud(textoPrecio)) Hacer; Escribir " " Sin Saltar; FinPara; Escribir lineaV
																	Escribir bordeHorizontalInferior
																	
																	Escribir " Presione cualquier tecla una vez realizada la transferencia..."
																	Esperar Tecla
																	Borrar Pantalla
																	Escribir ""
																	Escribir "  Comprobando el pago realizado..."
																	barra <- ""
																	Para j <- 1 Hasta 20 Hacer
																		barra <- barra + bloque
																		Borrar Pantalla
																		Escribir ""
																		Escribir "  Comprobando el pago realizado.."
																		Escribir "  [" + barra + "]"
																		Esperar 200 Milisegundos
																	FinPara
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
															Escribir lineaV, "   ", visto, " ¡PAGO RECIBIDO CON ÉXITO!                         ", lineaV
															Escribir lineaV, "      Por favor retira tu ticket de compra.             ", lineaV
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
													Escribir " Si regresarás al inicio se borrará tu pedido de: $", facturaTotal
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
												Escribir " Opción no válida. Selecciona un número del menú principal."
												Escribir " Presiona una tecla para continuar..."
												Esperar Tecla
												opciones <- "0"
										Fin Segun
									Hasta Que opciones = "5"
									
								Sino
									Si opcion_inicial = "admin" O opcion_inicial = "ADMIN" Entonces
										Borrar Pantalla
										Escribir ""
										Escribir "  ENTRANDO AL MODO ADMINISTRADOR..."
										barra <- ""
										Para j <- 1 Hasta 20 Hacer
											barra <- barra + bloque
											Borrar Pantalla
											Escribir ""
											Escribir "  ENTRANDO AL MODO ADMINISTRADOR..."
											Escribir "  [" + barra + "]"
											Esperar 100 Milisegundos
										FinPara
										
										Borrar Pantalla
										Escribir bordeHorizontalSuperior
										Escribir lineaV, "             MODO ADMINISTRACIÓN DE SISTEMA             ", lineaV
										Escribir bordeHorizontalInferior
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