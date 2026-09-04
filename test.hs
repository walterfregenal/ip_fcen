longitud :: [Int] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs
---
sumaLista :: [Int] -> Int
sumaLista [] = 0
sumaLista (x:xs) = x + sumaLista xs
