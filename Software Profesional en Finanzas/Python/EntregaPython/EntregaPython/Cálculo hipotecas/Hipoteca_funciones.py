# -*- coding: utf-8 -*-
"""
Created on Mon May  5 17:35:26 2025

@author: Miriam
"""

#Módulo para la realización de cálculos sobre hipotecas - Funciones

def cuota(h, n, i):
    """
    
    Calcula la cuota mensual de una hipoteca.
    h: capital inicial (euros)
    n: duración en años
    i: interés compuesto anual por cien
    
    """
    
    r = i / (100*12)
    m = (h * r) / (1 - (1+r) ** (-12 * n))
    return m

def total_pagado(h, i, n):
    """
    
    Devuelve la cantidad de euros que habremos pagado finalmente al banco
    """
    m = cuota(h,n,i)
    
    return m * 12 * n

def intereses(h, n, i):
    """
    
    Devuelve la cantidad de intereses (en euros) que habremos pagado finalmente 
    al banco

    """
    total = total_pagado(h, i, n)
    return total - h

def intereses_porcentaje(h, n, i):
    """
    Devuelve el tanto por cien del capital inicial que deberemos pagar en intereses
    al amortizar completamente la hipoteca

    """
    intereses_total = intereses(h, n, i)
    return (intereses_total / h)*100

