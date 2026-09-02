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
-- problema sumaImparesHasta (n: Z) : Z {
-- requiere: { n ≥ 0 }
-- asegura: {res = 1 si n=1, suma de los números impares desde 1 hasta n si n>1}
-- }
sumaImparesHasta :: Integer -> Integer
sumaImparesHasta n  | n == 1 = 1
                    | mod n 2 == 1 = n + sumaImparesHasta (n - 2)
                    | otherwise = sumaImparesHasta (n - 1)
-----
-- problema sumaImpares  (n: Z) : Z {
-- requiere: { n ≥ 0 }
-- asegura: {res = 1 si n=1, suma de los primeros n números impares si n>1 }
-- }
sumaImpares :: Integer -> Integer
sumaImpares n = sumaImparesHasta (2*n - 1)
---
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
-- problema factorial (n: Z) : Z {
-- requiere: { n ≥ 0 }
-- asegura: {res = 1 si n=0, n * productoria de i ,con i desde n-1 hasta 1, si n>0}
--}
---
factorial :: Integer -> Integer
factorial 0 = 1
factorial 1 = 1
factorial n = n * factorial (n - 1)   
---
-- problema medioFactorial (n: Z) : Z {
-- requiere: { n ≥ 0 }
-- asegura: {res = 1 si n=0, n * productoria de i, con i desde n-2 hasta 1, si n>0}
--}
---
medioFactorial :: Integer -> Integer
medioFactorial 0 = 1
medioFactorial 1 = 1
medioFactorial n = n * medioFactorial (n - 2)
----
--- problema cantidadDigitos (n: Z) : Z {
-- requiere: { n ≥ 0 }
-- asegura: {res = 1 si n < 10, 1 + cantidadDigitos(n/10) si n ≥ 10}
--}
----
cantidadDigitos :: Integer -> Integer
cantidadDigitos n | n < 10 = 1
                    | otherwise = 1 + cantidadDigitos (div n 10)
----
-- problema digitoIesimo (n: Z, i: Z) : Z {
-- requiere: { n ≥ 0, i ≥ 1, i ≤ cantidadDigitos(n) }
-- asegura: {res = digito i-ésimo de n, contando desde i = 1 para el dígito más a la derecha}
--}
digitoIesimo :: Integer -> Integer -> Integer
digitoIesimo n i | n >= 0 && i == 1 = mod n 10                      
                    | n>=0 && i>=1 &&i<= cantidadDigitos(n) = digitoIesimo (div n 10) (i - 1)
                    | otherwise = error " ## i debe ser mayor o igual a 1 y menor o igual a la cantidad de dígitos de n ###"
---
-- problema todosDigitosIguales (n: Z) : Bool {
-- requiere: { n ≥ 0 }
-- asegura: {res = true si todos los dígitos de n son iguales, false en caso contrario}
--}
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n |  cantidadDigitos n == 1 = False
                      |  cantidadDigitos n == 2 = mod n 10 == mod (div n 10) 10
                      |  otherwise = (mod n 10 == mod (div n 10) 10) && todosDigitosIguales (div n 10)