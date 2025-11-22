# -*- coding: utf-8 -*-
"""
Created on Fri Apr 25 16:28:12 2025

@author: Miriam
"""

import math

def f(x):

    return x**3 + math.exp(-x) - 1.5


#Metodo de biseccion
def biseccion (a, b, f, tol = 1e-6, N = 40):
    """
    

    Parameters
    ----------
    a : float
        Izquierda del intervalo.
    b : float
        derecha del intervalo.
    f : funcion
        Funcion a busca ceros.
    tol : float, optional
        Tolerancia del método. The default is 1e-6.
    N : int, optional
        Nímero de iteraciones. The default is 40.

    Returns
    -------
    m : float
        Solución de la ecuación en el intervalo [a,b].

    """
    
    if f(a) * f(b) > 0:
        print()
        print('No se puede aplicar el algoritmo, no tiene solución en el intervalo dado')
        return None
    
    n = 1
    while n < N:
        m = (a + b)/2
        
        if abs(f(m)) < tol:
            print('\nSolución: x = %.10f' % m)
            return m
        
        if f(a)*f(m)<0:
            b = m
        else:
            a = m
            
        n += 1
     
    print("\nNo se alcanzó la tolerancia tras %d iteraciones." % N)
    print("Último valor de m: %.10f con f(m) = %.10e" % (m, f(m)))
    return m        
        
    
biseccion(-1, 1, f)

    
    