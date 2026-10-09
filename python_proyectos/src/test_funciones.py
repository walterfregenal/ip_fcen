from Guia7_modelo import ceros_en_posiciones_pares2, cantidad_de_primos, es_palindroma, suma_total2, pertenece3
from Guia7_modelo import es_primo, ceros_en_posiciones_pares

import unittest

class Test_Es_Primo(unittest.TestCase):
    """Clase de prueba para la función es_primo."""
    def tearDown(self):
        print()  # Salto de línea simple entre pruebas


    def test_primo_verdadero(self):
        """Caso de prueba: Verifica que un número primo retorne True."""
        self.assertTrue(es_primo(7))

    def test_no_primo(self):
        """Caso de prueba: Verifica que un número no primo retorne False."""
        self.assertFalse(es_primo(4))

    def test_negativo(self):
        """Caso de prueba: Verifica que un número negativo retorne False."""
        self.assertFalse(es_primo(-1))

class Test_Suma_Total2(unittest.TestCase):
    """Clase de prueba para la función suma_total2."""
    def tearDown(self):
        print()  # Salto de línea simple entre pruebas

  
    def test_lista_vacia(self):
        """Caso de prueba: Verifica que una lista vacía retorne 0."""
        self.assertEqual(suma_total2([]),0)

    def test_lista_unico(self):
        """Caso de prueba: Verifica que una lista con un solo elemento retorne ese elemento."""
        self.assertEqual(suma_total2([-3]),-3)

    def test_lista_varios(self):
        """Caso de prueba: Verifica que una lista con varios elementos retorne la suma correcta."""
        self.assertEqual(suma_total2([-2,5,-1,7]),9)
class Test_Pertenece3(unittest.TestCase):
    """Clase de prueba para la función pertenece3."""
    def tearDown(self):
        print()  # Salto de línea simple entre pruebas

          
    def test_lista_vacia(self):
        """Caso de prueba: Verifica que una lista vacía no contenga ningún elemento."""
        self.assertFalse(pertenece3([],1))

    def test_lista_unica(self):
        """Caso de prueba: Verifica que un elemento presente en una lista unitaria sea detectado."""
        self.assertTrue(pertenece3([-3],-3))

    def test_lista_varios(self):
        """Caso de prueba: Verifica que un elemento presente en una lista con varios elementos sea detectado."""
        self.assertTrue(pertenece3([-2,5,-1,7],-1))

class Test_Ceros_En_Posiciones_Pares2(unittest.TestCase):
    """Clase de prueba para la función ceros_en_posiciones_pares2."""
    def tearDown(self):
        print()  # Salto de línea simple entre pruebas

        
    def test_lista_vacia(self):
        """Caso de prueba: Verifica que una lista vacía retorne una lista con un cero."""
        self.assertEqual(ceros_en_posiciones_pares2([]),[0])

    def test_lista_un_elemento(self):
        """Caso de prueba: Verifica que una lista con un solo elemento retorne una lista con un cero en la posición par."""
        self.assertEqual(ceros_en_posiciones_pares2([1]),[0])

    def test_lista_varios(self):
        """Caso de prueba: Verifica que una lista con varios elementos retorne la lista correcta."""
        self.assertEqual(ceros_en_posiciones_pares2([1,2,3,4]),[0,2,0,4])       

class Test_Ceros_En_Posiciones_Pares(unittest.TestCase):
    """Clase de prueba para la función ceros_en_posiciones_pares."""
    def tearDown(self):
        print()  # Salto de línea simple entre pruebas

    def test_lista_vacia(self):
        """Borde: Lista vacía len == 0. No debe fallar ni modificar la lista."""
        # Arrange
        s = []
        # Act
        res = ceros_en_posiciones_pares(s)
        # Assert
        self.assertIsNone(res)  # Garantiza que sea un procedimiento que retorne None
        self.assertEqual(s, [])

    def test_un_solo_elemento(self):
        """Borde: Lista con 1 elemento (índice 0 es par)."""
        s = [1]
        ceros_en_posiciones_pares(s)
        self.assertEqual(s,[0] )

    def test_longitud_par(self):
        """Camino general: Longitud par (ej. 4 elementos -> índices pares 0 y 2)."""
        s = [2,4,3,5]
        ceros_en_posiciones_pares(s)
        self.assertEqual(s, [0, 4, 0, 5])

    def test_longitud_impar(self):
        """Camino general: Longitud impar (ej. 5 elementos -> índices pares 0, 2 y 4)."""
        s = [6, 7, 8, 9, 10]
        ceros_en_posiciones_pares(s)
        self.assertEqual(s, [0, 7, 0, 9, 0])

    def test_elementos_ya_en_cero_y_negativos(self):
        """Clase de equivalencia: Valores con ceros preexistentes y números negativos."""
        s = [0, -5, -8, 12, 0]
        ceros_en_posiciones_pares(s)
        self.assertEqual(s, [0, -5, 0, 12, 0])

    def test_preserva_longitud_y_referencia(self):
        """Verifica que la lista no cambie de id() ni pierda/agregue elementos."""
        s = [1, 11, 12]
        id_original = id(s)
        ceros_en_posiciones_pares(s)
        self.assertEqual(len(s), 3)
        self.assertEqual(id(s), id_original)

if __name__ == '__main__':
    unittest.main(verbosity=2)