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
Definir las siguientes funciones y procedimientos con parámetros:
1. problema imprimir_saludo (in nombre: String) {
requiere: { True }
asegura: {imprime "Hola < nombre >"por pantalla}
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
tiene 8 porciones y que se prefiere que sobren porciones.

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

problema doble_si_es_par(in numero: Z):Z{
    requiere :{True}
    asegura:{res = 2*numero si numero es par, numero en caso contrario}
}
"""
def doble_si_es_par(numero:int)->int:
    if numero % 2 == 0:
        return (numero * 2)
    else:
        return numero
    
"""

2. devolver_valor_si_es_par_si_no_el_que_sigue(numero): devuelve el mismo número si es par, y si no, el siguiente.
Analizar distintas formas de implementación (usando un if-then-else y dos if). ¿Todas funcionan?

problema devolver_valor_si_es_par_si_no_el_que_sigue(in numero: Z): Z {
    requiere: {True}
    asegura: {res = numero si es par, el numero+1 en caso contrario}
}
"""
def devolver_valor_si_es_par_si_no_el_que_sigue(numero: int)->int:
    if numero % 2 == 0:
        return numero
    else:
        return (numero + 1)

def devolver_valor_si_es_par_si_no_el_que_sigue2(numero: int)->int:
    if numero % 2 == 0:
        return numero
    if numero % 2 != 0:
        return (numero + 1)

"""
3. doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero): en otro caso, devolver el número original. 
Analizar distintas formas de implementación (usando un if-then-else, dos if, o alguna opción de operación lógica).
Todas funcionan? Cuál es el resultado si la entrada es 18?

problema doble_si_es_multiplo3_el_triple_si_es_multiplo9(in numero: Z): Z {
    requiere: {True}
    asegura: { res = numero * 3 si numero mod 9 = 0, o(L) res = numero * 2 si numero mod 3 = 0, o(L) res = numero en caso contrario }
}
"""
def doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero: int) -> int:
    if numero % 9 == 0:
        return (numero * 3)
    elif numero % 3 == 0:
        return (numero * 2)
    else:
        return (numero)

"""

4. lindo_nombre(nombre) que dado un nombre, si la longitud es igual o mayor a 5 devolver una frase que diga "Tu
nombre tiene muchas letras!" y si no, "Tu nombre tiene menos de 5 caracteres".

problema lindo_nombre(in nombre: seq<Char>): seq<Char>{
    requiere: {nombre[i] pertenece a Char  donde 0<=i<|nombre|}
    requiere: {|nombre|> 0}
    asegura: {res = "Tu nombre tiene muchas letras!", si |nombre|>= 5 , si no res = "Tu nombre tiene menos de 5 caracteres" }
}

"""
def lindo_nombre(nombre: str)-> str:
    if len(nombre) >= 5:
        return ("Tu nombre tiene muchas letras!")
    else:
        return ("Tu nombre tiene menos de 5 caracteres")

"""
5. elRango(numero) que imprime por pantalla "Menor a 5" si el número es menor a 5, "Entre 10 y 20" si el número está
en ese rango y "Mayor a 20" si el número es mayor a 20.

problema elRango(in numero: Z): None {
    requiere: {True}
    asegura: {stdout = "Menor a 5\n", si numero < 5, si no stdout = "Entre 10 y 20\n", si 10 < numero < 20, si no stdout = "Mayor a 20\n" si numero > 20}
}
"""
def elRango(numero: int) -> None:
    if numero < 5:
        print("Menor a 5")
    elif 10 < numero < 20:
        print("Entre 10 y 20")
    elif numero > 20:
        print("Mayor a 20")
    else:
        None

"""

6. En Argentina una persona del sexo femenino se jubila a los 60 años, mientras que aquellas del sexo masculino
 se jubilan a los 65 años. 
 Quienes son menores de 18 años se deben ir de vacaciones junto al grupo que se jubila.
 Al resto de las personas se les ordena ir a trabajar. 
 Implemente una función que, dados los parámetros de sexo (F o M) y edad, imprima la frase que corresponda
   según el caso: "Andá de vacaciones" o "Te toca trabajar".

