module Funciones_ejercicios_parcial_c where

{-
--------------------------------------------------------------------------------
 EJERCICIO 1  (20 puntos)  -  Recursión sobre números enteros
--------------------------------------------------------------------------------
 Un número natural es capicúa si se lee igual de izquierda a derecha que de
 derecha a izquierda (por ejemplo 7, 44, 121 y 1331 son capicúas; 10 y 123 no).

 problema cantidadCapicuas (n: Z) : Z {
   requiere: { n ≥ 1 }
   asegura:  { res es la cantidad de números k tales que 1 ≤ k ≤ n y k es capicúa }
 }

 Ejemplos:
   cantidadCapicuas 1   ==  1
   cantidadCapicuas 12  == 10      -- 1,2,...,9 y 11
   cantidadCapicuas 100 == 18      -- 1,...,9 y 11,22,...,99
   cantidadCapicuas 121 == 21      -- los 18 anteriores más 101, 111 y 121
-}

cantidadCapicuas :: Integer -> Integer
cantidadCapicuas n = auxNumCapicuasHasta n n
-- Aux
auxNumCapicuasHasta :: Integer -> Integer -> Integer
auxNumCapicuasHasta 0 _ = 0
auxNumCapicuasHasta indice n
    | indice == reversoNum indice = 1 + auxNumCapicuasHasta (indice - 1) n
    | otherwise = auxNumCapicuasHasta (indice - 1) n
    
--Aux
numDigitos :: Integer -> Integer
numDigitos n 
    | n >= 0 && n < 10 = 1
    | otherwise = 1 + numDigitos (div n 10)
--
reversoNum :: Integer -> Integer
reversoNum 1 = 1
reversoNum n
    | n < 10 = n
    | otherwise = (mod n 10) * 10^long + reversoNum (div n 10)   
    where long = (numDigitos n) - 1

{-
--------------------------------------------------------------------------------
 EJERCICIO 2  (20 puntos)  -  Recursión sobre listas de enteros
--------------------------------------------------------------------------------
 problema posicionesDelMaximo (s: seq⟨Z⟩) : seq⟨Z⟩ {
   requiere: { |s| > 0 }
   asegura:  { res contiene todas las posiciones i (contando desde 0) tales que
               s[i] es el máximo de s }
   asegura:  { res está ordenada de menor a mayor y no tiene repetidos }
 }

 Ejemplos:
   posicionesDelMaximo [7]              == [0]
   posicionesDelMaximo [3,9,2,9,1]      == [1,3]
   posicionesDelMaximo [5,4,3,2,1]      == [0]
   posicionesDelMaximo [-2,-8,-2,-5]    == [0,2]
-}



posicionesDelMaximo :: [Integer] -> [Integer]   -- No hace anteponer ordenoLista ya que aux pos lista barra la lista desde 0 al maximo
posicionesDelMaximo s = auxPosMaxLista 0 maximo s
    where maximo = maxLista2 s

auxPosMaxLista:: Integer -> Integer -> [Integer] -> [Integer]
auxPosMaxLista _ _ [] = []
auxPosMaxLista indice maximun (x:xs) 
    | x == maximun = indice : auxPosMaxLista (indice + 1) maximun xs
    | otherwise = auxPosMaxLista (indice+1) maximun xs    

-- Aux MaxLista2 : Optimizado para obtener en una pasada el maximo de una lista ; usa un axiliar tipo elemento campeon
maxLista2 ::[Integer] -> Integer
maxLista2 [x] = x
maxLista2 (x:xs) = auxMax2 maximo xs
    where maximo = x
--- Aux de MaxLista2 : usa el elemento campeon "maximo actual" para optimizar y obtener resultado en una pasaDDA    
auxMax2 :: Integer -> [Integer] -> Integer
auxMax2 maximoactual [] = maximoactual
auxMax2 maximoactual (x:xs) 
    | x <= maximoactual = auxMax2 maximoactual xs
    | otherwise = auxMax2 x xs
-- 
--
--Aux : ordenoLista  >>> Esta funcion es innecesaria acorde a la observacion en  >> posicionesDelMaximo
ordenoLista:: [Integer] -> [Integer]
ordenoLista [] = []
ordenoLista [x] = [x]
ordenoLista (x:xs) = ordenoLista (quitoElemLista maximo (x:xs))  ++ [maximo]
    where maximo = maxLista2(x:xs)
--aux de OrdenoLista 
quitoElemLista :: Integer -> [Integer] -> [Integer]
quitoElemLista _ [] = []
quitoElemLista e (x:xs) 
    | e == x = xs
    | otherwise = x: quitoElemLista e xs
---

{-
--------------------------------------------------------------------------------
 EJERCICIO 3  (30 puntos)  -  Listas de tuplas y cadenas
--------------------------------------------------------------------------------
 Una tienda registra sus ventas como una secuencia de tuplas (producto,
 cantidad). Un mismo producto puede aparecer en varias ventas.

 problema productoMasVendido (ventas: seq⟨String × Z⟩) : String {
   requiere: { |ventas| > 0 }
   requiere: { todas las cantidades de ventas son mayores a 0 }
   asegura:  { res es el nombre de un producto que aparece en ventas }
   asegura:  { la suma de las cantidades de todas las ventas de res es mayor o
               igual que la suma de las cantidades de las ventas de cualquier
               otro producto de ventas }
   asegura:  { si hay más de un producto con esa suma máxima, res es el que
               aparece primero en ventas }
 }

 Ejemplos:
   productoMasVendido [("lapiz",5),("goma",3),("lapiz",4),("regla",8)] == "lapiz"
        -- lapiz: 9, goma: 3, regla: 8
   productoMasVendido [("goma",6),("regla",6)]                          == "goma"
        -- empate: gana el que aparece primero
   productoMasVendido [("regla",2)]                                     == "regla"

 Sugerencia de método (no obligatoria): pensar qué función auxiliar permitiría
 conocer el total vendido de UN producto dentro de la lista completa.
-}

