# -*- coding: utf-8 -*-
"""
Created on Fri Apr  4 16:10:29 2025

@author: Miriam
"""

from factorial import fact

"""Hecho por mi """

def comb(N, k):
    if not (0 <= k <= N):
        return 0
    if k == 0 or N == k:
        return 1
    if k == 1:
        return N
    return fact(N) // (fact(k) * fact(N - k))

N = int(input('Introduce N: '))
k = int(input('Introduce k: '))
combinacion = comb(N ,k)
print(combinacion)

"""Hecho por ella """
N = -1
k = -1
while(type(N) != int or N<=0):
    N = int(input('Introduce N: '))
while(type(k) != int or k<=0):
    k = int(input('Introduce k: '))

if (N >= k):
    combinaciones = fact(N) / (fact(k)*fact(N-k))
    print('El número de combinaciones de %i elementos tomados de %i en %i es: %i'
          % (N, k, k, combinaciones))
else:
    print(0)
