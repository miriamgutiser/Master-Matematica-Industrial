# -*- coding: utf-8 -*-

import numpy as np
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt

# Parámetros del modelo
C = np.array([[0.5, 0.1],
              [0.3, 0.7]])
V = np.diag([0.1, 0.2])
U = np.diag([0.2, 0.1])
L = np.diag([0.8, 0.9])

# Dimensión del sistema
n = C.shape[0]

# Definimos el sistema de Ecuaciones
def modelo_lineal(t, x):
    r = x[:n]
    p = x[n:]
    drdt = C @ p - V @ r
    dpdt = L @ r - U @ p
    return np.concatenate((drdt, dpdt))


x0 = np.array([1.0, 0.5, 0.2, 1.0])  
t_eval = np.linspace(0, 50, 500)

sol = solve_ivp(modelo_lineal, [0, 50], x0, t_eval=t_eval)

# Gráfica
plt.figure(figsize=(10, 6))
plt.plot(sol.t, sol.y[0], label='r1(t)', linestyle='--')
plt.plot(sol.t, sol.y[1], label='r2(t)', linestyle='--')
plt.plot(sol.t, sol.y[2], label='p1(t)')
plt.plot(sol.t, sol.y[3], label='p2(t)')
plt.xlabel('Tiempo')
plt.ylabel('Concentración')
plt.title('Simulación del Modelo Lineal de Expresión Génica (n = 2)')
plt.legend()
plt.grid()
plt.tight_layout()
plt.show()
