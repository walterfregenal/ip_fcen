---GUIA 4: Funciones recursivas

--problema fibonacci (n: Z) : Z {
--requiere: { n ≥ 0 }
--asegura: { resultado = 0 si n = 0, 1 si n = 1, fibonacci(n-1) + fibonacci(n-2) si n > 1 }
--}
fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)
----
--problema parteEntera (x: R) : Z {
--requiere: { x ≥ 0 }
--asegura: { resultado ≤ x < resultado + 1 }
--}
parteEntera :: Float -> Integer
parteEntera x | x < 1 = 0
              | otherwise = 1 + parteEntera (x - 1)
----
--problema esDivisible (a,b: Z) : Bool {
--requiere: { b ≠ 0 }
--asegura: { resultado = true si x es divisible por y, false en caso contrario }
--}
esDivisible :: Integer -> Integer -> Bool
esDivisible a b | abs a < abs b = False
                | abs a == abs b = True
                | otherwise = esDivisible (abs a - abs b) (abs b)
----
sumaDivisoreshasta :: Integer ->Integer -> Integer
sumaDivisoreshasta x y | y == 1 = 1
                       | mod x y == 0 = y + sumaDivisoreshasta x (y-1)
                       | otherwise = sumaDivisoreshasta x (y-1)
---
sumaDivisores :: Integer -> Integer
sumaDivisores x = sumaDivisoreshasta x x
---
----
sumaPares :: Integer -> Integer
sumaPares x | x == 0 = 0
            | mod x 2 == 0 = x + sumaPares (x-2)
            | otherwise = sumaPares (x-1)
----
--- Suma de potencias::
-- Suma los exponentes j de 1 a n para una base fija i: (i^n + i^(n-1) + ... + i^1)
sumaExponentes :: Integer -> Integer -> Integer
sumaExponentes _ 0 = 0
sumaExponentes i j = i^j + sumaExponentes i (j - 1)
---
-- Suma las bases i de 1 a m
sumaPotencias :: Integer -> Integer -> Integer
sumaPotencias 0 _ = 0
sumaPotencias m n = sumaExponentes m n + sumaPotencias (m - 1) n
---