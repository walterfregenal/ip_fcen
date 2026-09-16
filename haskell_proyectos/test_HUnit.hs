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

todosLosTest = test [ testSuitecapicuaCh, testSuiteesCapicua , testSuiteordenarLista ]
correrTest = runTestTT todosLosTest