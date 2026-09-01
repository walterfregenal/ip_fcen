module TestDeMisFunciones where

import Test.HUnit
import MisFunciones

-- Casos de Test

runFibo = runTestTT testsFibo

testsFibo = test [
    " Casobase 1 : fib 0" ~: (fib 0) ~?= 0 ,
    " Casobase 2 : fib 1" ~: (fib 1) ~?= 1 ,
    " Casorecursivo 1 : fib 2 " ~: (fib 2) ~?= 1
    ]

