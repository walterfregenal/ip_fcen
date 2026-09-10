import FuncionesMatematicas
import FuncionesListas

---- Operaciones con Matrices 

--problema sumaTotal (m: seq⟨seq⟨Z⟩⟩) : Z {
--requiere: { |m| > 0 }
--requiere: { |m[0]| > 0 }
--requiere: { Todos los elementos de la secuencia m tienen la misma longitud }
--asegura: { res = sumatoria de i=0 a |m|-1 de sumatoria de j = 0 a |m[i]|-1 m[i] [j] }



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

