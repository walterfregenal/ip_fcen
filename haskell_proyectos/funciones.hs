import Data.Bits (Bits(xor))
--Lista de funciones Guia3
f :: Integer -> Integer
f x | x == 1 = 8
    | x == 4 = 131
    | x == 16 = 16
---
g :: Integer -> Integer
g y | y == 8 = 16
    | y == 16 = 4 
    | y == 131 = 1
---
h :: Integer -> Integer
h n = f (g n)
---
k ::  Integer -> Integer
k n = g (f n)
---
maximo2 :: Integer -> Integer -> Integer
maximo2 x y | x >= x = x
            | otherwise = y
---            
absoluto :: Integer -> Integer
absoluto n | n >= 0 = n
           | otherwise = -n
--- 
doubleMe :: Integer -> Integer
doubleMe x = x + x
---
maximoAbsoluto :: Integer-> Integer -> Integer
maximoAbsoluto x y | absoluto x >= absoluto y = absoluto x
                   | otherwise = absoluto y
----
maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 x y z = maximo2 x (maximo2 y z)
----
algunoEsCero :: (Integer,Integer) -> Bool
algunoEsCero x | elFst x == 0 = True 
               | elSnd x == 0 = True
               | otherwise = False
---
sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos x y z | (x == y) && (y == z) = 0
                    | (x == z) && (x /= y) = y
                    | (x == y) && (y /= z) = z
                    | (y == z) && (y /= x) = x
                    | otherwise = x + y + z

----
sumaDistintos2 :: Integer -> Integer -> Integer -> Integer
sumaDistintos2 x y z | (x==y) && (y==z) = 0
                     | x == y = z
                     | x == z = y
                     | y == z = x
                     | otherwise = x + y + z 

---
digitoUnidades :: Integer -> Integer
digitoUnidades x = mod (absoluto x) 10
---
digitoDecenas :: Integer -> Integer
digitoDecenas x = digitoUnidades(div (absoluto x) 10) 
----                    
--- 
estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados a b  = ( mod a b == 0)
---
----
elFst :: (Num x) => (x,x) -> x
elFst (x,_) = x
----
elSnd :: (Num x) => (x,x) -> x
elSnd (_,y) = y
---

---
productoInterno :: (Float,Float) -> (Float,Float) -> Float
productoInterno x y = elFst x * elFst y + elSnd x * elSnd y 
---
esParMenor :: (Float,Float) -> (Float,Float) -> Bool
esParMenor x y | elFst x < elFst y = True
               | otherwise = False
---
<<<<<<< HEAD
distancia :: (Float,Float) -> (Float,Float) -> Float
distancia x y = sqrt((elFst x - elFst y)^2 + (elSnd x - elSnd y)^2)
---
crearPar :: a -> b -> (a,b)
crearPar x y = (x,y)
---
invertir :: (a,b) -> (b,a)
invertir  (x,y) = (y, x)
---
-- Función auxiliar f
fx :: Integer -> Integer
fx n | n <= 7    = n^2
    | otherwise = 2*n - 1

-- Función auxiliar g
gx :: Integer -> Integer
gx n | even n    = n `div` 2
    | otherwise = 3*n + 1

-- Función principal
todosMenores :: (Integer, Integer, Integer) -> Bool
todosMenores (t0, t1, t2) = (fx t0 > gx t0) && (fx t1 > gx t1) && (fx t2 > gx t2)
----

esBisiesto :: Integer -> Bool
esBisiesto n = (mod n 4 == 0) && ((mod n 100 /= 0) || (mod n 400 == 0))
----
sumaDivisoreshasta :: Integer ->Integer -> Integer
sumaDivisoreshasta x y | y == 1 = 1
                       | mod x y == 0 = y + sumaDivisoreshasta x (y-1)
                       | otherwise = sumaDivisoreshasta x (y-1)
---
sumaDivisores :: Integer -> Integer
sumaDivisores x = sumaDivisoreshasta x x
---
sumaPares :: Integer -> Integer
sumaPares x | x == 0 = 0
            | mod x 2 == 0 = x + sumaPares (x-2)
            | otherwise = sumaPares (x-1)
---

--- Suma de potencias::
-- Suma los exponentes j de 1 a n para una base fija i: (i^n + i^(n-1) + ... + i^1)
sumaExponentes :: Integer -> Integer -> Integer
sumaExponentes _ 0 = 0
sumaExponentes i j = i^j + sumaExponentes i (j - 1)

-- Suma las bases i de 1 a m
sumaPotencias :: Integer -> Integer -> Integer
sumaPotencias 0 _ = 0
sumaPotencias m n = sumaExponentes m n + sumaPotencias (m - 1) n
---
---- 
