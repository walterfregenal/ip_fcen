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

todosLosTest = test [ testSuitecapicuaCh, testSuiteesCapicua , testSuiteordenarLista]
correrTest = runTestTT todosLosTest