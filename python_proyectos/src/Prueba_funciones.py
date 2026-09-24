# =====================================================================
# INTRODUCCIÓN A LA PROGRAMACIÓN (UBA FCEyN)
# Archivo base de práctica para Programación Orientada a Objetos (POO)
# =====================================================================

class LaClaseSimple:
    def __init__(self, nombre, valor):
        self.nombre = nombre
        self.__valor = valor  # Atributo privado / Encapsulado

    def mostrar_info(self):
        return f"Objeto: {self.nombre} | Valor: {self.__valor}"


# El bloque de abajo es el estándar que pide la cátedra.
# Asegura que este código solo se ejecute si corres este archivo directamente.
if __name__ == "__main__":
    print("--- Iniciando ejecución del script ---")
    
    # Aquí haces las pruebas de tus objetos
    mi_primer_objeto = LaClaseSimple("Instancia_A", 100)
    print(mi_primer_objeto.mostrar_info())
