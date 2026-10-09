import math

def imprimir_hola_mundo():
    print("Hola mundo")

#imprimir_hola_mundo()

#resultado: float = math.sqrt(18)
#print(resultado)

def perimetro()->float:
    res: float = math.pi * 2
    return res

#print(perimetro())

def es_multiplo_de(n:int, m:int)->bool:
    res: bool = n % m == 0
    return res

#print(es_multiplo_de(5,2))

def es_nombre_largo(nombre: str)->bool:
    #res: bool = 3 <= len(nombre) <= 8
    #res: bool = 3 <= len(nombre) and 8 >= len(nombre)
    cond1: bool = 3 <= len(nombre)
    cond2: bool = 8 >= len(nombre)
    res: bool = cond1 and cond2
    return res

def devolver_el_doble_si_es_par(un_numero:int)->int:
    if un_numero % 2 == 0:
        res: int = un_numero*2
    else:
        res: int = un_numero
    return res

def imprimir_pares_10_40()->None:
    num: int = 10
    while num <= 40:
        if num % 2 == 0:
            print(num)
        else:
            pass
        num = num + 1

def imprimir_pares_10_40_v2()->None:
    num: int = 10
    while num <= 40:
        print(num)
        num = num + 2
    return None

#imprimir_pares_10_40()

def imprimir_pares_10_40_range()->None:
    for num in range(10,42,2):
        print(num)
    return None

def imprimir_pares_10_40_range_v2()->None:
    for num in range(10,41,1):
        if num % 2 == 0:
            print(num)
        else:
            pass
    return None