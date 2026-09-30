"""
================================================================================
  DEPARTAMENTO DE COMPUTACIÓN - FCEyN - UNIVERSIDAD DE BUENOS AIRES
  Introducción a la Programación / Algoritmos y Estructuras de Datos I
  Guía Práctica 7: Funciones sobre listas (tipos complejos) [Sin Resolver]
================================================================================

Notas Generales:
----------------
- Recordar usar las anotaciones de tipado en todas las variables.
  Por ejemplo: def funcion(numero: int) -> bool:
- En Python 3.9+ las anotaciones de tipado para colecciones son en minúscula:
  list[int], list[tuple[int, str]], list[list[int]].
- En los ejercicios se pueden usar funciones matemáticas como sqrt, round, qu %.
- Para conocer cómo se usan las funciones sobre secuencias, revisar la documentación oficial.


================================================================================
1. Recorrido y búsqueda en secuencias
================================================================================
============
Ejercicio 1.
============
Codificar en Python las siguientes funciones sobre secuencias.
Nota: Cada problema puede tener más de una implementación. Probar utilizando distintas 
formas de recorrido sobre secuencias y distintas funciones de Python.

1) pertenece (in s: seq<Z>, in e: Z) : Bool{
   requiere: { True }
   asegura:  { (res = true) <-> (existe un i en Z tal que 0 <= i < |s| y s[i] = e) }
   }
   Nota: Implementar al menos de 3 formas distintas este problema.
"""
def pertenece(lista: list[int], e: int)-> bool:
    return e in lista
    
def pertenece2(lista: list[int], e: int)-> bool:
    encontrado : bool = False
    for i in lista:
        if e == i:
            encontrado = True
            break
    return encontrado

def lenght(lista: list [int])->int:
    counter : int = 0
    for i in lista:
        counter +=1
    return counter

def pertenece3(lista: list[int], e: int)-> bool:
    encontrado: bool = False
    rango = lenght(lista) -1
    while rango >= 0:
        if lista[rango] == e:
            encontrado = True
            break
        rango -= 1
    return encontrado


"""
2) divide_a_todos (in s: seq<Z>, in e: Z) : Bool
   requiere: { e != 0 }
   asegura:  { (res = true) <-> (para todo i en Z si 0 <= i < |s| -> s[i] mod e = 0) }

"""
def divide_a_todos(lista: list[int], e: int) -> bool:
    todos_dividen: bool = True
    for elemento in lista:
        if elemento % e != 0:
            todos_dividen = False
            break  # Cortamos porque con uno que falle ya no se cumple
    return todos_dividen

"""
3) suma_total (in s: seq<Z>) : Z
   requiere: { True }
   asegura:  { res es la suma de todos los elementos de s }
   Nota: No utilizar la función sum() nativa.

"""
def suma_total(lista: list[int])->int:
    suma: int = 0
    for elemento in lista:
        suma += elemento
    return suma

"""
4) maximo (in s: seq<Z>) : Z
   requiere: { |s| > 0 }
   asegura:  { res = al mayor de todos los números que aparece en s }
   Nota: No utilizar la función max() nativa.

"""
def maximo(s: list[int])-> int:
    mayor: int = s[0]
    for elemento in s[1:]:
        if elemento > mayor:
            mayor = elemento
    return mayor
"""
   
5) minimo (in s: seq<Z>) : Z
   requiere: { |s| > 0 }
   asegura:  { res = al menor de todos los números que aparece en s }
   Nota: No utilizar la función min() nativa.

"""
def minimo(s:list[int])-> int:
    minimo: int = s[0]
    for elemento in s[1:]:
        if elemento < minimo:
            minimo = elemento
    return minimo

"""

6) ordenados (in s: seq<Z>) : Bool
   requiere: { True }
   asegura:  { res = true <-> (para todo i en Z si 0 <= i < (|s| - 1) -> s[i] < s[i+1]) }

"""
def ordenados (s: list[int])-> bool:
    estan_ordenados: bool = True
    for i in range(len(s)-1):
        if s[i] >= s[i+1]:
            estan_ordenados = False
            break   
    return estan_ordenados

