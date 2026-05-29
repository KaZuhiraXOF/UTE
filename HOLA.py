
def suma(a,b):
    c = a + b
    print("El resultado de la suma es de: ", c, "...")
    if c > 100:
        print ("Puede que ganes mucha plata.....")
    elif c < 10:
        print ("Seguro sumaste tus notas del colegio...")

def resta(a,b):
    c = a - b
    print("El resultado de la resta es de: ", c, "...")

def multi(a,b):
    c = a * b
    print("El resultado de la multiplicacion es de: ", c, "...")

def division(a,b):
    c = a / b
    print("El resultado de la division es de: ", c, "...")

def potencia(a,b):
    c=1

    print ("Para aclarar, el primer numero ingresado será la base y el segundo el exponente")
    if b==0:
        print ("La potencia es de: ",c)
    elif b<0:
        a = 1/a
        b = -b

    for _ in range(b):
        c*=a

    print("El resultado de la potencia es de: ", c, "...")

print("|===================================|")
print("|======= CALCULADORA BÁSICA ========|")
print("|===================================|")
print(" 1. SUMA                             ")
print(" 1. RESTA                            ")
print(" 3. MULTIPLICACIÓN                   ")
print(" 4. DIVISIÓN                         ")
print(" 5. POTENCIA                         ")
print("|===================================|")

opMenu = input("Selecciona la operación a realizar: ")

x= int(input("Ingresa el primer número: "))
y= int(input("Ingresa un segundo número: "))

match opMenu:
    case "1":
        suma(x,y)
    case "2":
        resta(x,y)
    case "3":
        multi(x,y)
    case "4":
        division(x,y)
    case "5":
        potencia(x,y)

print("|   F I N  D E L  P R O G R A M A   |")
print("|===================================|")




