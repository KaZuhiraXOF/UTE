import tkinter as tk
from view.login import Login_Usuario

class PantallaPrincipal(tk.Tk):
    def __init__(self, controlador):
        super().__init__()
        self.controller = controlador

        self.title("Administración - Ruby Store")
        self.geometry("1020x920")
        self.minsize(800,500)

        self.login_pantalla()

    def login_pantalla(self):
        for widget in self.winfo_children():
            widget.destroy()

        self.vista_login = Login_Usuario(
            parent=self,
            controller=self.controller,
            al_autenticar_exito=self.resumen_pantalla
        )   

    def resumen_pantalla(self):
        for widget in self.winfo_children():
            widget.destroy()

        lbl_temp = tk.Label(
            self, 
            text="¡Bienvenido a Ruby Store! (Acceso correcto)", 
            font=("Console", 14, "bold"),
            bg="#332B57",
            fg="#ffffff"
        )
        lbl_temp.pack(expand=True, fill="both")

    