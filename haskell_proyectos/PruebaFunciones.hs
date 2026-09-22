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
    | producto == productoactual = (producto, cantidad + 1) : xs   --- no hay repetidos en stock
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