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
--problema sumaExponentes (n: Z, m: Z) : Z {
--requiere: { i ≥ 0, m ≥ 0 }
--asegura: { res = Suma los exponentes j de m a 1 para una base fija i: (i^n + i^(n-1) + ... + i^1)
--}
---
sumaExponentes :: Integer -> Integer -> Integer
sumaExponentes 0 _ = 0
sumaExponentes i 0 = 1
sumaExponentes i j = i^j + sumaExponentes i (j - 1)
---
-- problema sumaPotenciasnm ( n: Z, m: Z) : Z {
-- requiere: { n ≥ 0, m ≥ 0 }
-- asegura: {res = suma i de 1 a n de lasuma de j de 1 a m (i^j)}
sumaPotenciasnm :: Integer -> Integer -> Integer
sumaPotenciasnm 0 _ = 0
sumaPotenciasnm n m = sumaPotenciasnmAux n m  + sumaPotenciasnm (n-1) m

sumaPotenciasnmAux :: Integer -> Integer -> Integer
sumaPotenciasnmAux _ 0 = 1
sumaPotenciasnmAux n m = n^m + sumaPotenciasnmAux n (m-1)
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
---
--problema sumaDigitos (n: Z) : Z {
--requiere: { n ≥ 0 }
--asegura: {res = n si cantidadDigitos = 1, primer digito de n, sumado a sumaDigitos (n / 10) en otro caso}
--}
sumaDigitos :: Integer -> Integer
sumaDigitos n | cantidadDigitos n == 1 = n
              | otherwise = digitoIesimo n 1 + sumaDigitos (div n 10)
-----
---problema esCapicua (n: Z) : Bool{
--- requiere: { n ≥ 0}
--- asegura: {res = true si en el caso que n tiene longitud uno o que los digitos de los extremos de hacia el interior son iguales, false en otro caso}
---}
esCapicua :: Integer -> Bool
esCapicua n =  extremos 1 (cantidadDigitos n) 
        where extremos i j | i >= j = True -- contempla caso n tiene numero impar de digitos, y cuando se cruzan los indices de los digitos
                           | otherwise = (digitoIesimo n i == digitoIesimo n j) && extremos (i + 1) (j - 1) 
----
--problema f2n (n,q: Z) : Z {
-- requiere: { n ≥ 0 }
-- asegura: {res = 1 si q = 0, o suma n^i para i de 1 a q } 
---}
f2n :: Integer -> Integer-> Integer
f2n n 0 = 1
f2n n q = n^q + f2n n (q - 1)
----
---problem eulerN (n: Z) : R {
--- requiere: {n ≥ 0}
--- asegura: {res = 1 + 1/1! + 1/2  + ... + 1/n!}
---}

eulerN :: Integer -> Float
eulerN 0 = 1
eulerN n = (1 / fromIntegral (factorial n)) + eulerN (n - 1)
---
e :: Float
e = eulerN 10 
---  
aN :: Integer -> Float
aN 1 = 2.0
aN n = 2.0 + (1.0 / aN (n - 1))
--
raizDe2N :: Int ->Float
raizDe2N n = (aN (fromIntegral n)) - 1.0
---
raizDe2 :: Float
raizDe2 = raizDe2N 10
-----
--- problema menorDivisor 
menorDivisor :: Integer -> Integer
menorDivisor n = menorDivisorDesde n 2

menorDivisorDesde :: Integer -> Integer -> Integer
menorDivisorDesde m k  | mod m k == 0 = k        --- caso base
                       | otherwise = menorDivisorDesde m (k+1)
---
sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q 0 m = 0  -- Caso base: cuando n llega a 0, la suma de este ciclo termina
sumaPotencias q n m = sumaPotenciasAux q n m + sumaPotencias q (n-1) m -- CORREGIDO: Se agregó 'm' al final

sumaPotenciasAux :: Integer -> Integer -> Integer -> Integer
sumaPotenciasAux q n 0 = 0  -- Caso base: cuando m llega a 0, termina este ciclo interno
sumaPotenciasAux q n m = q^(n+m) + sumaPotenciasAux q n (m-1)
---
--problema sumaRacionales (n : N,  : N) : R {
--requiere: { True}
--asegura: { resultado = suma i = 1 hasta n de la suma de 1 hasta m de i/j }
--}
sumaRacionales :: Integer -> Integer -> Float
sumaRacionales 0 _ = 0
sumaRacionales n m = sumaRacionalesAux n m  + sumaRacionales (n-1) m
--
sumaRacionalesAux :: Integer -> Integer -> Float
sumaRacionalesAux n 1 = fromIntegral n
sumaRacionalesAux n m = (fromIntegral n / fromIntegral m) + sumaRacionalesAux n (m-1)
--
---
--problema esPrimo (n:Z):Bool{
--    requiere : {n>=1}
--    asegura  : { res = True si no existe un divisor menor que n, False en caso contrario }
--}
esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo n | n > 2 && menorDivisorDesde n 2 /=n = False
          | otherwise = True
---
esPrimo2 ::Integer -> Bool
esPrimo2 n = n>1 && menorDivisor n == n
----
--problema nEsimoPrimo (n:Z): Z{
--    requiere : {n>=1}
--    asegura  : { esPrimo(res) y res pertenece a los n primeros primos}
--}
nEsimoPrimo :: Integer -> Integer
nEsimoPrimo 1 = 2
nEsimoPrimo n = siguientePrimoDesde (nEsimoPrimo (n-1) + 1)
---
---
siguientePrimoDesde :: Integer -> Integer
siguientePrimoDesde n | (esPrimo n) = n
                      | otherwise = siguientePrimoDesde (n + 1)

--problema esSumaInicialDePrimos (n: Z) : B {
--requiere: { n ≥ 0 }
--asegura: { resultado = true ↔ n es igual a la suma de los m primeros numeros primos, para algun m.}
--}
esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos 0 = True
esSumaInicialDePrimos n = esSumaPrimerosKPrimos 1 n 

esSumaPrimerosKPrimos :: Integer -> Integer -> Bool
esSumaPrimerosKPrimos k n | (sumaKprimos k == n) = True
                          | (sumaKprimos k > n) = False
                          | otherwise = esSumaPrimerosKPrimos (k+1) n
---
sumaKprimos :: Integer -> Integer
sumaKprimos i | i == 0 = 0
              | otherwise = nEsimoPrimo i + sumaKprimos (i-1)
