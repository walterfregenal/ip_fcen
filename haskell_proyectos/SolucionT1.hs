module SolucionT1 where

-- Ejercicio 1
ejercicio1 :: [Integer] -> Integer -> [Integer]
ejercicio1 [] _ = []
ejercicio1 (actual:siguiente:xs) numero
    | (actual + siguiente) == numero = xs
    | otherwise = actual : ejercicio1 xs numero




-- Ejercicio 4
cantidadDeRefactorizables :: Integer -> Integer -> Integer
cantidadDeRefactorizables indice limite
    | indice > limite = 0
    | numRefactorizable indice = 1 + (cantidadDeRefactorizables (indice + 1) limite)
    | otherwise = cantidadDeRefactorizables (indice + 1) limite
     


numRefactorizable :: Integer -> Bool
numRefactorizable 1 = True
numRefactorizable numero 
    | mod numero (auxCantidadDivisores numero) == 0 = True
    | otherwise = False

auxCantidadDivisores :: Integer -> Integer
auxCantidadDivisores 1 = 1
auxCantidadDivisores n = sumaLista(auxDivisoresHasta 1 n)

sumaLista :: [Integer] -> Integer
sumaLista [] = 0
sumaLista (x:xs) = 1 + sumaLista xs

auxDivisoresHasta :: Integer -> Integer -> [Integer]
auxDivisoresHasta 1 1 = [1]
auxDivisoresHasta indice numero 
    | indice > numero = []
    | mod numero indice == 0 = indice : auxDivisoresHasta (indice+1) numero
    | otherwise = auxDivisoresHasta (indice+1) numero


-- Ejercicio 5

type Cliente = String
type Monto = Integer
type Socio = Bool
type Compra = (Cliente, Monto,Socio)
type Compras = [Compra]
type Umbral = Integer


sociosConComprasAltas :: [(String, Integer, Bool)] -> Integer -> [String]
sociosConComprasAltas [] _ = []
sociosConComprasAltas compras umbral = quitoRepetidos (auxListaSociosConComprasAltas compras umbral)

auxListaSociosConComprasAltas :: Compras -> Umbral -> [Cliente]
auxListaSociosConComprasAltas [] _ = []
auxListaSociosConComprasAltas ((cliente, monto, socio):xs) umbral
    | socio == False = auxListaSociosConComprasAltas xs umbral
    | socio == True && monto > umbral  = cliente : auxListaSociosConComprasAltas xs umbral
    | otherwise = auxListaSociosConComprasAltas xs umbral

quitoRepetidos :: [Cliente] -> [Cliente]
quitoRepetidos [] = []
quitoRepetidos (clientetop:xs) 
    | contieneCliente clientetop xs = quitoRepetidos xs
    | otherwise = clientetop : quitoRepetidos xs

contieneCliente :: Cliente -> [Cliente] -> Bool
contieneCliente _ [] = False
contieneCliente clientetop (x:xs)
    | clientetop == x = True
    | otherwise = contieneCliente clientetop xs



-- Ejercicio 6
ejercicio6 :: [[Integer]] -> [[Integer]]
--ejercicio6 _ = []
ejercicio6 matriz = modificoMatriz 0 0 0 matriz

type Lista = [Integer]
type Indice = Integer
type Contador = Integer
type Numero = Integer
type Longitud = Integer
type Matriz = [Lista]

modificoMatriz :: Integer -> Indice -> Contador-> [[Integer]] -> [[Integer]]
modificoMatriz _ _ _[] = []
modificoMatriz numero indice contador (fila : xs) 
    | contador < longitud = iesimoElemMod numero indice fila : modificoMatriz numero (indice + 1) (contador + 1) xs 
    | otherwise = []
    where longitud = longLista fila

longLista :: [Integer] -> Integer
longLista  [] = 0
longLista (x:xs) = 1 + longLista (xs)

iesimoElemMod :: Numero -> Indice -> Lista -> Lista
iesimoElemMod _ _ [] = []
iesimoElemMod numero indice lista 
    | indice < longitud = auxIesimo numero indice 0 lista
    | otherwise = []
    where longitud = longLista lista
auxIesimo :: Numero -> Indice -> Contador-> Lista -> Lista
auxIesimo _ _ _ [] = []
auxIesimo numero indice contador (actual:xs)
    | indice == contador = numero : xs
    | otherwise = actual : auxIesimo numero indice (contador+1) xs
    