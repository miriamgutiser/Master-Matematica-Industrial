# -*- coding: utf-8 -*-
"""
Created on Mon May  5 17:56:32 2025

@author: Miriam
"""

#Módulo para la realización de cálculos sobre hipotecas - Resultados

#Capital h

from Hipoteca_funciones import cuota, total_pagado, intereses, intereses_porcentaje

print('---CÁLCULO DE HIPOTECA---')

h = -1 
while h <= 0:
    try:
        h = float(input('Introduce el capital de la hipoteca (euros): '))
        if h<=0:
            
            print('El capital debe ser un valor positivo.')
            
    except ValueError:
        
        print('El capital debe ser un valor númerico, introduce un número válido.')
        
#Número de años
n = 0 
while n <= 0:
    try:
        n = int(input('Introduce el número de años: '))
        if n<=0:
            
            print('El número de años debe ser un valor positivo.')
            
    except ValueError:
        
        print('El número de años debe ser un entero, introduce un número válido.')


#Interés anual
i = -1
while i < 0:
    try:
        i = float(input('Introduce el tipo de interés anual en porcentaje: '))
        if i <0:
            print('El interés debe ser un valor positivo')
            
    except ValueError:
        print('Introduce un valor válido para el interés')

m = cuota(h, n, i)
total = round(total_pagado(h, i, n))
interes = round(intereses(h, n, i))
porcentaje = intereses_porcentaje(h, n, i)

#Resultados
print('\n ---RESULTADOS---')
print('Cuota mensual: %.2f€' %m)
print('Total pagado:  %.3f€' %total)
print('Total intereses pagados al banco: %.3f€' %interes)
print('Porcentaje pagado en intereses: %.2f%%'%porcentaje)
