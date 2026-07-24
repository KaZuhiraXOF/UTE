from controller.controller_app import Controlador_App
from view.pantalla import PantallaPrincipal

if __name__ == "__main__":
    controlador = Controlador_App()
    app = PantallaPrincipal(controlador)


    app.mainloop()


