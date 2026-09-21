module Funciones_ejercicios_parcial where

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

posicionesDelMaximo :: [Integer] -> [Integer]
posicionesDelMaximo s = ordenoLista  (auxPosMaxLista 0 maximo s)
    where maximo = maxLista2 s

posicionesDelMaximo2 :: [Integer] -> [Integer]   -- No hace falta ordenar ya que aux pos lista barra la lista desde 0 al maximo
posicionesDelMaximo2 s = auxPosMaxLista 0 maximo s
    where maximo = maxLista2 s

auxPosMaxLista:: Integer -> Integer -> [Integer] -> [Integer]
auxPosMaxLista _ _ [] = []
auxPosMaxLista indice maximun (x:xs) 
    | x == maximun = indice : auxPosMaxLista (indice + 1) maximun xs
    | otherwise = auxPosMaxLista (indice+1) maximun xs    


maxLista2 ::[Integer] -> Integer
maxLista2 [x] = x
maxLista2 (x:xs) = auxMax2 maximo xs
    where maximo = x
auxMax2 :: Integer -> [Integer] -> Integer
auxMax2 maximoactual [] = maximoactual
auxMax2 maximoactual (x:xs) 
    | x <= maximoactual = auxMax2 maximoactual xs
    | otherwise = auxMax2 x xs

--Aux : Innecesario acorde a opcion2 >> posicionesDelMaximo2 
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