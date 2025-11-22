# -*- coding: utf-8 -*-
"""
Created on Sun May 11 21:04:31 2025

@author: Miriam
"""

import numpy as np
from scipy import stats

#Ejercicio 4

def opcion_vainilla_bs_div(S0, K, T, r, sigma, D0, option='call'):
    """
    Valora una opción vanilla europea (call o put) usando la fórmula de Black–Scholes.

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
    D0 : float
    Tasa de dividendos continuos anual.
    option : {'call', 'put'}
        Tipo de opción a valorar.

    Returns
    -------
    V0 : float
        Precio de la opción hoy (t=0) por fórmula analítica de Black–Scholes.
    """
    # Cálculo de los parámetros d1 y d2
    d1 = (np.log(S0 / K) + (r - D0 + 0.5 * sigma**2) * T) / (sigma * np.sqrt(T))
    d2 = (np.log(S0 / K) + (r - D0 - 0.5 * sigma**2) * T) / (sigma * np.sqrt(T))

    # Valor de call y put
    call = S0 * np.exp(-D0 * T) * stats.norm.cdf(d1, 0.0, 1.0) -\
     K * np.exp(-r * T) * stats.norm.cdf(d2, 0.0, 1.0)
    
    put  = K * np.exp(-r * T) * stats.norm.cdf(-d2, 0.0, 1.0) - S0 * \
       np.exp(-D0 * T) * stats.norm.cdf(-d1, 0.0, 1.0) 
     

    if option == 'call':
        return call
    elif option == 'put':
        return put
    else:
        raise ValueError("la opción debe ser 'call' o 'put'")
        
        
def opcion_vainilla_mc_div(S0, K, T, r, sigma, D0, option='call', I=100000, N=50):
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
    D0 : float
        Tasa de dividendos continuos anual.
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
    int_izq, int_der: float, float
        Límites interior y superior del intervalo de confianza al 95%
    """
    dt = T / N
    S = np.zeros([N+1, I])
    S[0] = S0
    for t in range(1, N+1):
        z = np.random.standard_normal(I)  # z(i) ~ N(0,1) 
        S[t] = S[t-1] * np.exp((r - D0 - sigma**2 / 2) * dt
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
    
    #Intervalo de confianza
    std = np.sqrt(sum(np.exp(-r * T) * hT -V0)**2 / I)
    int_izq = V0 - 1.96 * std / np.sqrt(I)
    int_der = V0 + 1.96 * std / np.sqrt(I)
    
    return V0, int_izq, int_der


T = 3 / 12
K = 15.00
S0 = 17.00
r = 0.03
sigma = 0.25
D0 = 0.015

# Cálculo de precios y IC
bs_call = opcion_vainilla_bs_div(S0, K, T, r, sigma, D0, option='call')
bs_put  = opcion_vainilla_bs_div(S0, K, T, r, sigma, D0, option='put')
mc_call, izq_call, der_call = opcion_vainilla_mc_div(S0, K, T, r, sigma, D0, option='call')
mc_put,  izq_put,  der_put  = opcion_vainilla_mc_div(S0, K, T, r, sigma, D0, option='put')

print('---Valoración de una opción vainilla de compra con dividendos continuos---\n')

# Monte Carlo
print('El precio de la opción por el Método de Monte Carlo es %f' % mc_call)
print('Intervalo de confianza al 95%%: (%f, %f)\n' % (izq_call, der_call))

# Black–Scholes
print('El precio de la opción por la fórmula analítica de B–S es %f' % bs_call)
print('------------------------------------------------------------------\n')

print('---Valoración de una opción vainilla de venta con dividendos continuos---\n')

# Monte Carlo
print('El precio de la opción por el Método de Monte Carlo es %f' % mc_put)
print('Intervalo de confianza al 95%%: (%f, %f)\n' % (izq_put, der_put))

# Black–Scholes
print('El precio de la opción por la fórmula analítica de B–S es %f' % bs_put)




