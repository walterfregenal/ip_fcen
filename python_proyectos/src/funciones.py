
#================================================
# Funcion Ordenar 
# Ordena una lista de enteros en forma ascendente
#=================================================
def elmaximo(lista:list[int])->int:
    maximo = lista[0]
    for n in lista[1:]:
        if n > maximo:
            maximo = n
    return (maximo)

def quitotodos(lista:list[int], numero : int)->list[int]:
    salida = []
    for n in lista:
        if n !=numero:
            salida.append(n)
    return salida
    

def quitouno(lista:list[int], numero : int)->list[int]:
    salida = []
    encontrado = False
    for n in lista:
        if n == numero and not encontrado :
            encontrado = True
        else:
            salida.append(n)
    return salida
    
    
def ordenar (lista: list[int])->list[int]:
    if len(lista) == 0:
        return []
    else:
        max_val = elmaximo(lista)
        resto = quitouno(lista, max_val)
        return ordenar (resto) + [max_val]

# ===================================
# Funcion : Quito Repetidos
# ==================================
def quitorepetidos (lista: list[int])->list[int]:
    if len(lista) != 0:
        elemento = lista[0]
        resto = lista [1:]
        return [elemento] + quitorepetidos (quitotodos(resto, elemento))
    else:
        return []

#===============================================
# Funciones : imprimir_un_verso; linea por linea
#===============================================
def imprimir_un_verso(parrafo):
    linea = []
    for texto in parrafo:
        if texto != "\n":
            linea.append(texto)
            continue
        print ("".join(linea))
        del linea [:]
    else:
        print("".join(linea))       
#================================
# Funcion : Factorial
#================================

def factorialNum(numero:int)->int:
    if numero == 0 or numero == 1:
        return (1)
    else:
        return numero * factorialNum (numero-1)

#==========
# Funcion: 
# - es_Primo(numero)
# - cantidad_de_primos(m,n)
#=========

def es_primo(numero:int)->bool:
    res : bool = True
    divisor: int = 1
    contador: int = 0
    if numero < 2:
        res = False
    else:
        while divisor <= numero and res == True:
            if numero % divisor == 0:
                contador += 1
                if contador > 2:
                    res = False
            divisor += 1
    return res

def cantidad_de_primos(m: int, n: int) -> int:
    contador: int = 0
    for i in range (min(m,n), max(m,n)+1):
        if es_primo(i):
            contador += 1
    return contador
    