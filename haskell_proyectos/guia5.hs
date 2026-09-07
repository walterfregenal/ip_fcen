---problema longitud (s:seq<Z>):Z{
-- requiere: {True}
-- asegura: {res = longitud(s)}
--}
---
longitud :: [Int] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs
---
---problema ultimo (s:seq<Z>):Z{
-- requiere: {|s| > 0}
-- asegura: {res = s[|s| - 1]}
---}
---
ultimo :: [Int] -> Int
ultimo [x] = x
ultimo (x:xs) = ultimo xs
---
---problema principio (s: seq⟨T ⟩) : seq⟨T ⟩ {
---requiere: { |s| > 0 }
--- asegura: { resultado = subseq(s, 0, |s| − 1) }
--}
principio :: [Int] -> [Int]
principio [x] = []
principio (x:xs) = x : principio xs  --- la lista es una subsecuencia de la lista original sin el último elemento
---
reverso :: [Int] -> [Int]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]  -- concatena la lista reversa de xs con el elemento x al final
---
sumaLista :: [Int] -> Int
sumaLista [] = 0
sumaLista (x:xs) = x + sumaLista xs

----

sumatoria2 :: [Int] -> Int
sumatoria2 []     = 0
sumatoria2 (x:xs) = x + sumatoria2 xs

----

pertenece :: [Int] -> Int -> Bool
pertenece [] _ = False
pertenece (x:xs) n |  x == n  = True
                   | otherwise = pertenece (xs) n
                  
------
longitud2 :: [Char] -> Int
longitud2 [] = 0
longitud2 (x:xs) = 1 + longitud2 xs
------
borraEspRep :: [Char] -> [Char]
borraEspRep [] = []
borraEspRep [x] = [x]
borraEspRep (x:y:ys) | x == ' ' && y == ' ' = borraEspRep (y:ys)
                     | otherwise            = x : borraEspRep (y:ys)
-----
sacarEspacioInicio :: [Char] -> [Char]
sacarEspacioInicio [] = []
sacarEspacioInicio (x:xs) | x == ' ' = xs
                          | otherwise = x : xs
--

borraEspFin :: [Char] -> [Char]
borraEspFin [] = []
borraEspFin (x:xs) | longitud2 xs == 0 && x == ' ' = []
                   | otherwise = x : borraEspFin xs
---
borraPuntuacion :: [Char] -> [Char]
borraPuntuacion [] = []
borraPuntuacion (x:xs) | x == '.' || x == ',' || x == ';' || x == ':' || x == '!' || x == '?'  = borraPuntuacion xs
                       | otherwise = x : borraPuntuacion xs
---
trimCadena2 :: [Char] -> [Char]
trimCadena2 [] = []
trimCadena2 xs = sacarEspacioInicio (borraEspFin (borraEspRep (borraPuntuacion xs)))
---
---
contarEsp :: [Char] -> Int
contarEsp [] = 0
contarEsp (x:xs) 
    | x == ' '  = 1 + contarEsp xs
    | otherwise = contarEsp xs
---
contarPalabras :: [Char] -> Int
contarPalabras [] = 0
contarPalabras xs = contarLimpia (trimCadena2 xs)
  where
    contarLimpia [] = 0
    contarLimpia limpia = contarEsp limpia + 1