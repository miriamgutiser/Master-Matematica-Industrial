# -*- coding: utf-8 -*-
"""
Created on Fri Apr  4 15:32:16 2025

@author: Miriam
"""

menu = {1:'opción1', 2:'opción2', 3:'opción3'}
choice = int(input('Elija una opción 1,2,3: '))
print('Su elección es: ',menu[choice])

# Calcula la suma de los días de los meses de ese año anteriores a un mes dado.
mes = 0
diasmes = [31 ,28 ,31 ,30 ,31 ,30 ,31 ,31 ,30 ,31 ,30 ,31]

while mes not in range(1,13):
    mes = int(input('Introduce el mes:'))
    
#Opcion con for   
total = 0
for i in range(mes-1):
    total += diasmes[i]
    
print('La suma de los días es:' ,total)

#Opcion sin utilizar for
total = sum(diasmes[:mes-1])
print('La suma de los días es:' ,total)


