
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