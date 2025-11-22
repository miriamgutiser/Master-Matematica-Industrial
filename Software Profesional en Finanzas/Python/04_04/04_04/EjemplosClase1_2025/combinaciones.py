#import math
from factorial2025 import fact as ft
N=-1 #N=None
k=-1 #N=None
while (type(N)!=int or N<=0):
    N=int(input('Introduce N ' ))
while (type(k)!=int or k<=0):
    k=int(input('Introduce k ' ))
if(N>=k):
    combinaciones=ft(N)/(ft(k)*ft(N-k))#math.comb(10,2)
    print('El número de combinaciones de %i elementos tomados de %i en %i es: %i'\
          %(N,k,k,combinaciones))
else:
    print(0) 