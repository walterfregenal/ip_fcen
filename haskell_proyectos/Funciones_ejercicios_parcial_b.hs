module Funciones_ejercicios_parcial_b where
{-
------------------------------------------------
EJERCICIO 1: Recursión sobre Enteros (2 Puntos)
------------------------------------------------

Escribir la función sumaDigitosEnPosicionesPares :: Integer -> Integer que, dado un entero no negativo n, calcule la suma de los dígitos que ocupan
posiciones pares (considerando la posición 0 como el dígito de las unidades, la posición 1 como las decenas, la posición 2 como las centenas, etc.).

Especificación Formal:
  problema sumaDigitosEnPosicionesPares (n : Z) : Z {
    requiere: { n >= 0 }
    asegura: { res = SUMA_{i=0}^{cantDigitos(n)-1} (if (i mod 2 = 0) then digitoEnPosicion(n, i) else 0) }
  }
-}
sumaDigitosEnPosicionesPares :: Integer -> Integer
sumaDigitosEnPosicionesPares 0 = 0
sumaDigitosEnPosicionesPares n
    | n < 10 = n
    | otherwise = mod n 10 + sumaDigitosEnPosicionesPares (div n 100)


{-
---------------------------------------------------------------
EJERCICIO 2: Recursión sobre Secuencias / Listas (2 Puntos)
---------------------------------------------------------------

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
    | ordenarListaT (quitarRepetidosEn lista1) == ordenarListaT (quitarRepetidosEn lista2) = True
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
ordenarListaT :: (Eq a, Ord a) => [a] -> [a]
ordenarListaT [] = []
ordenarListaT (x:xs) = ordenarListaT ( quitoElem mayor (x:xs)) ++ [mayor]
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
----------------------------------------------------------------
EJERCICIO 3: Estructuras Compuestas / Registros (2 Puntos)
----------------------------------------------------------------

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
type EstudianteTup = (Alumno, Notas)
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

{-
-------------------------------------------------------------------
EJERCICIO 4: Recursión sobre Matrices / Listas Anidadas (2 Puntos)
---------------------------------------------------------------------

Dada una matriz de enteros m representada como una lista de listas [[Integer]],
escribir la función filaConMasCeros :: [[Integer]] -> Integer que devuelva el
índice (basado en 0) de la primera fila que contenga la mayor cantidad de ceros.

Especificación Formal:
  problema filaConMasCeros (m : seq<seq<Z>>) : Z {
    requiere: { |m| > 0 }
    requiere: { Para todo i en [0..|m|-1], |m[i]| > 0 }
    requiere: { Todos los elementos de m tienen la misma longitud (matriz rectangular) }
    asegura: { 0 <= res < |m| }
    asegura: { Para todo k en [0..|m|-1], contarCeros(m[res]) >= contarCeros(m[k]) }
    asegura: { Para todo k en [0..res-1], contarCeros(m[k]) < contarCeros(m[res]) }
  }
-}
-- filaConMasCeros inicializa el torneo tomando la fila 0 como campeona inicial
-- y arranca a recorrer el resto de las filas desde el índice 1.

filasConMasCeros :: [[Integer]] -> Integer
filasConMasCeros [] = error " Violacion del requiere :Lista Vacia"
filasConMasCeros [x] = 0
filasConMasCeros (x:xs) = fst (auxCerosResto headLista 1 xs) -- considero mi headLista como mi elemento campeon inicial con indice de maximo de ceros y numero de ceros 
    where headLista = (0,cerosDe x)
auxCerosResto:: (Integer,Integer) -> Integer -> [[Integer]] -> (Integer , Integer) -- hace falta el indice de recorrido para las filas del resto 
auxCerosResto maximo _ [] = maximo -- con recursion debo tener una Base
auxCerosResto (indMax, maxCeros) indice (y:ys) 
    | maxCeros >= cerosY  = auxCerosResto (indMax, maxCeros) (indice + 1) ys
    | otherwise = auxCerosResto (indice, cerosY ) (indice + 1 ) ys
    where cerosY = cerosDe y

cerosDe :: [Integer] -> Integer
cerosDe [] = 0
cerosDe (x:xs)
    | x == 0 = 1 + cerosDe xs
    | otherwise = cerosDe xs

{- 
Para la Prueba:
ghci> matrix                                            
[[1,2,3,0],[5,0,0,7],[8,0,9,9],[5,0,0,0]]
ghci> filasConMasCeros matrix                           
3
ghci> matrix = [[1,2,3,0,6],[5,0,1,0,7],[0,0,0,0,0],[5,0,0,0,0],[4,0,2,0,0]] 
ghci> matrix                                                                
[[1,2,3,0,6],[5,0,1,0,7],[0,0,0,0,0],[5,0,0,0,0],[4,0,2,0,0]]
ghci> filasConMasCeros matrix                                               
2
ghci> matrix = []            
ghci> filasConMasCeros matrix
*** Exception:  Violacion del requiere :Lista Vacia
CallStack (from HasCallStack):
  error, called at FuncionesListas.hs:565:23 in main:FuncionesListas
ghci> 
ghci> matrix = [[1,2,3,0,6,0]]                                              
ghci> matrix                  
[[1,2,3,0,6,0]]
ghci> filasConMasCeros matrix 
0
ghci> 
-}