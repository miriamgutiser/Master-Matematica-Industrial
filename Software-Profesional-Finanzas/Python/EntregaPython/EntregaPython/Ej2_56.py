# -*- coding: utf-8 -*-
"""
Created on Fri Apr 25 16:12:48 2025

@author: Miriam
"""

import sys
import math

x = 1
s = 1
suma = 1
n = 1

while s > sys.float_info.epsilon:
    s = x**n / math.factorial(n)
    suma += s
    n += 1
    
#Resultados
val_real = math.exp(1);
error = abs(suma - val_real)
print()
print('Valor aproximado de e^1: %.17f' %suma) 
print('Error respecto valor real de e^1: %.17e' % error)   