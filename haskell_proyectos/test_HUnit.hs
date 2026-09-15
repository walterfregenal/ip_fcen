import FuncionesMatematicas
import FuncionesListas


import Test.HUnit

-- Tu función a testear (pegada al margen)
dobleX :: Int -> Int
dobleX x = x * 2

-- Las pruebas unitarias (pegada al margen, sin espacios antes de 'testSuiteDobleX')
testSuiteDobleX = test [
    "casoCero"     ~: (dobleX 0) ~?= 0,
    "casoPositivo" ~: (dobleX 2) ~?= 4,
    "casoNegativo" ~: (dobleX (-2)) ~?= (-4)
  ]

-- Corre todas las pruebas (pegada al margen)
correrTest = runTestTT testSuiteDobleX
