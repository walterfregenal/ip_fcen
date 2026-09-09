module FuncionesListas where
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

sumatoria :: [Int] -> Int
sumatoria []     = 0
sumatoria (x:xs) = x + sumatoria xs
----

---problema productoria (s: seq⟨Z⟩) : Z {
--requiere: { True }
--asegura : { res = producto de los elementos s  }
---}
productoria :: [Int] -> Int
productoria [] = 1
productoria (0:_) = 0
productoria (x:xs) = x * productoria(xs)
---
----
--problema maximo (s: seq⟨Z⟩) : Z {
--requiere: { |s| > 0 }
--asegura: { resultado ∈ s ∧ todo elemento de s es menor o igual a resultado }
---}
maximo :: [Int] -> Int
maximo [x] = x
maximo (x:xs) | x > maximo xs = x
              | otherwise = maximo xs
----

--problema sumarN (n: Z, s: seq⟨Z⟩) : seq⟨Z⟩ {
--requiere: { True }
--asegura: {|res| = |s| ∧ cada pos de res contiene el valor que hay en esa posicion en s sumado n}
-- }
sumarN :: Int -> [Int] -> [Int]
sumarN n [] = []
sumarN n (x:xs) = (x+n) : sumarN n xs
---

--problema sumarElPrimero (s: seq⟨Z⟩) : seq⟨Z⟩ {
--requiere: { |s| > 0 }
--asegura: {resultado = sumarN(s[0], s) }
--}
sumarElPrimero :: [Int] -> [Int]
sumarElPrimero [] = []
sumarElPrimero (x:xs) = sumarN x (x:xs)
----
--problema sumarElUltimo (s: seq⟨Z⟩) : seq⟨Z⟩ {
--requiere: { |s| > 0 }
--asegura: {resultado = sumarN(s[|s| − 1], s) }
--}
sumarElUltimo :: [Int] -> [Int]
sumarElUltimo [] = []
sumarElUltimo xs = sumarN (ultimo xs) xs
----
--problema pares (s: seq⟨Z⟩) : seq⟨Z⟩ {
--requiere: { True }
--asegura: {res elementos pares de s en el orden dado, respeta repeticiones}
--}
pares :: [Int] -> [Int]
pares [] = []
pares (x:xs) | mod x 2 == 0 = x : pares xs      
             | otherwise = pares xs
----

---problema ordenar (s: seq⟨Z⟩) : seq⟨Z⟩ {
--- requiere: { True }
--- asegura: {res lista de longitud |s| pero con elementos s[i] < s[1 +1]}
--}
insertar :: Int -> [Int] -> [Int]
insertar x [] = [x]  -- También es válido escribir x:[]
insertar x (y:ys) 
  | x <= y    = x : y : ys
  | otherwise = y : insertar x ys
---
ordenar :: [Int] ->[Int]
ordenar [] = []
ordenar (x:xs) = insertar x  (ordenar xs)
----

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