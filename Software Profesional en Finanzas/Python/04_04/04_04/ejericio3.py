# -*- coding: utf-8 -*-
"""
Created on Fri Apr  4 13:25:23 2025

@author: Miriam
"""
#Crea una lista que contenga los nombres de los días de la semana (lunes, martes, ...).
semana = ['lunes','martes','miercoles','jueves','viernes','sabado', 'domingo']

# Muestra por pantalla la longitud de la lista.
print(len(semana))

#Crea una sublista a partir de la anterior, conteniendo los 5 primeros días de la semana
laborales = semana[:5]
laborales = semana[:-2]
print(laborales)

# Cambia las dos últimas casillas de la lista (los días que son fin de semana) 
# por sus nombres con todas las letras en mayúscula
semana[-2] = semana[-2].upper()
semana[-1] = semana[-1].upper()
print(semana)

# Obtén una variable booleana que indique si el string ”Domingo”
#pertenece a la lista.
xa = 'Domingo' in semana
xb = 'domingo' in semana 
print(xa, xb)