problema te_vas_de_vacaciones_o_a_trabajar(in sexo: Char, in edad: Z): None {
    requiere: { sexo = "M" o "F"}
    requiere: { 0 < edad < 110}
    asegura: { stdout = "Andá de vacaciones\n", si  edad < 18 o sexo = F y edad > 60, o sexo = M y edad > 65, sino stdout ="Te toca trabajar\n" en caso contrario }
}

"""   
def te_vas_de_vacaciones_o_a_trabajar(sexo: str, edad: int) -> None:
    if edad < 18 or (sexo == 'F' and edad >= 60) or (sexo == 'M' and edad >= 65):
        print("Andá de vacaciones")
    else:
        print("Te toca trabajar")
   

"""
============
Ejercicio 6.
============ 

Implementar los siguientes procedimientos usando repetición condicional while:

1. Escribir un procedimiento que imprima los números del 1 al 10.
"""
def imprime_uno_a_diez()->None:
    contador = 1
    while contador <=10:
        print(f"{contador}")
        contador += 1
"""
2. Escribir un procedimiento que imprima los números pares entre el 10 y el 40.
"""
def imprime_pares_10a40() ->None:
    contador = 10
    while contador <= 40:
        print(f"{contador}")
        contador += 2

"""
3. Escribir un procedimiento que imprima la palabra "com" 10 veces.
"""
def imprime_com_10veces()->None:
    counter = 10
    while counter > 0:
        print("com")
        counter -= 1

"""
4. Escribir un procedimiento de cuenta regresiva para lanzar un cohete. Dicho procedimiento irá imprimiendo desde el
número que me pasan por parámetro (que será positivo) hasta el 1, y por último "Despegue".
"""
def cuenta_regresiva(numero: int)->None:
    while numero >= 1:
        print(f"{numero}")
        numero -= 1
    print("Despegue")
"""
5. Hacer un procedimiento que monitoree un viaje en el tiempo. Dicho procedimiento recibe dos parámetros, "el año de
partida" y "algún año de llegada", siendo este último parámetro siempre más chico que el primero. El viaje se realizará
de a saltos de un año y el procedimiento debe mostrar el texto: "Viajó un año al pasado, estamos en el año: <año>"
cada vez que se realice un salto de año.
"""
def viaje_en_el_tiempo(partida,llegada)->None:
    while partida > llegada:
        partida -= 1
        print(f"Viajó un año al pasado, estamos en el año: {partida}") 
"""
6. Implementar de nuevo el procedimiento de monitoreo de viaje en el tiempo, pero desde el año de partida hasta lo más
cercano al 384 a.C., donde conoceremos a Aristóteles. Y para que sea más rápido el viaje, ¡vamos a viajar de a 20 años
en cada salto!
"""

def viaje_rapido_en_el_tiempo(partida: int) -> None:
    while partida > -384:
        partida -= 20
        if partida > 0:
            print(f"Viajó 20 años al pasado, estamos en el año: {partida} d.c.")
        else:
            print(f"Viajó 20 años al pasado, estamos en el año: {abs(partida)} a.c.")
    print("Es el año más cercano a 384 a.C., ¡conoceremos a Aristóteles!")

"""
============
Ejercicio 7.
============ 
Implementar los procedimientos del ejercicio 6 utilizando for num in range(i,f,p):.
 Recordar que la función range para generar una secuencia de números en un rango dado, 
 con un valor inicial i, un valor final f y un paso p. 
 Ver documentación: https://docs.python.org/es/3/library/stdtypes.html#typesseq-range