"""

========
Adicional : ordenar 
========

quitar_uno ( in lista:seq<Z>, in e:Z)-> seq<Z>{
    requiere: { |lista| > 0}
    asegura : { res = lista - lista[i], 0<=i <(|lista|-1) , si lista[i]=e, lista en caso contrario}
}

"""
def quitar_uno(lista: list[int], e: int) -> list[int]:
    salida: list[int] = []
    removido: bool = False
    for elemento in lista:
        if not removido and elemento == e:
            removido = True  # Nos saltamos esta única aparición
        else:
            salida.append(elemento)
    return salida

def ordenar(s:list[int])->list[int]:
    if len(s) == 0: 
        return []
    campeon : int = maximo(s)
    return ordenar (quitar_uno(s,campeon)) + [campeon]


"""
7) pos_maximo (in s: seq<Z>) : Z
   requiere: { True }
   asegura:  { Si |s| = 0, entonces res = -1; si no, res = al índice de la posición 
               donde aparece el mayor elemento de s (si hay varios es la primera aparición) }

"""
def pos_maximo(s:list[int])->int:
    if len(s) == 0:
        return (-1)
    posicion : int = 0
    campeon: int = s[posicion]
    for i in range (1,len(s)):
        if s[i] > campeon: #--> el primero que aparece
            campeon = s[i] 
            posicion = i
    return (posicion)

    

"""
               
8) pos_minimo (in s: seq<Z>) : Z
   requiere: { True }
   asegura:  { Si |s| = 0, entonces res = -1; si no, res = al índice de la posición 
               donde aparece el menor elemento de s (si hay varios es la última aparición) }

"""
def pos_minimo(s:list[int])->int:
    if len(s) == 0:
        return (-1)
    posicion : int = 0
    campeon: int = s[posicion]
    for i in range (1,len(s)):
        if s[i] <= campeon: #>> la ultima aparicion
            campeon = s[i]
            posicion = i
    return (posicion)
"""

9) long_mayor_a_siete (in s: seq<seq<Char>>) : Bool
   requiere: { True }
   asegura:  { (res = true) <-> (existe i en Z tal que 0 <= i < |s| y |s[i]| > 7) }
   Ejemplo: ["termo", "gato", "tener", "jirafas"] devuelve False.

"""
def len_str(s: str)-> int:
    counter: int = 0
    for i in s:
        counter += 1
    return counter

def long_mayor_a_siete(s:list[str])-> bool:
    mayor_siete: bool = False
    for texto in s:
        if len_str(texto) > 7:
            mayor_siete = True
            break
    return mayor_siete

"""

10) es_palindroma (in s: seq<Char>) : Bool
    requiere: { True }
    asegura:  { (res = true) <-> (s es igual a su reverso) }
    Nota: Las cadenas vacías o con 1 solo elemento son palíndromos.

"""
def es_palindroma(s:str) -> bool:
    return s == s[::-1]

"""    

11) iguales_consecutivos (in s: seq<Z>) : Bool
    requiere: { True }
    asegura:  { (res = true) <-> (existen i, j, k en Z tales que 0 <= i, j, k < |s| 
                y i + 2 = j + 1 = k y s[i] = s[j] = s[k]) }

"""
def iguales_consecutivos(s:list[int])-> bool:
    largo : int = len(s)
    for i in range(largo-2): # >> i + 2 no debe superar a largo
        k:int = i + 2
        j:int = i + 1
        if s[i] == s[j] == s[k]: # -> si hay una secuencia de tres n consecutivos iguales salgo
            return True
    return False
    

"""
                
12) vocales_distintas (in s: seq<Char>) : Bool
    requiere: { True }
    asegura:  { (res = true) <-> (existen i, j, k en Z tales que 0 <= i, j, k < |s| 
                y s[i] != s[j] != s[k] y s[i], s[j], s[k] pertenecen a {'a','e','i','o','u'}) }

"""

