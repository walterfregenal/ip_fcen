import FuncionesListas
import FuncionesMatematicas
import Test.HUnit


testSuiteordenarLista = [
  "Caso base : lista vacia" ~:(ordenarLista []) ~?= [],
  "Caso 1: unico elemento" ~:(ordenarLista [1]) ~?= [1],
  "Caso 2: lista decreciente" ~:(ordenarLista [6,5,4,3,(-1)]) ~?= [(-1),3,4,5,6] 
  ]


testSuiteesCapicua = [
  "Caso base : cero" ~:(esCapicua 0) ~?= True,
  "Caso 1 : numero tres cifras no capicua " ~:(esCapicua 123) ~?= False,
  "Caso 2 : numero cuatro cifras  capicua " ~:(esCapicua 4114) ~?= True
  ]


testSuitecapicuaCh = [
  "Caso base: un elemento" ~:(capicuaCh "x") ~?= True,
  "Caso 1: string no capicua " ~:(capicuaCh "osa") ~?= False,
  "Caso 2: string capicua " ~:(capicuaCh "pepeepep") ~?= True
  ]

testSuiteabuntantesenRango :: Test
testSuiteabuntantesenRango = test [
  -- Categoría: Caso borde (mínimo valor permitido por el requiere: d = 1, h = 1)
  "caso_base_unitario" ~: cantidadAbundantesEnRango 1 1 ~?= 0,
  -- Categoría: Rango sin números abundantes (del 1 al 6)
  "rango_sin_abundantes" ~: cantidadAbundantesEnRango  1 6 ~?= 0,
  -- Categoría: Rango con presencia de números abundantes  [12..24])
  "rango_con_abundante"  ~: cantidadAbundantesEnRango  12 24 ~?= 4
  ]

testlistaMateriascursadasVencidas :: Test
lista0 = [("Analisis 1",2021,2)]
lista1 = [("Algebra A",2021,1)]
lista2 = [("Algoritmos y Estructuras de Datos I", 2020, 2), ("Algoritmos y Estructuras de Datos II", 2022, 1)]
lista5 = [("Algebra A",2021,1),("Fisica A",2020,2),("Analisis 1",2021,2),("Qumica Gral",2022,1),("Sociedades",1998,2)]

testlistaMateriascursadasVencidas = test [
  -- Categoría: Caso un elemento y res [] 
  "caso_base_unitario" ~: listaMateriascursadasVencidas lista0 ~?= [],
  -- Categoría: Caso un elemrnto y res con un elemento
  "caso_unitario" ~: listaMateriascursadasVencidas lista1 ~?= ["Algebra A"],
  -- Categoría: Caso un elemrnto y res con un elemento
  "caso_dos_elementos" ~: listaMateriascursadasVencidas lista2 ~?= ["Algoritmos y Estructuras de Datos I"],
  -- Categoría: Caso un elemrnto y res con un elemento
  "caso_cinco_elementos" ~: listaMateriascursadasVencidas lista5 ~?= ["Sociedades","Fisica A","Algebra A"]
  ]


--  ejemplo : f3 [3,8,5,0,7,-2,4] 5 debe devolver [3,5,5,0,5]
---
testSuitetomarHastaNegativoContope :: Test
listaZ0 = []
listaZ = [3,8,5,0,7,-2,4] 
listaZneg = [-2,4] 
testSuitetomarHastaNegativoContope = test [
  -- Categoría: con lista de numeros enteros y un negativo
  "caso_base" ~: tomarHastaNegativoContope listaZ0 5 ~?= [],
  -- Categoría: con lista de numeros enteros y un negativo
  "caso_7" ~: tomarHastaNegativoContope listaZ 5 ~?= [3,5,5,0,5],
  -- Catgoría: con lista de numeros enteros y un negativo
  "caso_2" ~: tomarHastaNegativoContope listaZneg 3 ~?= []
  ]

