# -*- coding: utf-8 -*-
"""
Created on Sun May 11 20:27:58 2025

@author: Miriam
"""

import numpy as np
from scipy import stats

"""
Ejercicio 2:
Implementar la fórmula analítica de Black-Scholes en una función que me
permita valorar tanto opciones vainilla europeas de compra como de venta.
"""

def opcion_vainilla_bs(S0, K, T, r, sigma, option='call'):
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
    option : {'call', 'put'}
        Tipo de opción a valorar.

    Returns
    -------
    V0 : float
        Precio de la opción hoy (t=0) por fórmula analítica de Black–Scholes.
    """
    # Cálculo de los parámetros d1 y d2
    d1 = (np.log(S0 / K) + (r + 0.5 * sigma**2) * T) / (sigma * np.sqrt(T))
    d2 = (np.log(S0 / K) + (r - 0.5 * sigma**2) * T) / (sigma * np.sqrt(T))

    # Valor de call y put
    call = S0 * stats.norm.cdf(d1, 0.0, 1.0) -\
     K * np.exp(-r * T) * stats.norm.cdf(d2, 0.0, 1.0)
    
    put  = K * np.exp(-r * T) * stats.norm.cdf(-d2, 0.0, 1.0) - S0 * \
        stats.norm.cdf(-d1, 0.0, 1.0) 
     

    if option == 'call':
        return call
    elif option == 'put':
        return put
    else:
        raise ValueError("la opción debe ser 'call' o 'put'")

