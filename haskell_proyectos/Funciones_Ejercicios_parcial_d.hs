module Funciones_Ejercicios_parcial_d where

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
ghci> lista_productos = ["pan", "leche", "pan","aceite","agua","tomate","agua","leche","agua","pan","aceite","azucar"] 
ghci> stock = generarStock lista_productos                                                                             
ghci> stock                                                                                                            
[("azucar",1),("aceite",2),("pan",3),("agua",3),("leche",2),("tomate",1)]
ghci> stockDeProducto stock "agua"                                                                                     
3
ghci>
-}

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


{-
ghci> tablero = [[13, 12, 6, 4], [1, 1, 32, 25],[9, 2, 14, 7],[7, 3, 5, 16], [27, 2, 6, 18]]
ghci> maximo tablero                                                                        
32
ghci> masRepetido tablero                                                                   
6
ghci>
-}

{-
====================
Perfectos amigos
====================

El Departamento de Matematica (DM) de la FCEyN-UBA nos ha encargado que desarrollemos un sistema para el
tratamiento de n´umeros naturales. 
Especıficamente les interesa conocer cuando un numero es perfecto y cuando dos numeros son amigos. 

Aunque por ahı no lo sabıas, estos conceptos existen y se definen como:

A) Numero perfecto: Un numero natural es perfecto cuando la suma de sus divisores propios (numeros que lo dividen menores a el) es igual
al mismo numero.  Por ejemplo, 6 es un numero perfecto porque la suma de sus divisores propios (1,2 y 3) es igual a 6.

B) Numeros amigos : Dos numeros naturales distintos son amigos si cada uno de ellos se obtiene sumando los divisores propios del otro.
Por ejemplo, 220 y 284 son amigos porque los divisores propios de 220 son 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 y 110 que
sumados dan 284 y los divisores propios de 284 son 1, 2 , 4, 71, 142 que sumados dan 220.

Para implementar este sistema nos enviaron las siguientes especificaciones en lenguaje semiformal y nos pidieron que hagamos
el desarrollo enteramente en Haskell, utilizando los tipos requeridos y solamente las funciones que se ven en la materia
Introducci´on a la Programacion / Algoritmos y Estructuras de Datos I (FCEyN-UBA).

-}
{-
--------------------------------------------------------------------
Ejercicio 9. Implementar la funcion divisoresPropios :: Int ->[Int]
----------------------------------------------------------------------
problema divisoresPropios (n: Z) : seq⟨Z⟩ {
requiere: {n > 0}
asegura: {res contiene a todos los divisores propios de n, ordenados de menor a mayor}
asegura: {res no tiene elementos repetidos}
asegura: {res no contiene a ningun elemento que no sea un divisor propio de n}
}
-}
type Indice = Integer
type Numero = Integer
type DivisoresPropios = [Integer]


divisoresPropios :: Integer ->[Integer]
divisoresPropios n = auxDivisoresHasta 1 n
--
auxDivisoresHasta :: Indice -> Numero -> DivisoresPropios   
auxDivisoresHasta indice numero 
    | indice == numero = []   -- resuelve el caso especial cuando n == 1  y cuando n==indice
    | mod numero indice == 0 = indice: auxDivisoresHasta (indice + 1) numero  
    | otherwise = auxDivisoresHasta (indice+1) numero


{-
ghci> divisoresPropios 12
[1,2,3,4,6]
ghci> divisoresPropios 18
[1,2,3,6,9]
ghci> divisoresPropios 21
[1,3,7]
ghci> divisoresPropios 22
[1,2,11]
ghci> divisoresPropios 23
[1]
ghci> divisoresPropios 24
[1,2,3,4,6,8,12]
ghci> esNumeroPerfecto 6 
True
ghci> esNumeroPerfecto 7
False
ghci> esNumeroPerfecto 8
False
ghci> esNumeroPerfecto 221
False
ghci> esNumeroPerfecto 222
False
ghci-}


{-
--------------------------------------------------------------------
Ejercicio 10. Implementar la funcion sonAmigos :: Int ->Int ->Bool
--------------------------------------------------------------------
problema sonAmigos (n,m: Z) : Bool {
requiere: {n > 0}
requiere: {m > 0}
requiere: {m ̸= n}
asegura: {res = True ⇔ n y m son numeros amigos}
}
-}


sonAmigos :: Integer ->Integer ->Bool
sonAmigos n m =  sumaLista (divisoresPropios m) == n  &&  sumaLista (divisoresPropios n) == m 
    

esNumeroPerfecto :: Integer -> Bool
esNumeroPerfecto n 
    | sumaLista (divisoresPropios n) == n = True
    | otherwise = False

sumaLista :: DivisoresPropios -> Integer
sumaLista [] = 0
sumaLista (x:xs) = x + sumaLista xs

{-
ghci> sonAmigos 220 285     
False
ghci>
-}
{-
-----------------------------------------------------------------------------
Ejercicio 11. Implementar la funcion losPrimerosNPerfectos :: Int ->[Int]
-------------------------------------------------------------------------------
problema losPrimerosNPerfectos (n: Z) : seq⟨Z⟩ {
requiere: {n > 0}
asegura: {|res| = n}
asegura: {res es la lista de los primeros n n´umeros perfectos, de menor a mayor}
}
Por cuestiones de tiempos de ejecucion, no les recomendamos que prueben este ejercicio con un n > 4.
-}


type ListaPerfectos = [Integer]
type Contador = Integer

losPrimerosNPerfectos :: Integer -> [Integer] 
losPrimerosNPerfectos n = aux 1 n

aux :: Indice -> Contador -> ListaPerfectos
aux  _ 0 = []
aux  indice contador
    | esNumeroPerfecto indice = indice : aux (indice + 1) (contador - 1)
    | otherwise = aux (indice + 1) contador

{-
[6]
ghci> losPrimerosNPerfectos 2
[6,28]
ghci> losPrimerosNPerfectos 3
[6,28,496]
-}