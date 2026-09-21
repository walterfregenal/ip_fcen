module FuncionesListas where

 --- Funciones Universales para LISTAS

---problema longitud (s:seq<T>):Z{
-- requiere: {True}
-- asegura: {res = longitud(s)}
--}
---

longitud ::  [t] -> Integer
longitud [] = 0
longitud (_:xs) = 1 + longitud xs
---
-----
sonTodosIguales :: (Eq a) => [a] -> Bool
sonTodosIguales [] = True
sonTodosIguales [_] = True
sonTodosIguales (x:y:ys) | x == y = sonTodosIguales (y:ys)
                         | x /= y = False
-----
--problema todosDistintos (s: seq⟨T⟩) : B {
--requiere: { True }
--asegura: { resultado = false ↔ existen dos posiciones distintas de s con igual valor }
--}
-- Función auxiliar para saber si un elemento está en la lista
pertenece :: Eq t => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x:xs) 
  | e == x    = True
  | otherwise = pertenece e xs

-- Función principal que cumple con la especificación
todosDistintos :: Eq t => [t] -> Bool
todosDistintos [] = True
todosDistintos (x:xs)  | pertenece x xs == True = False
                       | otherwise      = todosDistintos xs
----

-- problema quitar (e: T , s: seq< T >): seq<T> {
-- requiere : {True}
-- asegura : {res = lista a la que removi el primer elemento 'e' que aparece  en s, caso contrario s}
--} 
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar e (x:xs) | e == x = xs 
                | otherwise = x : quitar e (xs)

-- problema quitarRepetidos (e: T , s: seq< T >): seq<T> {
-- requiere : {True}
-- asegura : {res = lista a la que remueve los elemento 'e' que aparecen  en s, caso contrario s}
--} 
quitarRepetidos :: (Eq t) => t -> [t] -> [t]
quitarRepetidos _ [] = []
quitarRepetidos e (x:xs) | e /= x = x : quitarRepetidos e (xs)
                         | otherwise = quitarRepetidos e (xs)
----
-- Operaciones con LISTAS NUMERICAS
---
--problema maximo (s: seq⟨Z⟩) : Z {
--requiere: { |s| > 0 } -- me olvido de que pasen lista vacia
--asegura: { resultado ∈ s ∧ todo elemento de s es menor o igual a resultado }
---}
maximo :: [Int] -> Int
maximo [x] = x
maximo (x:xs)  | x >= m    = x 
               | otherwise = m
                where m = maximo xs

---
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
--problema capicuaCh (s: seq<Char>) : B{
-- requiere : { True }
-- asegura : { res = True , si la lista s = reverso s, False en caso contrario}
--}
capicuaCh ::  [Char] -> Bool
capicuaCh [] = False
capicuaCh l = l == reversoCh l 
---
--Aux 
reversoCh :: [Char] -> [Char]
reversoCh [] = []
reversoCh (x:xs) = reversoCh xs ++ [x]  -- concatena la lista reversa de xs con el elemento x al final
---      
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
---
----
---problema ordenar (s: seq⟨Z⟩) : seq⟨Z⟩ {
--- requiere: { True }
--- asegura: {res lista de longitud |s| pero con elementos s[i] < s[1 +1]}
--}
---
ordenar2 :: [Int] -> [Int]
ordenar2 [] = []
ordenar2 l =  ordenar2 (quitar (maximo l) l) ++ [maximo l]
-------
-- Funciones auxiliares para TRIM de un texto
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
-- Función auxiliar: verifica si una lista tiene únicamente espacios
todoEspacios :: [Char] -> Bool
todoEspacios [] = True
todoEspacios (x:xs) = (x == ' ') && todoEspacios xs

-- Función principal para borrar espacios al final
borraEspFin :: [Char] -> [Char]
borraEspFin [] = []
borraEspFin (x:xs) 
  | x == ' ' && todoEspacios xs = borraEspFin xs -- Si es espacio y lo que sigue son solo espacios, lo descartamos
  | otherwise = x : borraEspFin xs -- Si no, lo conservamos y seguimos

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
--- Funciones AUX para contar palabras
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

-----
--Uso de listas para emplear en AGENDA TELEFONICA --

