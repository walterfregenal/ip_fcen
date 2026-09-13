import FuncionesMatematicas
import FuncionesListas

--Renombre Alumno = String
--Renombre Materia = String
--Renombre Cursada = seq⟨Materia × R⟩
--Renombre CalificacionesDelDC = seq⟨Alumno × Cursada⟩
---
-- problema promedioDeAlumno (alumno: Alumno, calificaciones: CalificacionesDelDC ) : R
-- requiere : {|alumno|= m > 0 y no hay nombres duplicados}
-- asegura : {res = el promedio de las notas que obtuvo el alumno en cada materia cursada}
--}
-- Definición de tipos (en minúscula 'type')
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


