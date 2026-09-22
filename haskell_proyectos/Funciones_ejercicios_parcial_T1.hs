module Funciones_ejercicios_parcial_T1 where
{-
-------------------------------------------
f1 : renombrada a cantidadAbundantesEnRango
-------------------------------------------

problema cantidadAbundantesEnRango (d: Z,h: Z) : Z {
requiere: {0 < d ≤ h}
asegura: {res es la cantidad de números abundantes en el rango [d..h]}
-}

cantidadAbundantesEnRango :: Integer -> Integer -> Integer
cantidadAbundantesEnRango 1 1 = 0
cantidadAbundantesEnRango d h = sumaAbundantes (rangoN d h)
--
--aux
rangoN :: Integer -> Integer -> [Integer]
rangoN 1 1 = [1]
rangoN d h 
    | h > d = rangoN d (h-1) ++ [h]
    | otherwise = [d]
--
--aux : cuento la cantidad de numeros abundantes dentro de la lista
sumaAbundantes :: [Integer] -> Integer
sumaAbundantes [] = 0
sumaAbundantes (x:xs) 
    | abundanteN x = 1 + sumaAbundantes xs
    | otherwise = sumaAbundantes xs
--
-- aux : True si el numero n es abundante   
abundanteN :: Integer -> Bool
abundanteN 1 = False
abundanteN n
    | sumaLista (divisoresPropios n) > n = True
    | otherwise = False
--
--aux  : Suma los elementos de la lista
sumaLista :: [Integer] -> Integer
sumaLista [] = 0
sumaLista (x:xs) = x + sumaLista xs
--
--aux : Lista de divisores propios de n
divisoresPropios :: Integer -> [Integer]
divisoresPropios 1 = []
divisoresPropios n = divisoresDesde n (n-1)
-- 
--aux : Lista de divisores de n desde un indice  
divisoresDesde :: Integer ->  Integer -> [Integer]
divisoresDesde _ 0 = []
divisoresDesde n i 
    | mod n i == 0 = [i] ++ divisoresDesde n (i-1)  
    | otherwise = divisoresDesde n (i-1)  
---
{--
-------------------------------------------------
f2 : renombrada a listaMateriascursadasVencidas
-------------------------------------------------

(f2): dada una lista de cursadas devuelva aquellas materias cuya aprobación de la cursada ya venció, y por lo tanto ya no se puede rendir el final
problema f2 (s: seq⟨String x Z x Z⟩) :seq⟨String⟩ {
requiere: { s[i]1 ≥ 1993 para todo i tal que 0 ≤ i < |s|}
requiere: { 0 ≤ s[i]2 ≤ 2 para todo i tal que 0 ≤ i < |s|}
asegura: { res no tiene elementos repetidos}
asegura: { res contiene los nombres de todas las materias incluídas en s tales que la materia fue aprobada a más tardar en el primer cuatrimestre de 2021, inclusive}
asegura: { res contiene solamente los nombres de las materias incluídas en s tales que la materia fue aprobada a más tardar en el primer cuatrimestre de 2021, inclusive}
}
-}

listaMateriascursadasVencidas :: [([Char],Integer,Integer)] -> [[Char]]
listaMateriascursadasVencidas  [] = []
listaMateriascursadasVencidas  (x:xs)
    | vencioMateria x = agregarSinRepetir (elfst x) (listaMateriascursadasVencidas xs) 
    | otherwise = listaMateriascursadasVencidas  xs
-- Aux
agregarSinRepetir :: [Char] ->  [[Char]] -> [[Char]]
agregarSinRepetir materia [] = [materia]
agregarSinRepetir materia (x:xs) 
    | materia ==  x = (x:xs) -- si esta, no lo agrego
    | otherwise = x : agregarSinRepetir materia xs -- verifico materia contra el resto de la lista xs

--- Aux
vencioMateria :: ([Char], Integer, Integer) -> Bool
vencioMateria x
    | elsnd x == 2021 && eltrd x == 1 = True 
    | elsnd x == 2021 && eltrd x > 1 = False
    | elsnd x > 2021 = False
    | otherwise = True
-- Aux : Tripla
--
elfst :: (a,b,c) -> a
elfst (x,y,z) = x 
--
elsnd :: (a,b,c) -> b
elsnd (x,y,z) = y 
--
eltrd :: (a,b,c) -> c
eltrd (x,y,z) = z 



{-
------------------------------
f3 : renombrada a tomarHastaNegativoContope
------------------------------
(f3) : Arma lista hasta el primer negativo con tope

problema f3 (s: seq⟨Z⟩, u: Z) : seq⟨Z⟩ {
requiere: {u > 0}
asegura: { La longitud de res es igual a la cantidad de elementos no negativos consecutivos desde el inicio de s }
asegura: {Para cualquier i en el rango 0 ≤ i < |res| tal que 0 ≤ s[i] ≤ u, se cumple que res[i] = s[i]}
asegura: {Para cualquier i en el rango 0 ≤ i < |res| tal que s[i] > u, se cumple que res[i] = u}
}
--  ejemplo : f3 [3,8,5,0,7,-2,4] 5 debe devolver [3,5,5,0,5]
-}
---
tomarHastaNegativoContope :: [Integer] -> Integer -> [Integer]
tomarHastaNegativoContope [] _ = []
tomarHastaNegativoContope (x:xs) n
    | x < 0 = []
    | x >= n = n : tomarHastaNegativoContope xs n
    | otherwise = x : tomarHastaNegativoContope xs n

{-
------------------------------------
renombra f4 : matrizCantParesColumna
------------------------------------
problema f4 (matriz: seq⟨seq⟨Z⟩⟩, col: Z) : Z{
requiere: {Todos los elementos de la secuencia matriz tienen la misma longitud}
requiere: {|matriz| > 0}
requiere: {|matriz[0]| > 0}
requiere: {1 ≤ col ≤ |matriz[0]| }
asegura: {res es la cantidad de números pares de los elementos matriz[i][col-1] para todo i tal que 0 ≤ i < |matriz| }
}
--Ejemplo: f4 [[-9,8,2,3],[2,7,-5,3],[-1,0,5,6]] 2 debe devolver 2
-}
--
matrizCantParesColumna :: [[Integer]] -> Integer -> Integer
matrizCantParesColumna [] _ = 0
matrizCantParesColumna  (x:xs) c = cuentaPares (armoLista (x:xs) (c-1)) 

armoLista :: [[Integer]] -> Integer -> [Integer]
armoLista [] _ = []
armoLista (x:xs) i = iesimoElem x i : armoLista xs i 

longitud :: [Integer] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

cuentaPares :: [Integer] -> Integer
cuentaPares [] = 0
cuentaPares (x:xs)
    | mod x 2 == 0 = 1 + cuentaPares xs
    | otherwise = cuentaPares xs

iesimoElem  :: [Integer] -> Integer -> Integer
iesimoElem (x:xs) 0 = x
iesimoElem (x:xs) i
    | (longitud (x:xs) -1) >= i  = iesimoElem xs (i-1)
    | otherwise = x     