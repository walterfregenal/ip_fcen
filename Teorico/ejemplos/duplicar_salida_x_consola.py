def duplicar(valor: str, referencia: list):  
    valor *= 2
    print("Dentro de la función duplicar: str: " + valor + " id" + str(id(valor)))
    referencia *= 2
    print("Dentro de la función duplicar:  referencia: " + str(referencia) + " id" + str(id(referencia))) 


x: str = "abc"
y: list = ['a', 'b', 'c'] 
print("ANTES: ") 
print("x: " + x + " id" + str(id(x)))  
print("y: " + str(y) + " id" + str(id(y)))
duplicar(x, y)
print("DESPUES: ") 
print("x: "  + x + " id" + str(id(x)))
print("y: " + str(y) + " id" + str(id(y)))