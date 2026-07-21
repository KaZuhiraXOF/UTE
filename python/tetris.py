import tkinter as tk 
import random

ventana = tk.Tk()
ventana.title("TETRIS")
ventana.geometry("600x500")
ventana.resizable(False,False)

FILAS = 20
COLUMNAS = 10
CELDA_TAM = 22
puntuacion = 0

juego_en_progreso = True

ventana_puntos = tk.Label(ventana, text="Puntos: 0", font=("Arial", 16, "bold"))
ventana_puntos.place(x=350, y=30)

COLORES = [
    "#121212",  
    "#00f0f0", 
    "#0000f0",  
    "#f0a000",  
    "#f0f000",  
    "#00f000",  
    "#a000f0", 
    "#f00000"   
]

tablero_juego = tk.Canvas(ventana, width=COLUMNAS * CELDA_TAM, height=FILAS * CELDA_TAM, bg=COLORES[0])
tablero_juego.place(x=50, y=30)

tablero = [[0 for _ in range(COLUMNAS)] for _ in range(FILAS)]

'''Esto se llama matriz mediante coordenadas relativas.
Para los tetriminio se forman 4 bloques. Es por eso que
para cada piesa indicamos la posicion de cad uno de sus elementos mientras
va bajando o cuando se cambie la orientacion'''
PIEZAS = [
    [[1, 0], [1, 1], [1, 2], [1, 3]],  
    [[0, 0], [1, 0], [1, 1], [1, 2]],  
    [[0, 2], [1, 0], [1, 1], [1, 2]],  
    [[0, 0], [0, 1], [1, 0], [1, 1]],  
    [[0, 1], [0, 2], [1, 0], [1, 1]],  
    [[0, 1], [1, 0], [1, 1], [1, 2]],  
    [[0, 0], [0, 1], [1, 1], [1, 2]]   
]

pieza_actual = None  # Almacenará la lista de coordenadas de la pieza activa (ej. [[1,0], [1,1]...])
color_actual = 0    
pieza_fila = 0      
pieza_col = 0     

def nueva_pieza():
    global pieza_actual, color_actual, pieza_col, pieza_fila

    indice = random.randint(0, len(PIEZAS) -1 )

    pieza_actual = [list(bloque) for bloque in PIEZAS[indice]]
    color_actual = indice + 1

    pieza_fila = 0
    pieza_col = COLUMNAS // 2-2

def dibujar_pantalla_juego():
    global juego_en_progreso
    tablero_juego.delete("all")

    for i in range(FILAS):
        for j in range (COLUMNAS):
            color_indice = tablero[i][j]
            x1 = j * CELDA_TAM
            y1 = i * CELDA_TAM
            x2 = x1 + CELDA_TAM
            y2 = y1 + CELDA_TAM

            tablero_juego.create_rectangle(x1, y1, x2, y2, fill=COLORES[color_indice], outline="#1f1f1f")
    if pieza_actual:
        for i,j in pieza_actual:
            x1 = (j + pieza_col) * CELDA_TAM
            y1 = (i + pieza_fila) * CELDA_TAM
            x2 = x1 + CELDA_TAM
            y2 = y1 + CELDA_TAM

            tablero_juego.create_rectangle(x1, y1, x2, y2, fill=COLORES[color_actual], outline=COLORES[0])
            
    if not juego_en_progreso:
        # Dibujamos un rectángulo semi-transparente u oscuro para que resalte el texto
        tablero_juego.create_rectangle(10, (FILAS * CELDA_TAM) // 2 - 30, 
                                       (COLUMNAS * CELDA_TAM) - 10, (FILAS * CELDA_TAM) // 2 + 30, 
                                       fill="#000000", outline="white")
        
        # Escribimos el texto en el centro exacto del Canvas
        tablero_juego.create_text((COLUMNAS * CELDA_TAM) // 2, (FILAS * CELDA_TAM) // 2, 
                                  text="GAME OVER", fill="red", font=("Arial", 18, "bold"))


def colisiones(nueva_fila,nueva_columna,pieza):
    for i,j in pieza:
        pos_f = i + nueva_fila
        pos_c = j + nueva_columna

        if pos_c < 0 or pos_c>= COLUMNAS or pos_f >= FILAS:
            return True
        
        if pos_f >= 0 and tablero[pos_f][pos_c] != 0:
            return True
        
    return False


def rotar():
    global pieza_actual
    if not pieza_actual:
        return

    nueva_forma = []
    for i, j in pieza_actual:
        nueva_forma.append([j, -i])

    min_f = min(f for f, c in nueva_forma)
    min_c = min(c for f, c in nueva_forma)
    pieza_rotada = [[f - min_f, c - min_c] for f, c in nueva_forma]

    if not colisiones(pieza_fila, pieza_col, pieza_rotada):
        pieza_actual = pieza_rotada
        dibujar_pantalla_juego()

def limpieza_lineas():
    global tablero, puntuacion
    filas_sin_llenar = [fila for fila in tablero if any(celda == 0 for celda in fila)]
    lineas_eliminadas = FILAS - len(filas_sin_llenar)
    if lineas_eliminadas > 0:
        puntuacion += lineas_eliminadas * 100
        ventana_puntos.config(text=f"Puntos: {puntuacion}")

        filas_nuevas = [[0 for _ in range(COLUMNAS)] for _ in range(lineas_eliminadas)]
        
        tablero = filas_nuevas + filas_sin_llenar

def nueva_pieza():
    global pieza_actual, color_actual, pieza_col, pieza_fila, juego_en_progreso
    
    if not juego_en_progreso:
        return

    indice = random.randint(0, len(PIEZAS) - 1)
    pieza_actual = [list(bloque) for bloque in PIEZAS[indice]]
    color_actual = indice + 1

    pieza_fila = 0
    pieza_col = COLUMNAS // 2 - 2

    if colisiones(pieza_fila, pieza_col, pieza_actual):
        juego_en_progreso = False
        
def mover(df, dc):
    global pieza_fila, pieza_col, juego_en_progreso

    if not juego_en_progreso:
        return False

    futura_fila = pieza_fila + df
    futura_col = pieza_col + dc

    if not colisiones(futura_fila, futura_col, pieza_actual):
        pieza_fila = futura_fila
        pieza_col = futura_col
        dibujar_pantalla_juego()
        return True

    if df > 0:
        for i, j in pieza_actual:
            f_tablero = i + pieza_fila
            c_tablero = j + pieza_col
            if f_tablero >= 0:
                tablero[f_tablero][c_tablero] = color_actual
        
        limpieza_lineas()
        nueva_pieza()
        dibujar_pantalla_juego()
        
    return False


def gravedad():
    mover(1, 0)
    ventana.after(500, gravedad)


ventana.bind("<Up>", lambda event: rotar())
ventana.bind("<Left>", lambda event: mover(0, -1)) 
ventana.bind("<Right>", lambda event: mover(0, 1))  
ventana.bind("<Down>", lambda event: mover(1, 0)) 

nueva_pieza()        
dibujar_pantalla_juego()
gravedad()

tk.Button(ventana, text="Salir", command=ventana.destroy).place(x=350, y=300)


ventana.mainloop()