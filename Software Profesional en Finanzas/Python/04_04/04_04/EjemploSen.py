# -*- coding: utf-8 -*-
"""
Created on Fri Apr  4 11:51:28 2025

@author: Miriam
"""

from math import sin
from sys import argv  #lista

"""
angle = float(input('Introduzca un ángulo:'))
x = sin(angle)
print('sen('+str(angle)+')='+str(x))
"""

#Ejecutar desde el script
angle = float(argv[1])
x = sin(angle)
print('sen('+str(angle)+')='+str(x))

print('sen(%f) = %12.5e' %(angle, x)) #12 caracteres con 5 cifras decimales 