"""
"""
1. Escribir un procedimiento que imprima los números del 1 al 10.
"""

def imprime_de_uno_a_diez() -> None:
    for i in range(1, 11):  # Empieza en 1 y termina en 10 (el 11 es exclusivo)
        print(f"{i}")
"""
2. Escribir un procedimiento que imprima los números pares entre el 10 y el 40.
"""
def numeros_pares_entre_10_y_40() ->None:
    for i in range(10,41,2):
        print(f"{i}")

"""
3. Escribir un procedimiento que imprima la palabra "com" 10 veces.
"""
def imprime_10_com()->None:
    for i in range(10):
        print("com")
"""
4. Escribir un procedimiento de cuenta regresiva para lanzar un cohete. 
Dicho procedimiento irá imprimiendo desde el número que me pasan por parámetro (que será positivo) hasta el 1,
y por último "Despegue".
"""
def cuenta_regresiva(numero: int) -> None:
    for i in range(numero, 0, -1):  # Paso negativo -1 para contar hacia atrás
        print(f"{i}")               # Imprimimos i, no el parámetro fijo
    print("Despegue")


"""
5. Hacer un procedimiento que monitoree un viaje en el tiempo. Dicho procedimiento recibe dos parámetros, "el año de
partida" y "algún año de llegada", siendo este último parámetro siempre más chico que el primero. El viaje se realizará
de a saltos de un año y el procedimiento debe mostrar el texto: "Viajó un año al pasado, estamos en el año: <año>"
cada vez que se realice un salto de año.
"""
def viaje_en_el_tiempo(partida: int, llegada: int) -> None:
    for i in range(partida, llegada, -1):  # Paso negativo -1 para ir al pasado
        print(f"Viajó un año al pasado, estamos en el año: {i - 1}")


"""
6. Implementar de nuevo el procedimiento de monitoreo de viaje en el tiempo, pero desde el año de partida hasta lo más
cercano al 384 a.C., donde conoceremos a Aristóteles. Y para que sea más rápido el viaje, ¡vamos a viajar de a 20 años
en cada salto!
"""
def nuevo_viaje_en_el_tiempo(partida: int) -> None:
    for i in range(partida, -384, -20):  # Paso negativo -20 para saltar hacia el pasado
        nuevo_anio = i - 20
        if nuevo_anio > 0:
            print(f"Viajó 20 años al pasado, estamos en el año: {nuevo_anio} d.c.")
        else:
            print(f"Viajó 20 años al pasado, estamos en el año: {abs(nuevo_anio)} a.c.")
    print("Conoceremos a Aristóteles")

"""
============
Ejercicio 8.
=============
 Realizar la ejecución simbólica de los siguientes códigos:

1. x=5 ; y=7; x = x + y
    Estado inicial: x = 5, y = 7
    Última línea (x = x + y): x toma el valor de 5 + 7, por lo tanto x = 12, y = 7.

2. x=5 ; y=7 ; z=x+y; y = z * 2
    Estado inicial:
    x = 5, y = 7
    z = x + y -> z = 5 + 7 -> z = 12
    y = z * 2 -> y = 12 * 2 -> y = 24 (el valor viejo de y que era 7 se pisa).
    Estado final: x = 5, y = 24, z = 12.

3. x=5 ; y=7 ; x="hora"; y = x * 2

4. x=False ; res=not(x)

5. x=False ; x=not(x)

6. x=True ; y=False ; res=x and y; x = res and x

"""
"""
============
Ejercicio 9.
============
 Sea el siguiente código:

def rt(x: int, g: int) -> int:
    g = g + 1
    return x + g
g: int = 0

def ro(x: int) -> int:
    global g
    g = g + 1
    return x + g

1. Cuál es el resultado de evaluar tres veces seguidas ro(1)?

    La función ro tiene la línea global g, lo que significa que modifica la variable g que está afuera (que arranca en 0).
    1ª llamada (ro(1)): g pasa de 0 a 1. Retorna 1 + 1 = 2. (Ahora g = 1).
    2ª llamada (ro(1)): g pasa de 1 a 2. Retorna 1 + 2 = 3. (Ahora g = 2).
    3ª llamada (ro(1)): g pasa de 2 a 3. Retorna 1 + 3 = 4. (Ahora g = 3).
    Resultado: Retorna 2, luego 3, y luego 4.

2. Cuál es el resultado de evaluar tres veces seguidas rt(1, 0)?

3. En cada función, realizar la ejecución simbólica.

4. Dar la especificación para cada función, rt y ro.

Especificación de rt:

    Requiere: x e g sean números enteros (int).
    Asegura: Retorna la suma de x más el parámetro g incrementado en 1, sin alterar el entorno global.

Especificación de ro:

    Requiere: x sea un número entero (int) y que exista una variable global g.
    Asegura: Incrementa en 1 la variable global g y retorna la suma de x más el nuevo valor de g.
"""
#