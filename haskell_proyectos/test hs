-- longitud usando guardas (Corregido 'int' por 'Int')
longitud :: [Int] -> Int
longitud xs | xs == []  = 0
            | otherwise = 1 + longitud (tail xs)

-- longitud2 usando patrones (Corregido con paréntesis)
longitud2 :: [Int] -> Int
longitud2 []     = 0
longitud2 (x:xs) = 1 + longitud2 xs

-- sumatoria usando guardas (Corregido 'int', comparación de lista y código cortado)
sumatoria :: [Int] -> Int
sumatoria xs | xs == []  = 0
             | otherwise = head xs + sumatoria (tail xs)

-- sumatoria2 usando patrones (Corregido con paréntesis)
sumatoria2 :: [Int] -> Int
sumatoria2 []     = 0
sumatoria2 (x:xs) = x + sumatoria2 xs

-- pertenece (Este estaba perfecto)
pertenece :: [Int] -> Int -> Bool
pertenece xs n | xs == []      = False
               | head xs == n  = True
               | otherwise     = pertenece (tail xs) n

-- sacarBlancosRepetidos (Corregido error de tipeo en el nombre y código cortado)
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:ys) | x == ' ' && y == ' ' = sacarBlancosRepetidos (y:ys)
                               | otherwise            = x : sacarBlancosRepetidos (y:ys)
