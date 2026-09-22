module PruebaFunciones where

{-
==================

Sistema de stock

===================

Una reconocida empresa de comercio electronico nos pide desarrollar un sistema de stock de mercaderıa. 

- La mercaderıa de la empresa va a ser representada como una secuencia de nombres de los productos, donde "puede haber productos repetidos".

- El stock va a ser representado como una secuencia de tuplas de dos elementos, donde el primero es el nombre del producto y
el segundo es la cantidad que hay en stock (en este caso "no hay nombre de productos repetidos"). 

- Tambien se cuenta con una lista de precios de productos representada como una secuencia de tuplas de dos elementos, donde el primero es el nombre
del producto y el segundo es el precio.

Para implementar este sistema nos enviaron las siguientes especificaciones y nos pidieron que hagamos el desarrollo
enteramente en Haskell, utilizando los tipos requeridos y solamente las funciones que se ven en la materia Introduccion a la
Programacion / Algoritmos y Estructuras de Datos I (FCEyN-UBA).

------------------------------------------------------------------------------------
Ejercicio 1. Implementar la funcion generarStock :: [String] ->[(String, Int)]
------------------------------------------------------------------------------------

problema generarStock (mercaderıa: seq⟨String⟩) : seq⟨String × Z⟩ {
requiere: {True}
asegura: { La longitud de res es igual a la cantidad de productos distintos que hay en mercaderıa}
asegura: { Para cada producto que pertenece a mercaderıa, existe un i tal que 0 ≤ i < |res| y 
           res[i]0 = producto y res[i]1 = cantidad de veces que aparece producto en mercaderıa}
}

-}

type Producto = String
type Cantidad = Integer 
type Precio = Integer
type Mercaderia = [Producto]
type Stock = [(Producto,Cantidad)]
type Precios = [(Producto,Precio)]


generarStock :: [String] -> [(String, Integer)]
generarStock [] = []
generarStock (producto:xs) = contieneElementoIncremento producto (generarStock xs)


contieneElementoIncremento :: Producto -> Stock -> Stock
contieneElementoIncremento productoactual [] = [(productoactual, 1)]
contieneElementoIncremento productoactual ((producto, cantidad):xs) 
    | producto == productoactual = (producto, cantidad + 1) : xs   --- tener presente que no hay repetidos en stock
    | otherwise = (producto,cantidad):contieneElementoIncremento productoactual xs 


{-
------------------------------------------------------------------------------------------
Ejercicio 2. Implementar la funcion stockDeProducto :: [(String, Int))] ->String ->Int
-------------------------------------------------------------------------------------------
problema stockDeProducto (stock: seq⟨String × Z⟩, producto: String ) : Z {
requiere: {No existen dos nombres de productos (primeras componentes) iguales en stock}
requiere: {Todas las cantidades (segundas componentes) de stock son mayores a cero}
asegura: {si no existe un i tal que 0 ≤ i < |stock| y producto = stock[i]0 entonces res es igual a 0 }
asegura: {si existe un i tal que 0 ≤ i < |stock| y producto = stock[i]0 entonces res es igual a stock[i]1 }
}

-}
stockDeProducto :: [(String, Integer)] ->String ->Integer
stockDeProducto  [] _ = 0
stockDeProducto ((producto,cantidad):xs) productoactual 
    | producto == productoactual = cantidad
    | otherwise = stockDeProducto xs productoactual

