import tkinter as ttk

pestana = ttk.Tk()
pestana.title("PROGRAMA 2")
pestana.geometry("500x500")

saludo = ttk.Label(pestana,
                text="Ingresa el nombre: ")
saludo.pack(pady=10)

entrada = ttk.Entry(pestana)
entrada.pack(pady=10)

def saludar():
    nombre = entrada.get()
    saludo.config(text=f"HOLA, {nombre}")

boton = ttk.Button(pestana, text="Saludar",command=saludar)
boton.pack(pady = 5)

pestana.mainloop()