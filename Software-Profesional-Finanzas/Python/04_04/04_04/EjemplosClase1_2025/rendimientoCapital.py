

C=float(input("Introduce el capital: "))
x=float(input("Introduce la tasa de interés: "))
n=float(input("Introduce el número de años: "))

rendimiento=C*(1+x/100)**n
print("Una cantidad de "+str(C)+"€ al "+str(x)+'%'+" de interés anual"+ 
     " se convierte en %.3f€ al cabo de %d años" %(rendimiento,n))