--Ejemplo: f4 [[-9,8,2,3],[2,7,-5,3],[-1,0,5,6]] 2 debe devolver 2
--
testSuitematrizCantParesColumna :: Test
listaMatrix =  [[-9,8,2,3],[2,7,-5,3],[-1,0,5,6]]
testSuitematrizCantParesColumna = test [
  -- Categoría: con lista de numeros enteros y un negativo
  "caso_base" ~: matrizCantParesColumna listaMatrix 2 ~?= 2
  ]


testSuiteAgrupoSeriesporTemporada :: Test
listaprueba = [ ("Breaking Bad", 5) , ("Game of Thrones", 8),  ("Better Call Saul", 6) , ("Succession", 4) , ("The Office US", 9) , ("Stranger Things", 5) , ("Mad Men", 7) , ("Bojack Horseman", 6) , ("Modern Family", 11),("The Crown", 6)]
testSuiteAgrupoSeriesporTemporada = test [
  -- Categoria con lista de prueba
  "Caso_base" ~: agrupoSeriesPorTemporada [] ~?= [],
  "Caso_prueba" ~: agrupoSeriesPorTemporada listaprueba ~?= [(6,["The Crown","Bojack Horseman","Better Call Saul"]),(11,["Modern Family"]),(7,["Mad Men"]),(5,["Stranger Things","Breaking Bad"]),(9,["The Office US"]),(4,["Succession"]),(8,["Game of Thrones"])]
  ]

testSuiteOrdenolistTup :: Test
lista_tup = [(6,["The Crown","Bojack Horseman","Better Call Saul"]),(11,["Modern Family"]),(7,["Mad Men"]),(5,["Stranger Things","Breaking Bad"]),(9,["The Office US"]),(4,["Succession"]),(8,["Game of Thrones"])]
testSuiteOrdenolistTup = test [
  "Caso_base" ~: ordenoListaTup [] ~?= [],
  "Caso_prueba" ~: ordenoListaTup lista_tup ~?= [(4,["Succession"]),(5,["Stranger Things","Breaking Bad"]),(6,["The Crown","Bojack Horseman","Better Call Saul"]),(7,["Mad Men"]),(8,["Game of Thrones"]),(9,["The Office US"]),(11,["Modern Family"])]
  ]


testSuitesumoCuadrados :: Test
testSuitesumoCuadrados = test [
    "Categoría 1: El borde inferior n igual a 1 (minimo valido)" ~: sumaCuadradosPares 1 ~?= 0,
    "Categoría 2: Números pares (n > 1)"    ~: sumaCuadradosPares 2 ~?= 4,
    "Categoria 2 : n igual a 4 (par compuesto)" ~: sumaCuadradosPares 4 ~?= 20,
    "Categoría 3: Números impares (n > 1) n igual a 3 (impar)"  ~: sumaCuadradosPares 3 ~?= 4,
    "Categoria 3: n igual a 5 (impar mayor)"   ~: sumaCuadradosPares 5 ~?= 20
  ]



testSuiteSumaDigitos :: Test
testSuiteSumaDigitos = test [
    -- Categoría 1: El borde inferior
    "Categoria 1: n igual a 0 (borde minimo)"             ~: sumaDigitosEnPosicionesPares 0 ~?= 0,

    -- Categoría 2: Números de una sola cifra
    "Categoria 2: n igual a 3 (una cifra, posicion par)"   ~: sumaDigitosEnPosicionesPares 3 ~?= 3,
    "Categoria 2: n igual a 9 (una cifra impar)"           ~: sumaDigitosEnPosicionesPares 9 ~?= 9,

    -- Categoría 3: Números de múltiples cifras (pares e impares en posiciones)
    "Categoria 3: n igual a 10 (dos cifras, digito par en pos 0)"  ~: sumaDigitosEnPosicionesPares 10 ~?= 0,
    "Categoria 3: n igual a 101 (tres cifras, suma posiciones)"     ~: sumaDigitosEnPosicionesPares 101 ~?= 2,
    "Categoria 3: n igual a 987654321 (numero largo complejo)"      ~: sumaDigitosEnPosicionesPares 987654321 ~?= 25
  ]



testodosLosTest = test [ testSuitecapicuaCh, testSuiteesCapicua , testSuiteordenarLista]
correrTest = runTestTT testodosLosTest