{-
===========================
    Sopa de numeros
===========================

Una sopa de numeros es un juego que consiste en descubrir propiedades de un tablero de dimensiones n × m  con n y m > 0, 
en los que en cada posicion hay un numero entero positivo. 

Cada posicion se identifica con una dupla (i, j) en el cual la primera componente corresponde a una fila y la segunda a una columna.

A modo de ejemplo, la siguiente figura muestra un tablero de 5 × 4 en el que el nuumero 13 aparece en la posicion (1, 1) y 
el numero 5 aparece en la posicion (4, 3). 

Notar que tanto la numeracion de las filas como la de las columnas comienzan en 1.

tablero = [[13, 12, 6, 4], [1, 1, 32, 25],[9, 2, 14, 7],[7, 3, 5, 16], [27, 2, 8, 18]]

Un camino en un tablero esta dado por una secuencia de posiciones adyacentes en la que solo es posible desplazarse desde una posicion dada 
hacia la posicion de su derecha o hacia la que se encuentra debajo. 
En otras palabras, un camino de longitud "l" en un tablero se define como una secuencia con "l" posiciones, 
ordenadas de manera tal que el elemento i-esimo es la posicion resultante de haberse movido hacia la derecha o hacia abajo desde la posicion (i-1)-esima. 

Siguiendo con elejemplo, a continuacion puede observarse un camino de longitud "5" que representa la "sucesion Fibonacci" y que empieza en la
posicion (2,1) , (2,2) , (3,2) , (4,2) y termina en (4,3) del tablero.

Para manipular las sopas de numeros en Haskell vamos a representar el tablero como una lista de filas de igual longitud.
A su vez, cada fila vamos a representarla como una lista de enteros positivos. 
Las posiciones vamos a representarlas con tuplas de dos numeros enteros positivos y un camino va a estar dado por una lista de posiciones.

Para implementar esta sopa de numeros nos enviaron las siguientes especificaciones y nos pidieron que hagamos el desarrollo enteramente en Haskell, 
utilizando los tipos requeridos y solamente las funciones que se ven en la materia Introduccion a la Programacion (FCEyN-UBA). 

Asumimos los siguientes renombres de TIPOS de datos en las especificaciones de los ejercicios:

Fila = seq⟨Z⟩
Tablero = seq⟨Fila⟩
Posicion = Z × Z – Observacion: las posiciones son: (fila, columna)
Camino = seq⟨Posicion⟩
 -}
{-
--------------------------------------------------------------
Ejercicio 5. Implementar la funcion maximo :: Tablero ->Int
--------------------------------------------------------------
problema maximo (t: Tablero) : Z {
requiere: {El tablero t es un tablero bien formado, es decir, la longitud de todas las filas es la misma, y tienen al menos un elemento}
requiere: {Existe al menos una columna en el tablero t }
requiere: {El tablero t no es vacıo, todos los numeros del tablero son positivos, mayor estricto a 0}
asegura: {res es igual al numero m
as grande del tablero t}
}
-}

type Fila = [Integer]
type Tablero = [Fila]
type Posicion = (Integer, Integer)
type Camino = [Posicion]

maximo :: Tablero -> Integer
maximo [y] = auxMax y
maximo (y:restodefilas) 
    | maxfila > maxrestodefilas = maxfila 
    | otherwise = maxrestodefilas
    where 
        maxfila = auxMax y
        maxrestodefilas = maximo restodefilas

auxMax :: Fila -> Integer
auxMax [x] = x 
auxMax  (x:resto) 
    | x > maxresto = x
    | otherwise = maxresto
    where 
        maxresto = auxMax resto

{-
----------------------------------------------------------------------
Ejercicio 6. Implementar la funcion masRepetido :: Tablero ->Int
----------------------------------------------------------------------

problema masRepetido (t: Tablero) : Z {
requiere: {El tablero t es un tablero bien formado, es decir, la longitud de todas las filas es la misma, y tienen al menos un elemento}
requiere: {Existe al menos una columna en el tablero t }
requiere: {El tablero t no es vacıo, todos los numeros del tablero son positivos, mayor estricto a 0}
asegura: {res es igual al numero que mas veces aparece en un tablero t. Si hay empate devuelve cualquiera de ellos}
}
-}

type Repeticiones = [(Integer,Integer)]

masRepetido :: Tablero ->Integer
masRepetido t = auxmasRepetido (generarRepetidos (aplanoTablero t))

aplanoTablero :: Tablero -> Fila
aplanoTablero [] = []
aplanoTablero (y:ys) = y ++ aplanoTablero ys

auxmasRepetido ::  Repeticiones -> Integer
auxmasRepetido ((numero,cantidad):xs) = maximoRep numero cantidad xs

maximoRep :: Integer -> Integer ->Repeticiones -> Integer
maximoRep numeroactual cantidadactual [] = numeroactual
maximoRep numeroactual cantidadactual ((numero,cantidad):xs) 
    | cantidadactual >= cantidad = maximoRep numeroactual cantidadactual xs
    | otherwise = maximoRep numero cantidad xs

generarRepetidos :: Fila -> [(Integer, Integer)]
generarRepetidos [] = []
generarRepetidos (numeroactual:xs) = contieneNumeroIncremento numeroactual (generarRepetidos xs)



contieneNumeroIncremento :: Integer -> Repeticiones -> Repeticiones
contieneNumeroIncremento numeroactual [] = [(numeroactual, 1)]
contieneNumeroIncremento numeroactual ((numero, cantidad):xs) 
    | numero == numeroactual = (numero, cantidad + 1) : xs   --- tener presente que en Repeticiones no habra elementos repetidos
    | otherwise = (numero,cantidad):contieneNumeroIncremento numeroactual xs 
