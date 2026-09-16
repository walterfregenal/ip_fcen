module PruebaFunciones where

-- Recibimos el listado de tuplas (película, anio), 
--y queremos devolver un listado de películas agrupadas por año
-- (es decir, en una tupla de la forma (Año, [Título])).

listaPorAnio :: [(String, Integer)] -> [(Integer, [String])]
listaPorAnio [] = []
listaPorAnio ((pelicula, anio):xs) = agregarPelicula pelicula anio (listaPorAnio xs)


