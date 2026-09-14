import FuncionesMatematicas
import FuncionesListas

-- ## Ejercicio Guia 2 que emplea Listas , funciones de Listas  y recursion ##
--Renombre Alumno = String
--Renombre Materia = String
--Renombre Cursada = seq⟨Materia × R⟩
--Renombre CalificacionesDelDC = seq⟨Alumno × Cursada⟩
---
-- problema promedioDeAlumno (alumno: Alumno, calificaciones: CalificacionesDelDC ) : R
-- requiere : {|alumno|= m > 0 y no hay nombres duplicados}
-- asegura : {res = el promedio de las notas que obtuvo el alumno en cada materia cursada}
--}
-- Definición de tipos 
type Alumno = [Char]
type Materia = [Char]
type Cursada = [(Materia, Float)]
type CalificacionesDelDC = [(Alumno, Cursada)]

-- Pal. Buscar al alumno y calcular el promedio de nota de las materias cursadas
promedioDelAlumno :: Alumno -> CalificacionesDelDC -> Float
promedioDelAlumno _ [] = 0 -- Si no encuentra al alumno en la lista de tuplas(alumno, cursada), devuelve 0
promedioDelAlumno alumno (x:xs)
    | alumno == fst x = promedioCursada (snd x) -- Se usan fst y snd en minúscula
    | otherwise       = promedioDelAlumno alumno xs
--
-- Aux. Calcular el promedio de una cursada específica
promedioCursada :: Cursada -> Float
promedioCursada [] = 0
promedioCursada cursada = sumaNotasMaterias cursada / fromIntegral (longitud cursada)
--
-- Aux. Sumar todas las notas de la cursada
sumaNotasMaterias :: Cursada -> Float
sumaNotasMaterias [] = 0
sumaNotasMaterias (x:xs) = snd x + sumaNotasMaterias xs
--
---
-- problema listaMayorCalificacion (alumno: Alumno, calificaciones: CalificacionesDelDC ) : seq<Materia> {
-- requiere : {|alumno|= m > 0 y no hay nombres duplicados}
-- asegura : {res = para el alumno la lista de materia con mayor calificacion}
--}
-- Definición de tipos 
--type Alumno = [Char]
--type Materia = [Char]
--type Cursada = [(Materia, Float)]
--type CalificacionesDelDC = [(Alumno, Cursada)]
---
listaMayorCalificacion :: Alumno -> CalificacionesDelDC -> [Materia]
listaMayorCalificacion  _ [] = [] -- caso base
listaMayorCalificacion alumno (x:xs)
    | alumno == fst x = listaMaterias (snd x) 
    | otherwise = listaMayorCalificacion alumno xs
-- Aux
listaMaterias :: Cursada -> [Materia]
listaMaterias [] = []
listaMaterias (x:xs) 
    | snd x == mayor = fst x : listaMaterias xs
    | otherwise = listaMaterias xs
    where mayor = mayorNota (x:xs)
-- Aux
mayorNota :: Cursada -> Float
mayorNota [] = 0.0  -- caso base
mayorNota [x] = snd x -- caso base : unico elemento
mayorNota (x:xs) 
    | snd x > mayorNota xs = snd x
    | otherwise = mayorNota xs
--
-- elemento de prueba : calificaciones = [("Walter F", [("Algebra", 8.0), ("Fisica", 7.0),("Quimica", 9.0),("Biologia", 9.0)]),("Nora M", [("Algebra", 9.0), ("Fisica", 10.0)])]