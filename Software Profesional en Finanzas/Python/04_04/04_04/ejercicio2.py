# -*- coding: utf-8 -*-
"""
Created on Fri Apr  4 12:10:03 2025

@author: Miriam
"""

C = float(input('Introduzca la cantidad de euros: '))
x = float(input('Introduzca una tasa de interés: '))
n = int(input('Introduzca un número de años: '))

rendimiento = C*(1+x/100)**n

print('Una cantidad de '+str(C)+'€ al '+str(x)+'%'+'de interés anual'+
      'se convierte en %-3f€ al cabo de %d años'%(rendimiento,n))


    
