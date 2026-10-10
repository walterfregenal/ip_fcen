from Guia7_modelo import pertenece_a_cada_uno_version1, pertenece_a_cada_uno_version2, pertenece_a_cada_uno_version3

a : list[list[int]]= [4,5,6,7,8,9,5,6,7,4], [7,8,7,8,9,7,6,9,8,9], [4,4,8,4,3,5,4,7,4,1] ,[], [-1,4,-4,4,3,5,-3,-1,4,-9]
e : int = int(input("Ingrese el numero a verificar si pertenece en la matriz: "))
res: list[bool]= []
pertenece_a_cada_uno_version2(a, e, res)
print(f"El numero {e} pertenece a cada lista de la matriz: {res}")
print(f"El numero {e} pertenece a cada lista de la matriz: {pertenece_a_cada_uno_version3(a, e)}")