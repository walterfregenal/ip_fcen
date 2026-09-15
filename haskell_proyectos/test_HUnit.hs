import Guia2
import Test.HUnit

testSuiteMayorNota = [
  "Caso base: lista vacia" ~: (mayorNota []) ~?= 0.0,
  "Caso 1: unico elemento" ~: (mayorNota [("Algebra", 8.0)]) ~?= 8.0
  ]

correrTest = runTestTT (TestList testSuiteMayorNota)