import Guia2
import PruebaFunciones
import Test.HUnit

testSuiteMayorNota = [
  "Caso base: lista vacia" ~: (mayorNota []) ~?= 0.0,
  "Caso 1: unico elemento" ~: (mayorNota [("Algebra", 8.0)]) ~?= 8.0
  ]

testSuiteordenarLista = [
  "Caso base : lista vacia" ~:(ordenarLista []) ~?= [],
  "Caso 1: unico elemento" ~:(ordenarLista [1]) ~?= [1],
  "Caso 2: lista decreciente" ~:(ordenarLista [6,5,4,3,(-1)]) ~?= [(-1),3,4,5,6] 
  ]

testSuiteesCapicuaN
correrTest = runTestTT (TestList testSuiteordenarLista)