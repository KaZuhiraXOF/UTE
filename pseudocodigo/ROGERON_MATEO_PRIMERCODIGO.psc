Algoritmo Saludo
	Escribir "¿Què onda? Mi nombre es Mateo"
	Escribir "Cuèntame, ¿Cuàl es tu nombre?"
	leer nombre
	Escribir "------------------------------------------------"
	Escribir "Hola, ", nombre," Cuentame sobre ti, ¿Cuàntos años tienes?"
	leer edad
	Escribir "------------------------------------------------"
	Escribir "Asì que ", edad, " ¿De què colegio saliste?"
	leer colegio
	Escribir "------------------------------------------------"
	Escribir colegio, "... Lo escuchè de algún lado... Oye, ¿Cuàl es tu hobby? Eso que te suele relajar cuando te ajetreas"
	leer hobby
	Escribir "------------------------------------------------"
	Escribir "Si ", hobby, " es lo que disfrutas... Mejor me ahorro mis comentarios. Tengo otras preguntas, ¿te las puedo hacer? Responde con si o no"
	leer opciones
	Escribir "------------------------------------------------"
	Para num <- 0 Hasta 2 Con Paso 1 Hacer
		Si opciones = "si" O opciones = "no" Entonces
			Si opciones = "si" Entonces
				Escribir "Gracias... ¿Tienes alguna mascota? Responde con si o no"
				leer consultaMascota
				Escribir "------------------------------------------------"
				Si consultaMascota = "si" O consultaMascota = "no" Entonces
					Si consultaMascota = "si" Entonces
						Escribir "¡Genial! Tambien tengo una..."
						Escribir "------------------------------------------------"
						num = 2
					SiNo
						Escribir "Qué lástima... No importa espero puedas conseguir una muy pronto"
						Escribir "------------------------------------------------"
						num = 2
					Fin Si
				SiNo
					Escribir "Si no me querías decir hubieras puesto no... Tampoco me puedo enojar"
					Escribir "------------------------------------------------"
				Fin Si
			SiNo
				Escribir "Okey... No hay problema"
				Escribir "------------------------------------------------"
			Fin Si
			
		SiNo
			Escribir "Esa respuesta no buscaba. Debes escribir si o no, en minùsculas... Intèntalo otra vez"
			leer opciones
			Escribir "------------------------------------------------"
		Fin Si
	Fin Para
	
	Escribir "Fue un placer conocerte un poquito... Disfruta de estar en la UTE. Bye Bye"
	Escribir "------------------------------------------------"

FinAlgoritmo

