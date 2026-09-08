--problema sumaRacionales (n : N,  : N) : R {
--requiere: { True}
--asegura: { resultado = suma i = 1 hasta n de la suma de 1 hasta m de i/j }
--}
sumaRacionales :: Integer -> Integer -> Float
sumaRacionales 0 _ = 0
sumaRacionales n m = sumaRacionalesAux n m  + sumaRacionales (n-1) m
--
sumaRacionalesAux :: Integer -> Integer -> Float
sumaRacionalesAux n 1 = fromIntegral n
sumaRacionalesAux n m = (fromIntegral n / fromIntegral m) + sumaRacionalesAux n (m-1)
--