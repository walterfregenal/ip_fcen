"""
Ejercicio 1. Dfinir las siguientes funciones y procedimientos:
1. problema imprimir_hola_mundo () {
requiere: { True }
asegura: { imprime "Hola mundo!"por consola}
}
"""
def imprimir_hola_mundo ():
    print("\"Hola mundo!\"")

"""
2. imprimir_un_verso(): que imprima un verso de una canción que vos elijas, respetando los saltos de línea mediante
el caracter \n.
"""
parrafo="""We're flying high
We're watching the world pass us by
Never want to come down
Never want to put my feet back down on the ground
We're flying high
We're watching the world pass us by
Never want to come down
Never want to put my feet back down on the ground"""

def imprimir_un_verso():
    linea = []
    for texto in parrafo:
        if texto != "\n":
            linea.append(texto)
            continue
        print ("".join(linea))
        del linea [:]
    else:
        print("".join(linea))

        
"""
3. raizDe2(): que devuelva la raíz cuadrada de 2 con 4 decimales. Ver función round
"""
def raizDe2():
    return (round(2**(1/2),4))

"""
4. factorial_de_dos()
problema factorial_2 () : Z {
requiere: { T rue }
asegura: {res = 2!}
}
"""
def factorialNum(numero:int)->int:
    if numero == 0 or numero == 1:
        return (1)
    else:
        return numero * factorialNum (numero-1)
def factorial_de_dos():
    return (factorialNum(2))

"""

5. perimetro: que devuelva el perímetro de la circunferencia de radio 1. Utilizar la biblioteca math mediante el comando
import math y la constante math.pi
problema perimetro () : R {
requiere: { T rue }
asegura: {res = 2 x π }
}
"""
from math import pi
def perimetro()->float:
    radio = 1
    return (2*pi*radio)
