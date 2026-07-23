# controllers/app_controller.py

from model.inventario_zapato import Tienda_model

class Controlador_App:
    def __init__(self, pantalla_principal = None):
        self.model = Tienda_model()
        self.view = pantalla_principal
    
    def set(self, pantalla_principal):
        self.view = pantalla_principal

    def obtener_inventario(self):
        return self.model.leerInventario()

    def obtener_historial_ventas(self):
        return self.model.leerVentas()

    def procesar_ventas(self, id):
        exito, resultado = self.model.procesar_evento_venta(id)

        if exito:
            if self.view:
                self.view.generar_tabla()
            return True, resultado
        else:
            return False, resultado