type Texto = [Char]
type Nombre = Texto
type Telefono = Texto
type Contacto = (Nombre, Telefono)
type ContactosTel = [Contacto]

----
enLosContactos :: Nombre -> ContactosTel -> Bool
enLosContactos _ [] = False
enLosContactos n ((nombre, telefono):xs) 
  | n == nombre || enLosContactos n xs = True
  | otherwise = False

---                                        
agregarContacto :: Contacto -> ContactosTel -> ContactosTel
agregarContacto c [] = [c]
agregarContacto (n_nuevo, t_nuevo) ((n, t):xs) 
  | n_nuevo == n = (n, t_nuevo) : xs
  | otherwise    = (n, t) : agregarContacto (n_nuevo, t_nuevo) xs

----
---- Operaciones con Matrices 

--- problema multiplicarFilas (m : seq <seq <Z>) : Z {
--requiere: { |m| > 0 }
--requiere: { |m[0]| > 0 }
--requiere: { Todos los elementos de la secuencia m tienen la misma longitud }
-- asegura : { |Res| = m }
--asegura : {Res = lista de la productoria de los elementos de cada fila}
--}

multiplicarFilas :: [[Integer]] -> [Integer]
multiplicarFilas []     = []
multiplicarFilas (x:xs) = multiplicarUnaFila x : multiplicarFilas xs

multiplicarUnaFila :: [Integer] -> Integer
multiplicarUnaFila []     = 1  -- Elemento neutro de la multiplicación (opcional, según restricciones)
multiplicarUnaFila [c]    = c
multiplicarUnaFila (x:xs) = x * multiplicarUnaFila xs

