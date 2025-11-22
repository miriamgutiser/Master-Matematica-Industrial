# -*- coding: utf-8 -*-
"""
Created on Fri Apr  4 15:50:18 2025

@author: Miriam
"""
def diff2nd(f,x, h = 1E-4):
    return (f(x-h) -2*f(x) +f(x+h)) / h**2

def f(x):
    return x**(-6)

# Implementar una función en Python que diga si un añoo es bisiesto o no.
def bisiesto(año):
    if (type(año) is int and año>0):
        if (año%4==0 and año%100 !=0 or año%400==0):
            print(año,'es año bisiesto')
        else:
            print(año, 'no es bisiesto')
    else:
        print('El tipo de dato introducido no es correcto')
