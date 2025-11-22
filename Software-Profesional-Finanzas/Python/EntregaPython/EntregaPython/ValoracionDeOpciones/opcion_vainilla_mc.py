# -*- coding: utf-8 -*-
"""
Created on Sun May 11 19:51:45 2025

@author: Miriam
"""

import numpy as np
"""
Ejercicio 1:
Implementar el metodo de Monte Carlo en una función que permita valorar tanto 
opciones vainilla europeas de compra como de venta
"""

def opcion_vainilla_mc(S0, K, T, r, sigma, option='call', I=100000, N=50):
    """
    Valora una opción vanilla europea (call o put) por Monte Carlo.

    Parameters
    ----------
    S0 : float
        Precio inicial del activo subyacente.
    K : float
        Precio de ejercicio (strike).
    T : float
        Tiempo hasta el vencimiento (en años).
    r : float
        Tasa de interes libre de riesgo anual (constante).
    sigma : float
        Volatilidad anual del activo (constante).
    option : {'call', 'put'}
        Tipo de opción a valorar.
    I : int, opcional
        Número de trayectorias (simulaciones). Por defecto 100 000.
    N : int, opcional
        Número de pasos temporales en cada trayectoria. Por defecto 50.

    Returns
    -------
    V0 : float
        Precio estimado de la opción hoy (t=0) utilizando Monte Carlo.
    """
    dt = T / N
    S = np.zeros([N+1, I])
    S[0] = S0
    for t in range(1, N+1):
        z = np.random.standard_normal(I)  # z(i) ~ N(0,1) 
        S[t] = S[t-1] * np.exp((r - sigma**2 / 2) * dt
                               + sigma * np.sqrt(dt) * z)
    ST = S[-1]
    # Payoff en vencimiento
    if option == 'call':
        hT = np.maximum(ST - K, 0)
    elif option == 'put':
        hT = np.maximum(K - ST, 0)       
    else:
        raise ValueError("La opción debe ser 'call' o 'put'")
    # Descuento y promedio
    V0 = np.exp(-r * T) * np.sum(hT) / I  
    return V0