--problema sumaTotal (m: seq⟨seq⟨Z⟩⟩) : Z {
--requiere: { |m| > 0 }
--requiere: { |m[0]| > 0 }
--requiere: { Todos los elementos de la secuencia m tienen la misma longitud }
--asegura: { res = sumatoria de i=0 a |m|-1 de sumatoria de j = 0 a |m[i]|-1 de m[i] [j] }

sumaTotal :: [[Integer]] -> Integer
sumaTotal [] = 0
sumaTotal (x:xs) = sumaUnaFila x + sumaTotal xs

sumaUnaFila :: [Integer] -> Integer
sumaUnaFila [] = 0
sumaUnaFila [c] = c
sumaUnaFila (x:xs) = x + sumaUnaFila xs
---
---
----
--problema iesimaFila (i: Z, m: seq⟨seq⟨T⟩⟩) : seq⟨T⟩ {
--requiere: { |m| > 0 }
--requiere: { |m[0]| > 0 }
--requiere: { Todos los elementos de la secuencia m tienen la misma longitud }
--requiere: { 0 ≤ i < |m| }
--asegura: { |resultado| = |m[i]| }
--asegura: { Para todo 0 <= j < |m[i]|, resultado[j] = m[i][j] }
--}
iesimaFila::  Integer -> [[t]] -> [t]
iesimaFila _ [] = []
iesimaFila i (x:xs) | i == 0  = x
                    | otherwise = iesimaFila (i-1) xs 
---
--- CANTIDAD DE APARICIONES de "e" en la matriz cuadrada "m".
--problema cantidadDeApariciones (e: Z, m: seq⟨<seq⟨Z⟩⟩) : Z {
-- requiere: { |m| > 0 }
--requiere: { |m[0]| > 0 }
-- requiere: { Todos los elementos de la secuencia m tienen la misma longitud }
-- asegura: { resultado = cantidad de apariciones de e en m }
--}
cantidadDeApariciones :: Integer -> [[Integer]] -> Integer
cantidadDeApariciones _ [] = 0
cantidadDeApariciones e (x:xs) = aparicionesN e x + cantidadDeApariciones e xs
--
-- Aux: Obtiene el numero de apariciones de e en la cadena
-- problema aparicionesN (e :Z , m:seq<Z>): Z{
-- requiere: { True }
-- asegura : { res = numero de apariciones de e en la lista}
--} 
aparicionesN :: Integer -> [Integer] -> Integer
aparicionesN _ [] = 0
aparicionesN e (x:xs) 
    | e == x = 1 + aparicionesN e xs
    | otherwise = aparicionesN e xs
---
--- Elemento de prueba : matrix3x3 = [[1,2,3],[3,4,5],[5,6,7]]
----
--listaMateriascursadasVencidas(f2): dada una lista de cursadas devuelva aquellas materias cuya aprobación de la cursada ya venció, y por lo tanto ya no se puede rendir el final
--problema f2 (s: seq⟨String x Z x Z⟩) :seq⟨String⟩ {
--requiere: { s[i]1 ≥ 1993 para todo i tal que 0 ≤ i < |s|}
--requiere: { 0 ≤ s[i]2 ≤ 2 para todo i tal que 0 ≤ i < |s|}
--asegura: { res no tiene elementos repetidos}
--asegura: { res contiene los nombres de todas las materias incluídas en s tales que la materia fue aprobada a más tardar en el primer cuatrimestre de 2021, inclusive}
--asegura: { res contiene solamente los nombres de las materias incluídas en s tales que la materia fue aprobada a más tardar en el primer cuatrimestre de 2021, inclusive}
--}


listaMateriascursadasVencidas :: [([Char],Integer,Integer)] -> [[Char]]
listaMateriascursadasVencidas  [] = []
listaMateriascursadasVencidas  (x:xs)
    | vencioMateria x = agregarSinRepetir (elfst x) (listaMateriascursadasVencidas xs) 
    | otherwise = listaMateriascursadasVencidas  xs
-- Aux
agregarSinRepetir :: [Char] ->  [[Char]] -> [[Char]]
agregarSinRepetir materia [] = [materia]
agregarSinRepetir materia (x:xs) 
    | materia ==  x = (x:xs) -- si esta, no lo agrego
    | otherwise = x : agregarSinRepetir materia xs -- verifico materia contra el resto de la lista xs

--- Aux
vencioMateria :: ([Char], Integer, Integer) -> Bool
vencioMateria x
    | elsnd x == 2021 && eltrd x == 1 = True 
    | elsnd x == 2021 && eltrd x > 1 = False
    | elsnd x > 2021 = False
    | otherwise = True
-- Aux : Tripla
--
elfst :: (a,b,c) -> a
elfst (x,y,z) = x 
--
elsnd :: (a,b,c) -> b
elsnd (x,y,z) = y 
--
eltrd :: (a,b,c) -> c
eltrd (x,y,z) = z 

{-
problema agrupoSeriesPorTemporada(s= seq < String x Z>) : seq < Z x seq <String> > {
requiere: { |s| > 0}
requiere: { s[i] != s[j] para todo i != j   } 
asegura : { res = lista de tuplas agrupadas por numero de temporadas}
}
-}

type Serie = [Char]
type Temporadas = Integer 
type SerieTup = (Serie, Temporadas)
type TemporadasTup = (Integer, [Serie]) 
agrupoSeriesPorTemporada :: [SerieTup] -> [TemporadasTup]
agrupoSeriesPorTemporada [] = []
agrupoSeriesPorTemporada ((serie,temporadas):xs) = 
    agregarSerie2 serie temporadas (agrupoSeriesPorTemporada xs)
--    
-- Aux de agrupo Series por Temp
agregarSerie2 :: Serie -> Temporadas ->  [TemporadasTup] -> [TemporadasTup]
agregarSerie2 serie temporadas [] = [(temporadas, [serie])]
agregarSerie2 serie temporadas ((numtemporadas, listaseries):xs) 
  | temporadas == numtemporadas = (numtemporadas, listaseries ++ [serie]):xs 
  | otherwise = (numtemporadas , listaseries) :agregarSerie2 serie temporadas xs 
----
-- COMPLEMENTARIA
-- Funcion para ordenar en forma creciente la lista de TemporadasTup
ordenoListaTup :: [TemporadasTup] -> [TemporadasTup]
ordenoListaTup [] = []
ordenoListaTup ((temporadas, listaseries) : xs) = 
    ordenoListaTup (quitoMayor mayorTup ((temporadas, listaseries) : xs)) ++ [mayorTup]
    where mayorTup = elMayor ((temporadas, listaseries) : xs)
--Aux de Ordeno Lista
elMayor :: [TemporadasTup] -> TemporadasTup
elMayor [x] = x
elMayor ((temporadas, listaseries) : xs) 
    | temporadas > fst (elMayor xs) = (temporadas, listaseries) 
    | otherwise                     = elMayor xs
--Aux de Ordeno Lista
quitoMayor :: TemporadasTup -> [TemporadasTup] -> [TemporadasTup]
quitoMayor _ [] = []
quitoMayor mayor (x:xs) 
    | mayor == x = xs
    | otherwise  = x : quitoMayor mayor xs
    
-- lista de pruebas :
{-
[ ("Breaking Bad", 5)
, ("Game of Thrones", 8)
, ("Better Call Saul", 6)
, ("Succession", 4)
, ("The Office US", 9)
, ("Stranger Things", 5)
, ("Mad Men", 7)
, ("Bojack Horseman", 6)
, ("Modern Family", 11)
, ("The Crown", 6)
]
-}
-- resultados:
{-
ghci> listaprueba = [ ("Breaking Bad", 5) , ("Game of Thrones", 8),  ("Better Call Saul", 6) , ("Succession", 4) , ("The Office US", 9) , ("Stranger Things", 5) , ("Mad Men", 7) , ("Bojack Horseman", 6) , ("Modern Family", 11),("The Crown", 6)]
ghci>                                                                                                                                                                                                                     
ghci> agrupoSeriesPorTemporada listaprueba                                                                                                                                                                                
[(6,["The Crown","Bojack Horseman","Better Call Saul"]),(11,["Modern Family"]),(7,["Mad Men"]),(5,["Stranger Things","Breaking Bad"]),(9,["The Office US"]),(4,["Succession"]),(8,["Game of Thrones"])]
ghci> 
ghci> lista_tup = agrupoSeriesPorTemporada listaprueba                                                                                                                                                                    
ghci>                     
ghci> lista_tup 
[(6,["The Crown","Bojack Horseman","Better Call Saul"]),(11,["Modern Family"]),(7,["Mad Men"]),(5,["Stranger Things","Breaking Bad"]),(9,["The Office US"]),(4,["Succession"]),(8,["Game of Thrones"])]
ghci>
ghci> ordenoListaTup lista_tup 
[(4,["Succession"]),(5,["Stranger Things","Breaking Bad"]),(6,["The Crown","Bojack Horseman","Better Call Saul"]),(7,["Mad Men"]),(8,["Game of Thrones"]),(9,["The Office US"]),(11,["Modern Family"])]
ghci> 

-}

{-
EJERCICIO 2: Recursión sobre Secuencias / Listas (2 Puntos)
Escribir la función mismosElementos :: (Eq a) => [a] -> [a] -> Bool que determine si dos listas s1 y s2 contienen exactamente los mismos elementos,
sin importar el orden ni la cantidad de repeticiones de los mismos.

Especificación Formal:
  problema mismosElementos (s1 : seq<T>, s2 : seq<T>) : Bool {
    requiere: { True }
    asegura: { (res = true) <-> ((FORALL x : T)(pertenece(x, s1) <-> pertenece(x, s2))) }
  }

-}

mismosElementos :: (Eq a, Ord a) => [a] -> [a] -> Bool
mismosElementos [] [] = True
mismosElementos lista1 lista2 
    | ordenarLista (quitarRepetidosEn lista1) == ordenarLista (quitarRepetidosEn lista2) = True
    | otherwise = False
---
-- Aux
quitarRepetidosEn ::  (Eq a) => [a] -> [a]
quitarRepetidosEn [] = []
quitarRepetidosEn (x:xs) 
    | perteneceA x xs = quitarRepetidosEn xs
    | otherwise = x : quitarRepetidosEn xs
-- Aux de quitarRepetidos
perteneceA :: (Eq a) => a -> [a] -> Bool
perteneceA _ [] = False
perteneceA e (x:xs) 
    | e == x = True
    | otherwise = perteneceA e xs
--Aux 
ordenarLista :: (Eq a, Ord a) => [a] -> [a]
ordenarLista [] = []
ordenarLista (x:xs) = ordenarLista ( quitoElem mayor (x:xs)) ++ [mayor]
    where mayor = elMayorElem (x:xs)
----
-- Aux de ordenarLista
quitoElem :: (Eq a) => a -> [a] -> [a]
quitoElem _ [] = []
quitoElem e (x:xs) 
    | e == x = xs
    | otherwise = x: quitoElem e xs
-- Aux de Ordenar Lista
elMayorElem :: (Eq a , Ord a) => [a] -> a
elMayorElem [] = error "Lista vacia no tiene mayor"
elMayorElem [x] = x
elMayorElem (x:xs) 
    | x > elMayorElem xs = x
    | otherwise = elMayorElem xs


{-
EJERCICIO 3: Estructuras Compuestas / Registros (2 Puntos)
Un centro de estudiantes representa el registro de exámenes de alumnos mediante una lista de tuplas de tipo (String, [Integer]), 
donde la primera componente es el nombre del estudiante y la segunda es su lista de notas recibidas.

Escribir la función estudianteConMejorPromedio :: [(String, [Integer])] -> String
que devuelva el nombre del estudiante con el promedio de notas más alto. En caso de empate en el promedio máximo, 
debe devolver el nombre del primero que aparezca en el registro.

Especificación Formal:
  problema estudianteConMejorPromedio (registro : seq<String x seq<Z>>) : String {
    requiere: { |registro| > 0 }
    requiere: { Para todo (nombre, notas) en registro, |notas| > 0 }
    requiere: { Para todo (nombre, notas) en registro e i en [0..|notas|-1], 1 <= notas[i] <= 10 }
    asegura: { (EXISTS (n, ns) en registro)(n = res AND (FORALL (n', ns') en registro)(promedio(ns') <= promedio(ns))) }
    asegura: { Si existen múltiples estudiantes con el mismo promedio máximo, res es el nombre del primero de ellos en aparecer en registro }
  }


-}

type Alumno = [Char]
type Notas = [Integer]
type EstudianteTup = (Nombre, Notas)
type RegistroNotas = [EstudianteTup]



estudianteConMejorPromedio2 :: [(String, [Integer])] -> String
estudianteConMejorPromedio2 [] = error " No cumple la precondicion : Lista vacia" 
estudianteConMejorPromedio2 [x] = fst x
estudianteConMejorPromedio2 ((nombre,notas):xs) = fst (auxiliarMejor xs (nombre, promedio))
    where promedio =  promedioLista notas
-- Idea conceptual: tener memoria del mejor alumno actual y su promedio mejor y solo reemplazarlo si hay otro alumno con mayor prom
-- auxiliarMejor [estudiantes_restantes] (nombre_mejor_actual, promedio_mejor_actual)
auxiliarMejor :: RegistroNotas -> (Alumno, Float) -> (Alumno, Float) 
auxiliarMejor [] mejor = mejor
auxiliarMejor ((nombre,notas):xs) (nombre_mejor_actual, promedio_mejor_actual) 
    | promedio > promedio_mejor_actual = auxiliarMejor xs (nombre,promedio) 
    | otherwise = auxiliarMejor xs (nombre_mejor_actual, promedio_mejor_actual) 
    where promedio =  promedioLista notas

-- Aux  promedioLista
promedioLista :: Notas -> Float
promedioLista [] = error "Lista vacia : tiene que proporcionar una nota"
promedioLista notas = fromIntegral sumanotas / fromIntegral long 
    where (sumanotas , long) = sumaElemyLongLista notas
-- Aux de promedioLista
sumaElemyLongLista :: [Integer] -> (Integer, Integer)
sumaElemyLongLista [] = (0,0)
sumaElemyLongLista (x:xs) = (x + sumaResto, 1 + longResto)
    where (sumaResto, longResto) = sumaElemyLongLista xs

{-
Para prueba 
ghci> estudianteConMejorPromedio2  [("Juan", [8, 9])]
"Juan"
ghci> estudianteConMejorPromedio2  [("Juan", [8, 9]), ("Ana", [6, 9]),("Walter",[4,8,9]), ("Pedro Alfonso",[10,10,10,9])]  
"Pedro Alfonso"
ghci> estudianteConMejorPromedio2  []                                                                                      
"*** Exception:  No cumple la precondicion : Lista vacia
CallStack (from HasCallStack):
  error, called at PruebaFunciones.hs:32:34 in main:PruebaFunciones
ghci> 
-}