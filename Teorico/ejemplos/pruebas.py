x:list = [1,2,3]
print("id x:" + str(id(x)))
print("valor x:" + str(x))
y: list = []
y = y + x
print("id y:" + str(id(y)))
print("valor y:" + str(y))

y *= 2
print("DESPUES")
print("id x:" + str(id(x)))
print("valor x:" + str(x))
print("id y:" + str(id(y)))
print("valor y:" + str(y))
