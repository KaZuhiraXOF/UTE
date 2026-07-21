import tkinter as tk

ventana = tk.Tk()
ventana.title("PROGRAMA 1")
ventana.geometry("500x500")


saludo = tk.Label(ventana, text="HOLA MUNDO!!",font=("Arial",42))
saludo.pack(pady=10)

ingreso = tk.Entry(ventana,
                bg="#CAFFBA",
                font=("Arial",30)
                )
ingreso.pack(pady=10)

tk.Button(ventana,
        text = "Saludar",
        command=lambda: saludo.config(text=f"Hola,{ingreso.get()} :3")).pack(pady=10)

tk.Button(ventana, text="Salir", command=ventana.destroy).pack(pady=10)

ventana.mainloop()
