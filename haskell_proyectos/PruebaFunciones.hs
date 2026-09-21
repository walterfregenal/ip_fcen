module PruebaFunciones where

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

primerElem :: [Venta] -> Venta
primerElem [] = ("",0)
primerElem (x:xs) = x

auxProducto :: Venta -> [Venta] -> Venta
auxProducto venta [] = venta
auxProducto (productotop,maximacantidad) ((producto,cantidad):xs) 
    | maximacantidad >= cantidad = auxProducto (productotop, maximacantidad)  xs
    | otherwise = auxProducto (producto,cantidad) xs

agrupoProductos :: [Venta] -> [Venta]
agrupoProductos [x] = [x]
agrupoProductos (x:xs) 
    | contieneElem x xs = sumoRep x xs : agrupoProductos (quitoElem x (x:xs))
    | otherwise = agrupoProductos xs

--aux
contieneElem :: Venta -> [Venta] -> Bool
contieneElem _ [] = False
contieneElem (e,c) ((producto,cantidad):ys) 
    | e == producto = True
    | otherwise = contieneElem (e,c) ys 
--aux
sumoRep :: Venta-> [Venta] -> Venta
sumoRep venta [] = venta
sumoRep (e,c) ((producto,cantidad):ys) 
    | e == producto = sumoRep (e , c + cantidad ) ys
    | otherwise = sumoRep (e,c) ys

quitoElem :: Venta -> [Venta] -> [Venta]
quitoElem _ [] = []
quitoElem (e,c) ((producto,cantidad):ys) 
    | e /= producto = (producto,cantidad): quitoElem (e,c) ys 
    | otherwise = quitoElem (e,c) ys 