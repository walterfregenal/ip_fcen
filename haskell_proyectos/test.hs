-- sacarBlancosRepetidos (Corregido error de tipeo en el nombre y código cortado)
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:ys) | x == ' ' && y == ' ' = sacarBlancosRepetidos (y:ys)
                               | otherwise            = x : sacarBlancosRepetidos (y:ys)

----
contarPalabras::[Char]->Int
contarPalabras [] = 0
contarPalabras xs = contarPalabrasLimpio(sacarEspacioInicioFin (sacarBlancosRepetodos xs)) + 1 -- pprque le saque los espacios al final de la cadena

---
sacarEspacioInicioFin :: [Char]->[Char]
sacarEspacioInicioFin [] = []
sacarEspacioInicioFin (x:xs) | x ==' ' = sacarEspacioFin xs
			                 | otherwise = x:sacarEspacioFin xs
---
sacarEspacioFin :: [Char]-> [Char]
sacarEspacioFin [] = []
sacarEspacioFin (x:[]) |  x ==' ' = []
		       | otherwise = [x]
sacarEspacioFin (x:xs) = x:sacarEspacioFin xs
---
contarPalabrasLimpio:: [Char]-> [Char]
contarPalabrasLimpio [] = 0
contarPalabrasLimpio (x:xs) | x==' ' = 1 + contarPalabrasLimpio xs
                            | otherwise = contarPalabrasLimpio xs
