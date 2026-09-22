module Funciones_ejercicios_parcial_a where
{-
--------------------------
Ejercio 1 con Listas
--------------------------
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
------------------------
Ejercico 2 : Suma cuadrados pares hasta n incluisive
-----------------------
problema sumaCuadradosPares (n : Z) : Z {
requiere :{ n > 0}
asegura  :{Res = sumatoria ,desde i = 1 hasta i = n,  i^2  para los i que sean pares  }
}
-}

sumaCuadradosPares :: Integer -> Integer
sumaCuadradosPares 0 = 0
sumaCuadradosPares 1 = 0
sumaCuadradosPares n
    | mod n 2 == 0 = n^2 + sumaCuadradosPares (n - 2)
    | otherwise    = sumaCuadradosPares (n - 1)

-- problema factorial (n: Z) : Z {
-- requiere: { n ≥ 0 }
-- asegura: {res = 1 si n=0, n * productoria de i ,con i desde n-1 hasta 1, si n>0}
--}