type Producto = String
type Cantidad = Integer
type Venta = (Producto,Cantidad)

productoMasVendido :: [Venta] -> Producto
productoMasVendido ventas = fst (auxProducto (primerElem ventas) (agrupoProductos ventas)) 
{- inclui agrupoProductos, ya que detecte que auxProducto solo arrojaba la tup del primer max -}
--
--Aux : porque head arrojaba posible error sin pattern matching
primerElem :: [Venta] -> Venta
primerElem [] = ("",0)
primerElem (x:xs) = x
--
-- aux : busca la tupla campeona en la lista de tup
auxProducto :: Venta -> [Venta] -> Venta
auxProducto venta [] = venta
auxProducto (productotop,maximacantidad) ((producto,cantidad):xs) 
    | maximacantidad >= cantidad = auxProducto (productotop, maximacantidad)  xs
    | otherwise = auxProducto (producto,cantidad) xs
-- aux : agrupa las tuplas que tienen mismo producto sumando las cantidades ; con esto evitamos tups  repetidas 
agrupoProductos :: [Venta] -> [Venta]
agrupoProductos [x] = [x]
agrupoProductos (x:xs) 
    | contieneElem x xs = sumoRep x xs : agrupoProductos (quitoElem x (x:xs))
    | otherwise = agrupoProductos xs

--aux de agrupoProductos
contieneElem :: Venta -> [Venta] -> Bool
contieneElem _ [] = False
contieneElem (e,c) ((producto,cantidad):ys) 
    | e == producto = True
    | otherwise = contieneElem (e,c) ys 
--aux de agrupoProductos
sumoRep :: Venta-> [Venta] -> Venta
sumoRep venta [] = venta
sumoRep (e,c) ((producto,cantidad):ys) 
    | e == producto = sumoRep (e , c + cantidad ) ys
    | otherwise = sumoRep (e,c) ys
--aux de agrupoProductos
quitoElem :: Venta -> [Venta] -> [Venta]
quitoElem _ [] = []
quitoElem (e,c) ((producto,cantidad):ys) 
    | e /= producto = (producto,cantidad): quitoElem (e,c) ys 
    | otherwise = quitoElem (e,c) ys 


{-
--------------------------------------------------------------------------------
 EJERCICIO 4  (20 puntos)  -  Matrices (listas de listas)
--------------------------------------------------------------------------------
 Una matriz cuadrada se representa como una lista de filas; todas las filas
 tienen la misma longitud, y esa longitud es igual a la cantidad de filas.
 Una matriz es simétrica si para todo par de posiciones (i, j) se cumple que
 m[i][j] = m[j][i], es decir, la fila i coincide con la columna i.

 problema esSimetrica (m: seq⟨seq⟨Z⟩⟩) : Bool {
   requiere: { |m| > 0 }
   requiere: { para todo 0 ≤ i < |m|, |m[i]| = |m| }
   asegura:  { res = true ↔ para todo 0 ≤ i < |m| y 0 ≤ j < |m|, m[i][j] = m[j][i] }
 }

 Ejemplos:
   esSimetrica [[7]]                                == True
   esSimetrica [[1,2],[3,4]]                        == False
   esSimetrica [[1,2,3],[2,5,6],[3,6,9]]            == True
   esSimetrica [[1,2,3],[2,5,6],[3,7,9]]            == False
-}

esSimetrica :: [[Integer]] -> Bool
esSimetrica matriz 
    | matriz == auxTraspuesta 0 largo matriz = True -- aca solo comparamos m con (m)T , si son iguales entonces m es simetrica 
    | otherwise = False
    where largo = largoLista matriz

type IndiceFila = Integer
type Contador = Integer    
type Indice = Integer    
type Longitud = Integer
type Fila = [Integer]
type Matriz = [Fila] 

auxTraspuesta :: IndiceFila -> Longitud -> Matriz -> Matriz
auxTraspuesta _ _ [x] = [x]
auxTraspuesta numfila longitud matriz 
    | numfila < longitud = auxCol numfila 0 longitud matriz : auxTraspuesta (numfila + 1 ) longitud matriz
    | otherwise = []
   
auxCol :: IndiceFila -> Indice -> Longitud-> Matriz -> Fila
auxCol fila indice longitud matriz 
    |  indice < longitud   = iesimoElem fila (iesimoElem indice matriz) : auxCol fila (indice + 1) longitud matriz   
    | otherwise = []

iesimoElem :: Indice -> [a] -> a 
iesimoElem indice lista = auxiesimoElem 0 indice lista

auxiesimoElem :: Contador -> Indice -> [a] -> a
auxiesimoElem _ _ [x] = x
auxiesimoElem contador indice (x:xs) 
    | contador == indice = x
    | contador < indice = auxiesimoElem (contador + 1) indice xs 

largoLista :: [a] -> Integer
largoLista [] = 0
largoLista (x:xs) = 1 + largoLista xs
