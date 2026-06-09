lol = int(input("Ingresa el número: "))
print("Triangulo rectangulo")
for i in range(1, lol + 1):
    print("*" * i)

print("Triangulo equilatero")
for i in range(1, lol + 1):
    espacio = " " * (lol - i)
    asterisco = "*" * (2 * i - 1)
    print (espacio + asterisco)

print("Triangulo invertido")
for i in range (lol, 0, -1):
    espacio = " " * (lol - i)
    asterisco = "*" * ((2 * i) - 1)
    print (espacio + asterisco)

print("CUADRADO")
for i in range(lol):
    print("*" * lol)

for i in range(lol):
    if i==0 or i==lol - 1:
        print("*" * lol)
    else:
        print ("*" + " " * (lol - 2) + "*")

#ESTA ES PARA REALIZAR EL ROMBO LA MATEMÁTICA ES MÁS FÁCIL QUE EN PSEINT
for i in range(1, lol + 1):
    espacio = " " * (lol - i)
    asterisco = "*" * (2 * i - 1)
    print (espacio + asterisco)

for i in range (lol-1, 0, -1):
    espacio = " " * (lol - i)
    asterisco = "*" * ((2 * i) - 1)
    print (espacio + asterisco)