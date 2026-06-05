Algoritmo triangulo
	Escribir "Ingresa el nùmero de vecces que desees:"
	Leer veces
	
	Escribir "" 
	Escribir "triangulo" 
	Para i<-1 Hasta veces Con Paso 1 Hacer
		Para j<-1 Hasta i Con Paso 1 Hacer
			Escribir Sin Saltar "*"
		Fin Para
		Escribir ""
	Fin Para
	
	Escribir "" 
	Escribir "Cuadrado sin relleno: " 
	Para i<-1 Hasta veces Con Paso 1 Hacer
		Para j<-1 hasta veces Con Paso 1 Hacer
			Si i = 1 o i = veces o j = 1 o j=veces  Entonces
				Escribir Sin Saltar "* "
			SiNo
				Escribir Sin Saltar "  "
			Fin Si
		FinPara
		Escribir ""
	FinPara
	
	Escribir "" 
	Escribir "Rombo"
	Si veces mod 2 = 0 Entonces
		Escribir "El rombo no se puede crear.... Es necesario un nùmero impar"
	SiNo
		//primera parte: superior
		Para i<-1 Hasta veces Con Paso 1 Hacer
			Para j<-0 Hasta veces-i Con Paso 1 Hacer
				Escribir Sin Saltar " "
			Fin Para
			Para k<-1 Hasta i+(i-1) Con Paso 1 Hacer
				Escribir Sin Saltar "*"
			Fin Para
			Escribir""
		Fin Para
		
		//segunda parte: inferior
		Para i<- veces-1 Hasta 1 Con Paso -1 Hacer
			Para j <- 0 Hasta veces - i Con Paso 1 Hacer
				Escribir Sin Saltar " "
			Fin Para
			Para k<-i+(i-1) Hasta 1 Con Paso -1 Hacer
				Escribir Sin Saltar "*"
			Fin Para
			Escribir ""
		Fin Para
		
	FinSi
	
	
	
FinAlgoritmo
