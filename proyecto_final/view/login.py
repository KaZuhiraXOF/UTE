import tkinter as tk 

class Login_Usuario():
    def __init__(self, parent, controller, al_auntenticar_exito):
        super().__init__(parent)
        self.cotroller = controller
        self.al_autenticar_exito = al_auntenticar_exito

        #APARTADO DE COLOR DE PYTHON
        self.ColorFondo = "#332B57"
        self.Color_Tarjeta = "#4900D6"
        