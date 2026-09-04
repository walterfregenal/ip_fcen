longitud :: [Int] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs
---
sumaLista :: [Int] -> Int
sumaLista [] = 0
sumaLista (x:xs) = x + sumaLista xs

----

sumatoria2 :: [Int] -> Int
sumatoria2 []     = 0
sumatoria2 (x:xs) = x + sumatoria2 xs

-- pertenece (Este estaba perfecto)
pertenece :: [Int] -> Int -> Bool
pertenece (x:xs) n | (x:xs) == []      = False
                   |  x == n  = True
                   | x /= n  = False
                   | otherwise = pertenece (xs) n


