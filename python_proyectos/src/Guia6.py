"""
================
Ejercicio 1.
================

Definir las siguientes funciones y procedimientos:
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

"""
==============
Ejercicio 2. 
==============
Denir las siguientes funciones y procedimientos con parámetros:
1. problema imprimir_saludo (in nombre: String) {
requiere: { True }
asegura: {imprime Hola < nombre >"por pantalla}
}
"""
def imprimir_saludo(nombre:list[str]):
    print (f'"Hola {nombre}"')
"""
2. raiz_cuadrada_de(numero): que devuelva la raíz cuadrada del número.
"""
def raiz_cuadrada_de(numero):
    return (numero**(1/2))
"""
3. fahrenheit_a_celsius(temp_far): que convierta una temperatura en grados Fahrenheit a grados Celcius.
problema fahrenheit_a_celsius (in t: R) : R {
requiere: { True }
asegura: {res = ((t - 32) * 5)/9}
}
"""
def fahrenheit_a_celsius(t:float)->float:
    return(((t - 32) * 5)/9)

"""
4. imprimir_dos_veces(estribillo): que imprima dos veces el estribillo de una canción. Nota: Analizar el comportamiento
del operador (*) con strings.
"""
def imprimir_dos_veces(estribillo:list[str]):
    print (estribillo * 2)
"""
5. problema es_multiplo_de (in n: Z, in m:Z) : Bool {
requiere: {m ̸= 0}
asegura: {(res = true) ↔ (existe un k ∈ Z tal que n = m * k)}
}
"""
def es_multiplo_de(n,m:int)->bool:
    return (n % m == 0)
"""
6. es_par(numero): que indique si numero es par (usar la función es_multiplo_de()).
"""
def es_par(numero):
    return(es_multiplo_de(numero,2))
"""
7. cantidad_de_pizzas(comensales, min_cant_de_porciones) que devuelva la cantidad de pizzas que necesitamos
para que cada comensal coma como mínimo min_cant_de_porciones porciones de pizza. Considere que cada pizza
tiene 8 porciones y que se preere que sobren porciones.

"""
def enteroSuperior(numero)->int:
    complemento = 0
    if numero % 1 != 0:
        complemento = 1
    return ( int(numero + complemento))
def cantidad_de_pizzas(comensales, min_cant_de_porciones):
    comensales_por_pizza = 8 / min_cant_de_porciones
    cantidad_de_pizzas = comensales / comensales_por_pizza 
    return (enteroSuperior(cantidad_de_pizzas))
    
