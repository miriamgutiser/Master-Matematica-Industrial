# -*- coding: utf-8 -*-
"""
Created on Sun May 11 20:50:33 2025

@author: Miriam
"""

from opcion_vainilla_mc import opcion_vainilla_mc
from opcion_vainilla_bs import opcion_vainilla_bs

"""
Ejercicio 3:
Valorar con Monte Carlo y Black–Scholes una opción europea de
compra y otra de venta con:
    S0     = 17.00
    K      = 15.00
    T      = 3/12 años (3 meses)
    r      = 0.03
    sigma  = 0.25
"""


def main():
    S0    = 17.0
    K     = 15.0
    T     = 3/12      # 3 meses en años
    r     = 0.03      # 3%
    sigma = 0.25      # 25%

    # Black–Scholes
    call_bs = opcion_vainilla_bs(S0, K, T, r, sigma, option='call')
    put_bs  = opcion_vainilla_bs(S0, K, T, r, sigma, option='put')

    # Monte Carlo
    call_mc = opcion_vainilla_mc(S0, K, T, r, sigma, option='call')
    put_mc  = opcion_vainilla_mc(S0, K, T, r, sigma, option='put')

    # Mostrar resultados
 
    print('El precio de la opcion vainilla europea de compra (Black-Scholes) es %f' %call_bs)
    print('El precio de la opcion vainilla europea de venta (Black-Scholes) es %f' %put_bs)

    
    print('El precio de la opcion vainilla europea de compra (Monte Carlo) es %f' %call_mc)
    print('El precio de la opcion vainilla europea de venta (Monte Carlo) es %f' %put_mc)

if __name__ == "__main__":
    main()