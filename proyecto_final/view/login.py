import tkinter as tk 

class Login_Usuario(tk.Frame):
    def __init__(self, parent, controller, al_autenticar_exito):
        super().__init__(parent)
        self.cotroller = controller
        self.al_autenticar_exito = al_autenticar_exito

        #APARTADO DE COLOR DE PYTHON
        self.ColorFondo = "#0C0413"
        self.Color_Tarjeta = "#22055D"
        self.ColorFuente = "#ffffff"
        self.ColorBoton = "#00A5FF"

        self.configure(bg=self.ColorFondo)
        self.pack(fill="both",expand=True)

        self.construir_UI()

    def construir_UI(self):
        login_pantalla = tk.Frame(self, bg=self.Color_Tarjeta, bd=2, relief="ridge")
        login_pantalla.place(relx=0.5, rely=0.5, anchor="center",width=340,height=380)

        logo_login = tk.Canvas(login_pantalla, width=80, height=80,bg=self.Color_Tarjeta,highlightthickness=0)
        logo_login.pack(pady=(25,10))
        logo_login.create_oval(5,5,75,75,fill="#bdc3c7", outline=self.ColorFuente, width=2)

        usuario_box = tk.Label(login_pantalla,
                            text="Usuario",
                            font=("Console", 11, "bold"),
                            bg=self.Color_Tarjeta,
                            fg=self.ColorFuente)
        usuario_box.pack(anchor="w", padx=35, pady=(10,2))

        self.txt_usuario = tk.Entry(login_pantalla,
                                    font=("Console",11),
                                    bd=1,
                                    relief="solid")
        self.txt_usuario.pack(fill="x", padx=35, ipady=3)

        contrasena_box = tk.Label(login_pantalla,
                                text="Contraseña",
                                font=("Console",11, "bold"),
                                bg=self.Color_Tarjeta,
                                fg=self.ColorFuente)
        contrasena_box.pack(anchor="w", padx=35, pady=(10,2))

        self.txt_contrasena = tk.Entry(login_pantalla,
                                    font=("Console", 11),
                                    bd=1,
                                    relief="solid")
        self.txt_contrasena.pack(fill="x",padx=35, ipady=3)

        self.mensaje_error = tk.Label(login_pantalla,
                                    text="Ingresar",
                                    font=("Console", 12, "bold"),
                                    bg=self.Color_Tarjeta,
                                    fg="#e74c3c")
        self.mensaje_error.pack(pady=(5,0))

        boton_ingreso = tk.Button(login_pantalla,
                                text="Ingresar",
                                font=("Console",11,"bold"),
                                bg=self.ColorBoton,
                                fg=self.ColorFuente,
                                bd=0,
                                cursor="hand2",
                                command=self.val_ingreso)
        boton_ingreso.pack(fill="x", padx=35, pady=(15,20), ipady=5)

    def val_ingreso(self):
        usuario = self.txt_usuario.get().strip()
        contrasena = self.txt_contrasena.get().strip()

        if usuario == "admin" and contrasena == "1234":
            self.mensaje_error.config(text="")
            self.al_autenticar_exito() 
        elif usuario == "" or contrasena== "":
            self.mensaje_error.config(text="Por favor, llena ambos campos")
        else:
            self.mensaje_error.config(text="Usuario o contraseña incorrectos")

                                    
