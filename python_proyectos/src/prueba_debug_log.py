"""
Módulo para probar diferentes funciones y utilidades del proyecto.
"""
import logging

# Set up basic logging configuration
logging.basicConfig(level=logging.DEBUG)

def divide_a_todos(lista: list[int], e: int) -> bool:
    """
    # Descripcion: retorna True si todos los lista[i] son divisibles por e,
    y False en caso contrario.
    Args:
        - lista (list[int]): Lista de números enteros.
        - e (int): Número entero por el cual se verifica la divisibilidad.
     Returns:
       - bool: True si todos lista[i] son div por e, False en caso contrario.
    """
    todos_dividen: bool = True
    for elemento in lista:
        if not isinstance(elemento, int):
            logging.error(f"Invalid input: {elemento} is not an integer.")  # Log an error for invalid input
            todos_dividen = False
            break
        if elemento % e != 0:
            todos_dividen = False
            break  # Cortamos porque con uno que falle ya no se cumple
    return todos_dividen

# Log and test if [2,4,6] are divisible by 2   
test_list = [2, 4, 6]
result = divide_a_todos(test_list, 2)
logging.info(f"Result of divide_a_todos({test_list}, 2): {result}")  # Log result as INFO

# Log and test if [2,"4",6] are divisible by 2  . Logging an error for the string "4"
test_list2 = [2, "4", 6]
result = divide_a_todos(test_list2, 2)
logging.info(f"Result of divide_a_todos({test_list2}, 2): {result}")  # Log result as INFO
