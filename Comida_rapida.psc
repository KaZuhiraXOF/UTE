//Local comercial
//Nombre propio
//Amigable al usuario
//Mínimo de tres opciones
//Cálculos matemáticos para entregar una Factura
//Orientado y limitado
//El usuario puede escoger salir en cualquier momento


Proceso LaHuecaDelPelao_Kiosko
    // Definición de variables
    Definir opcion_inicial, opciones, opSalchipapa, opBebida, opPostre, numeroPedidos Como Entero
    Definir facturaTotal, subtotal, descuento, totalConDescuento Como Real
    Definir confirmacion Como Caracter
    
    // Inicializamos la factura en 0 al empezar el programa
    facturaTotal <- 0
    
    Repetir
        Escribir "==========================="
        Escribir "===== LA HUECA DEL PELAO ===="
        Escribir "==========================="
        Escribir "1. PARA LLEVAR"
        Escribir "2. PARA COMER"
        Escribir "3. SALIR"
        Leer opcion_inicial
        
        Si opcion_inicial = 1 o opcion_inicial = 2 Entonces
            Repetir
                Escribir "==========================="
                Escribir "   SALDO ACTUAL: $", facturaTotal
                Escribir "==========================="
                Escribir "1. Salchipapas"
                Escribir "2. Bebidas"
                Escribir "3. Postres"
                Escribir "4. GENERAR PAGO / VER RESUMEN"
                Escribir "Seleccione una categoría:"
                Leer opciones
                
                Segun opciones Hacer
                    1: // SECCIÓN SALCHIPAPAS
                        Repetir
                            Escribir "***** MENU SALCHIPAPAS *****"
                            Escribir "1. Salchi guagua......$1.25"
                            Escribir "2. Salchi normal......$1.75"
                            Escribir "3. Salchi volquetera..$2.75"
                            Escribir "4. REGRESAR AL MENÚ PRINCIPAL"
                            Leer opSalchipapa
                            
                            Si opSalchipapa >= 1 y opSalchipapa <= 3 Entonces
                                Escribir "¿Cuántas unidades desea?"
                                Leer numeroPedidos
                                // Validación de mal tipeo o exceso
                                Mientras numeroPedidos <= 0 o numeroPedidos > 10 Hacer
                                    Escribir "Cantidad inválida (Máximo 10). Intente de nuevo:"
                                    Leer numeroPedidos
                                Fin Mientras
                                
                                Segun opSalchipapa Hacer
                                    1: subtotal <- numeroPedidos * 1.25
                                    2: subtotal <- numeroPedidos * 1.75
                                    3: subtotal <- numeroPedidos * 2.75
                                Fin Segun
                                facturaTotal <- facturaTotal + subtotal
                                Escribir "Añadido: $", subtotal
                            FinSi
                        Hasta Que opSalchipapa = 4
                        
                    2: // SECCIÓN BEBIDAS
                        Repetir
                            Escribir "***** MENU BEBIDAS *****"
                            Escribir "1. Cola 500ml.........$0.50"
                            Escribir "2. Agua 500ml.........$0.70"
                            Escribir "3. Limonada (Vaso)....$1.25"
                            Escribir "4. REGRESAR AL MENÚ PRINCIPAL"
                            Leer opBebida
                            
                            Si opBebida >= 1 y opBebida <= 3 Entonces
                                Escribir "¿Cuántas unidades?"
                                Leer numeroPedidos
                                Segun opBebida Hacer
                                    1: subtotal <- numeroPedidos * 0.50
                                    2: subtotal <- numeroPedidos * 0.70
                                    3: subtotal <- numeroPedidos * 1.25
                                Fin Segun
                                facturaTotal <- facturaTotal + subtotal
                                Escribir "Añadido: $", subtotal
                            FinSi
                        Hasta Que opBebida = 4
						
                    3: // SECCIÓN POSTRES (Completado)
                        Escribir "***** POSTRES *****"
                        Escribir "1. Helado............$1.00"
                        Escribir "2. REGRESAR"
                        Leer opPostre
                        Si opPostre = 1 Entonces
                            Escribir "Cantidad:"
                            Leer numeroPedidos
                            facturaTotal <- facturaTotal + (numeroPedidos * 1.00)
                        FinSi
						
                    4: // GENERAR PAGO (Sistema de descuentos)
                        Si facturaTotal > 0 Entonces
                            Escribir "===== RESUMEN DE COMPRA ====="
                            Escribir "Subtotal: $", facturaTotal
                            
                            // Lógica de descuentos
                            descuento <- 0
                            Si facturaTotal >= 30 Entonces
                                descuento <- 0.25 // 25%
                            Sino 
                                Si facturaTotal >= 15 Entonces
                                    descuento <- 0.10 // 10%
                                FinSi
                            FinSi
                            
                            totalConDescuento <- facturaTotal - (facturaTotal * descuento)
                            
                            Escribir "Descuento aplicado: ", (descuento * 100), "%"
                            Escribir "TOTAL A PAGAR: $", totalConDescuento
                            Escribir "¿Aceptar orden y pagar? (S/N)"
                            Leer confirmacion
                            
                            Si confirmacion = "s" o confirmacion = "S" Entonces
                                Escribir "Pago procesado. ¡Gracias por su compra!"
                                facturaTotal <- 0 // Limpiamos para el siguiente cliente
                                opciones <- 4 // Salimos al menú de inicio
                            Sino
                                Escribir "Orden mantenida. Puede seguir editando."
                                opciones <- 0 // Volvemos a las categorías
                            FinSi
                        Sino
                            Escribir "No hay productos en la factura."
                        FinSi
                        
                    De Otro Modo:
                        Escribir "Opción inválida. Intente de nuevo."
                Fin Segun
            Hasta Que opciones = 4
            
        Sino
            Si opcion_inicial = 3 Entonces
                // PREGUNTA DE SEGURIDAD
                Si facturaTotal > 0 Entonces
                    Escribir "ADVERTENCIA: Tiene una orden pendiente de $", facturaTotal
                    Escribir "¿Está seguro que desea salir y cancelar todo? (S/N)"
                    Leer confirmacion
                    Si confirmacion = "s" o confirmacion = "S" Entonces
                        Escribir "Orden cancelada. Vuelva pronto."
                    Sino
                        opcion_inicial <- 0 // Anulamos la salida
                    FinSi
                Sino
                    Escribir "Gracias por visitarnos. ¡Vuelva pronto!"
                FinSi
            FinSi
        Fin Si
        
    Hasta Que opcion_inicial = 3
FinProceso