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

def imprimir_un_verso(texto: str):
    cadena = ""
    for letra in texto:
        if letra != '\n':
            cadena += letra
        else:
            print (cadena)
            cadena = ""
    print (cadena)

imprimir_un_verso(parrafo)



        
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
def imprimir_saludo(nombre:str):
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
def imprimir_dos_veces(estribillo:str):
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
import math

def cantidad_de_pizzas(comensales: int, min_cant_de_porciones: int) -> int:
    comensales_por_pizza = 8 / min_cant_de_porciones
    cantidad_necesaria = comensales / comensales_por_pizza 
    return math.ceil(cantidad_necesaria)
"""
============
Ejercicio 3.
============
 Resuelva los siguientes ejercicios utilizando los operadores lógicos and, or, not. 
 Resolverlos sin utilizar alternativa condicional (if).
1. alguno_es_0(numero1, numero2): dados dos números racionales, decide si alguno de los dos es igual a 0.
"""
def alguno_es_0(numero1, numero2):
    return (numero1==0 or numero2==0)

"""
2. ambos_son_0(numero1, numero2): dados dos números racionales, decide si ambos son iguales a 0.
"""
def ambos_son_0 (numero1,numero2):
    return (numero1==0 and numero2 ==0)
"""
3. problema es_nombre_largo (in nombre: String) : Bool {
requiere: { True }
asegura: {(res = true) ↔ (3 ≤ |nombre| ≤ 8)}
}
"""
def es_nombre_largo(nombre: str)->bool:
    return  3 <= len(nombre) <= 8

"""

4. es_bisiesto(año): que indica si un año tiene 366 días. Recordar que un año es bisiesto si es múltiplo de 400, o bien
es múltiplo de 4 pero no de 100
"""
def es_bisiesto(anio : int)->bool:
        return ((anio % 400 == 0) or (anio % 4 == 0 and  anio % 100 !=0))
    
    
"""
=============
Ejercicio 4. 
=============

Vamos a programar en Python usando composición de funciones (como en funcional). Resolver este ejercicio
usando las funciones de python min y max:

En una plantación de pinos, de cada árbol se conoce la altura expresada en metros. 
El peso de un pino se puede estimar a partir de la altura de la siguiente manera:

3 kg por cada centímetro hasta 3 metros,
2 kg por cada centímetro arriba de los 3 metros.

Por ejemplo:
2 metros pesan 600 kg, porque 200 * 3 = 600
5 metros pesan 1300 kg, porque los primeros 3 metros pesan 900 kg y los siguientes 2 pesan los 400 restantes.

Los pinos se usan para llevarlos a una fábrica de muebles, a la que le sirven árboles de entre 400 y 1000 kilos, un pino
fuera de este rango no le sirve a la fábrica.

Definir las siguientes funciones, deducir qué parámetros tendrán a partir del enunciado. 
Se pueden usar funciones auxiliares si fuese necesario para aumentar la legibilidad.

1. Definir la función peso_pino
2. Definir la función es_peso_util, recibe un peso en kg y responde si un pino de ese peso le sirve a la fábrica.
3. Definir la función sirve_pino, recibe la altura de un pino y responde si un pino de ese peso le sirve a la fábrica.
4. Definir sirve_pino usando composición de funciones.
"""
def peso_pino(altura:float)->float:
    altura_cm = altura *100
    limite = 300
    return ( 3 * min(altura_cm,limite) + 2 * max(0,altura_cm-300))

def es_peso_util(peso:float)->bool:
    limite_inf = 400
    limite_sup = 1000
    return  limite_inf <= peso <= limite_sup

def sirve_pino(altura: float) -> bool:
    return (es_peso_util(peso_pino(altura))) 

"""
============
Ejercicio 5. 
============
Implementar los siguientes problemas de alternativa condicional (if/else). 
Los enunciados pueden no ser del todo claros, especificar los problemas en nuestro lenguaje de especificación y
 programar en base a tu propuesta de especificación.

1. doble_si_es_par(numero); que devuelve el doble del número en caso de ser par y el mismo número en caso contrario.

2. devolver_valor_si_es_par_si_no_el_que_sigue(numero): devuelve el mismo número si es par, y si no, el siguiente.
Analizar distintas formas de implementación (usando un if-then-else y dos if). ¿Todas funcionan?

3. doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero): en otro caso, devolver el número original. 
Analizar distintas formas de implementación (usando un if-then-else, dos if, o alguna opción de operación lógica).
Todas funcionan? Cuál es el resultado si la entrada es 18?

4. lindo_nombre(nombre) que dado un nombre, si la longitud es igual o mayor a 5 devolver una frase que diga "Tu
nombre tiene muchas letras!" y si no, "Tu nombre tiene menos de 5 caracteres".

5. elRango(numero) que imprime por pantalla "Menor a 5" si el número es menor a 5, "Entre 10 y 20" si el número está
en ese rango y "Mayor a 20" si el número es mayor a 20.

6. En Argentina una persona del sexo femenino se jubila a los 60 años, mientras que aquellas del sexo masculino
 se jubilan a los 65 años. 
 Quienes son menores de 18 años se deben ir de vacaciones junto al grupo que se jubila.
 Al resto de las personas se les ordena ir a trabajar. 
 Implemente una función que, dados los parámetros de sexo (F o M) y edad, imprima la frase que corresponda
   según el caso: "Andá de vacaciones" o "Te toca trabajar".
"""