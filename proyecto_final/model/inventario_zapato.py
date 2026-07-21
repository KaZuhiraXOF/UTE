import json
import os
from datetime import datetime

class Tienda_model:
    def __init__(self, ruta = "data/inventario.json", ruta_venta="data/ventas.json"):
        self.ruta = ruta
        self.ruta_venta = ruta_venta

def leerInventario (self):
    with open(self.ruta, "r", encoding="UTF-8") as f:
        return json.load(f)
    
def leerVentas (self):
    with open(self.ruta_ventas, "r", encoding="UTF-8") as f:
        return json.load(f)

def calculoDescuentos(self, stockZapatosActual):
    if stockZapatosActual > 10:
        return 0.0
    elif stockZapatosActual == 1:
        return 50.0
    elif stockZapatosActual <= 3:
        return 25.0
    elif stockZapatosActual <= 5:
        return 20.0
    elif stockZapatosActual <= 7:
        return 15.0

def procesar_evento_venta(self, id_zapato, comprador="Cliente Simulado"):
        """
        REACCIÓN AL EVENTO EXTERNO:
        Recibe la notificación de venta de la tienda, descuenta el stock,
        aplica la regla matemática y registra la factura histórica.
        """
        inventario = self.obtener_inventario()
        ventas = self.obtener_historial_ventas()

        zapato_encontrado = None
        for zapato in inventario:
            if zapato["id"] == id_zapato:
                zapato_encontrado = zapato
                break

        if not zapato_encontrado or zapato_encontrado["stock"] <= 0:
            return False, "Sin stock disponible o producto no encontrado."

        # 1. Obtener estado actual antes de la venta
        stock_previo = zapato_encontrado["stock"]
        precio_base = zapato_encontrado["precio_base"]

        # 2. Calcular valores de ESTA venta
        pct_descuento = self.calcular_descuento_por_stock(stock_previo)
        precio_pagado = round(precio_base * (1 - (pct_descuento / 100.0)), 2)

        # 3. Actualizar estado del backend (restar stock)
        zapato_encontrado["stock"] -= 1
        nuevo_stock = zapato_encontrado["stock"]

        # 4. Crear registro de facturación / transacción
        nueva_transaccion = {
            "id_transaccion": f"TX-{len(ventas) + 1001}",
            "fecha": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            "comprador": comprador,
            "zapato": f"{zapato_encontrado['marca']} {zapato_encontrado['modelo']}",
            "talla": zapato_encontrado["talla"],
            "precio_original": precio_base,
            "descuento_aplicado": f"{pct_descuento}%",
            "total_ingresado": precio_pagado,
            "stock_restante": nuevo_stock
        }

        ventas.append(nueva_transaccion)

        # 5. Persistir cambios en JSONs
        with open(self.ruta_inventario, "w", encoding="utf-8") as f:
            json.dump(inventario, f, indent=4, ensure_ascii=False)

        with open(self.ruta_ventas, "w", encoding="utf-8") as f:
            json.dump(ventas, f, indent=4, ensure_ascii=False)

        return True, nueva_transaccion