"""
                
13) pos_secuencia_ordenada_mas_larga (in s: seq<Z>) : Z
    requiere: { |s| > 0 }
    asegura:  { res es el índice de inicio de la subsecuencia ordenada no decreciente más larga. 
                Si hay varias subsecuencias de igual longitud, devolver la primera posición. }

14) cantidad_digitos_impares (in s: seq<Z>) : Z
    requiere: { Todos los elementos de s son mayores o iguales a 0 }
    asegura:  { res es la cantidad total de dígitos impares que aparecen en cada uno de los elementos de s }
    Ejemplo: [57, 2383, 812, 246] devuelve 5 (los dígitos impares son 5, 7, 3, 3, 1).

"""
"""

================================================================================
2. Recorrido: filtrando, modificando y procesando secuencias
================================================================================

Ejercicio 2. Implementar las siguientes funciones sobre secuencias:

1) ceros_en_posiciones_pares (inout s: seq<Z>)
   requiere: { True }
   modifica: { s }
   asegura:  { |s| = |s@pre| y para todo i entero (0 <= i < |s|), si i es impar 
               entonces s[i] = s@pre[i], y si i es par, entonces s[i] = 0 }

2) ceros_en_posiciones_pares2 (in s: seq<Z>) : seq<Z>
   requiere: { True }
   asegura:  { |s| = |res| y para todo i entero (0 <= i < |res|), si i es impar 
               entonces res[i] = s[i], y si i es par, entonces res[i] = 0 }

3) sin_vocales (in s: seq<Char>) : seq<Char>
   requiere: { True }
   asegura:  { res es la subsecuencia de s que se obtiene al quitarle todas las vocales a s }

4) reemplaza_vocales (in s: seq<Char>) : seq<Char>
   requiere: { True }
   asegura:  { |res| = |s| y para todo i (0 <= i < |res|), si s[i] es vocal 
               entonces res[i] = ' ', de lo contrario res[i] = s[i] }

5) reverso (in s: seq<Char>) : seq<Char>
   requiere: { True }
   asegura:  { |res| = |s| y para todo i (0 <= i < |res|), res[i] = s[|s| - i - 1] }

6) eliminar_repetidos (in s: seq<Char>) : seq<Char>
   requiere: { True }
   asegura:  { |res| <= |s|, todos los elementos de s están en res, y res no tiene elementos repetidos }


Ejercicio 3. Estado de aprobación de una materia:
problema resultadoMateria (in notas: seq<Z>) : Z {
  requiere: { |notas| > 0 }
  requiere: { Para todo i en Z si 0 <= i < |notas| -> 0 <= notas[i] <= 10 }
  asegura:  { res = 1 <-> todos los elementos de notas son >= 4 y el promedio es >= 7 }
  asegura:  { res = 2 <-> todos los elementos de notas son >= 4 y el promedio está entre 4 (incl) y 7 }
  asegura:  { res = 3 <-> alguno de los elementos de notas es < 4 o el promedio es < 4 }
}

Ejercicio 4. Historial de movimientos bancarios:
Dada una lista de tuplas que representa movimientos en una cuenta ("I" para ingreso, "R" para retiro), 
devolver el saldo actual asumiendo saldo inicial 0.
problema saldoActual (in movimientos: seq<Char x Z>) : Z {
  requiere: { Para todo i en Z si 0 <= i < |movimientos| -> movimientos[i][0] en {"I", "R"} y movimientos[i][1] > 0 }
  asegura:  { res = (suma de ingresos) - (suma de retiros) }
}


================================================================================
3. Matrices (Secuencias de secuencias)
================================================================================

Ejercicio 5. Analizando parámetros in, out vs. resultado:
1) pertenece_a_cada_uno_version1 (in s: seq<seq<Z>>, in e: Z, out res: seq<Bool>)
   requiere: { True }
   asegura:  { |res| >= |s| y para todo i en Z (0 <= i < |s|) -> (res[i] = true <-> pertenece(s[i], e)) }

2) pertenece_a_cada_uno_version2 (in s: seq<seq<Z>>, in e: Z, out res: seq<Bool>)
   requiere: { True }
   asegura:  { |res| = |s| y para todo i en Z (0 <= i < |s|) -> (res[i] = true <-> pertenece(s[i], e)) }

3) pertenece_a_cada_uno_version3 (in s: seq<seq<Z>>, in e: Z) : seq<Bool>
   requiere: { True }
   asegura:  { |res| = |s| y para todo i en Z (0 <= i < |s|) -> (res[i] = true <-> pertenece(s[i], e)) }

   Pregunta: ¿Se puede usar la implementación del ej. 2 para la especificación del 1? ¿Y viceversa? Justificar.


Ejercicio 6. Funciones sobre matrices:

1) es_matriz (in s: seq<seq<Z>>) : Bool
   requiere: { True }
   asegura:  { res = true <-> (|s| > 0 y |s[0]| > 0 y para todo i, |s[i]| = |s[0]|) }

2) filas_ordenadas (in m: seq<seq<Z>>, out res: seq<Bool>)
   requiere: { esMatriz(m) }
   asegura:  { Para todo i en Z (0 <= i < |res|) -> (res[i] = true <-> ordenados(m[i])) }

3) columna (in m: seq<seq<Z>>, in c: Z) : seq<Z>
   requiere: { esMatriz(m) y 0 <= c < |m[0]| }
   asegura:  { Devuelve una secuencia con los elementos de la columna c en el mismo orden }

4) columnas_ordenadas (in m: seq<seq<Z>>) : seq<Bool>
   requiere: { esMatriz(m) }
   asegura:  { Para todo c (0 <= c < |m[0]|) -> (res[c] = true <-> ordenados(columna(m, c))) }

5) transponer (in m: seq<seq<Z>>) : seq<seq<Z>>
   requiere: { esMatriz(m) }
   asegura:  { Devuelve la matriz traspuesta m^T }

6) quien_gana_tateti (in m: seq<seq<Char>>) : Z
   requiere: { esMatriz(m) de 3x3 con elementos 'X', 'O' o ' ' }
   asegura:  { Devuelve 0 si gana 'O', 1 si gana 'X', o 2 si no hay ganador o hay empate }

7) exponenciacion_matriz (in d: Z, in p: Z) : seq<seq<Z>>
   requiere: { d, p > 0 }
   asegura:  { Devuelve el resultado de multiplicar una matriz aleatoria d x d por sí misma p veces }


================================================================================
4. Programas interactivos usando secuencias e input()
================================================================================

Ejercicio 7. Programas interactivos con input():

1) Nombres de estudiantes:
   Implementar una función que solicite nombres al usuario mediante input() hasta que ingrese "listo" o un string vacío. Devuelve la lista de nombres ingresados.

2) Monedero electrónico (SUBE):
   Simular un monedero con saldo inicial 0. Solicitar en cada paso:
   "C" = Cargar crédito (pide monto)
   "D" = Descontar crédito (pide monto)
   "X" = Finalizar simulación
   Devuelve el historial con tuplas ("C", monto) y ("D", monto).

3) Juego del 7 y medio:
   Generar números aleatorios entre 1 y 12 (excluyendo 8 y 9) con `random.randint(1, 12)`.
   Preguntar al usuario si desea pedir otra carta o plantarse.
   Las figuras (10, 11, 12) suman 0.5 puntos. Si la suma supera 7.5, informa que perdió.
   Devuelve el historial de cartas de la partida.

4) Fortaleza de contraseña:
   Solicitar al usuario un texto para su contraseña.
   Implementar una función que analice la contraseña e indique su nivel: "VERDE", "AMARILLA" o "ROJA".
"""
#