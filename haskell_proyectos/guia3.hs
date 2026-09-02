
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
productoInterno :: (Float,Float) -> (Float,Float) -> Float
productoInterno x y = elFst x * elFst y + elSnd x * elSnd y 
---


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

---- 
absX :: (Ord a , Num a) => a -> a
absX  n | n >= 0 = n 
        | otherwise = -n     
---
elFst ::(Num a) => (a,a) -> a
elFst (x,_) = x
--
elSnd ::(Num a) => (a,a) -> a
elSnd (x,_) = x
---
esParMenor :: (Float,Float) -> (Float,Float) -> Bool
esParMenor x y = (elFst x < elFst y) && (elSnd x < elSnd y) 
---
--- posPrimerPar (n : ZxZxZ): Z {
--  requiere : {True} = 1
--  asegura : { res es la posicion del primer numero par, o 4 si todos son impares}

---

posPrimerPar :: (Integer,Integer,Integer) -> Integer
posPrimerPar (a,b,c) | mod a  2 == 0 = 1
                     | mod b 2 == 0 = 2 
                     | mod c 2 == 0 = 3
                     | otherwise = 4   
---
type Anio = Integer
type EsBisiesto = Bool
esBisiesto :: Anio -> EsBisiesto
esBisiesto n = (mod n 4 == 0) && ((mod n 100 /= 0) || (mod n 400 == 0)) 
---
---
type Punto3D = (Float,Float,Float)
distanciaManhattan :: Punto3D -> Punto3D -> Float
distanciaManhattan (p1,p2,p3) (q1,q2,q3)= absX (p1-q1) + absX (p2-q2) + absX (p3-q3) 
------
---        
sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos n = mod (absX n) 10 + mod ( div (absX n) 10) 10
----
comparar :: Integer -> Integer -> Integer
comparar a b | sumaUltimosDosDigitos a < sumaUltimosDosDigitos b = 1
             | sumaUltimosDosDigitos a > sumaUltimosDosDigitos b = -1
             | sumaUltimosDosDigitos a == sumaUltimosDosDigitos b = 0
-----
-- problema sumarSoloMultiplos (x : ZxZxZ , n : N) : Z {
  --requiere : {True}
  --asegura : { res = la suma de xi , si xi es multiplo de n, 0 en caso contrario} 
  -- }
sumarSoloMultiplos :: (Integer,Integer,Integer) -> Integer -> Integer
sumarSoloMultiplos (x1,x2,x3) n | mod x1 n == 0 && mod x2 n == 0 && mod x3 n == 0 = x1 + x2 + x3
                        | mod x1 n == 0 && mod x2 n == 0 = x1 + x2
                        | mod x1 n == 0 && mod x3 n == 0 = x1 + x3
                        | mod x2 n == 0 && mod x3 n == 0 = x2 + x3
                        | mod x1 n == 0 = x1
                        | mod x2 n == 0 = x2
                        | mod x3 n == 0 = x3
                        | otherwise = 0
----
--- problema enelMismoIntervalo (a,b : R) : Bool {
  --requiere : {True}
  --asegura : { res = True si a y b  pertenecen al mismo intervalo :(−∞, 3], (3, 7] y (7, ∞), False en caso contrario} 
  -- }
enelMismoIntervalo :: Float->Float -> Bool
enelMismoIntervalo a b | (a <= 3 && b <= 3) = True
                       | (a > 3 && a <= 7 && b > 3 && b <= 7) = True
                       | (a > 7 && b > 7) = True
                       | otherwise = False

-- problema f4 (a,b : R) : R {
  --requiere : {True}
  --asegura : { res = (a+b)/2} 
  -- }
---  
-- problema f5 :: (a: RxR) : R {
--  requiere : {True}
--  asegura : { res = (elFst a + elSnd b) / 2 }}
---
-- problema f6 (a: R, b:Z): Bool {
    --requiere : {True}
    --asegura : {Res = True si la parte entera de a es igual al numero b, false en caso contrario}
    --}  
f6 :: Float -> Int -> Bool
f6 a b = truncate a == b