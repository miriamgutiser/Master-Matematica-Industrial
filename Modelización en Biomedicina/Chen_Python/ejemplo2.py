# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

# Parámetros del modelo: versión con estabilidad
C = np.array([[0.1, 0.05], [0.02, 0.1]])
V = np.diag([0.5, 0.4])
U = np.diag([0.3, 0.6])
L = np.diag([0.2, 0.3])

# Matriz M del sistema lineal
M = np.block([[-V, C], [L, -U]])

# Condiciones iniciales
x0 = np.array([1.0, 0.5, 0.2, 0.1])  # [r1, r2, p1, p2]

# Sistema de ecuaciones
def sistema(t, x):
    return M @ x

# Integración 
t_eval = np.linspace(0, 50, 500)
sol = solve_ivp(sistema, [0, 50], x0, t_eval=t_eval)

# Gráfica
plt.figure(figsize=(10, 6))
plt.plot(sol.t, sol.y[0], label='r1(t)', linestyle='-')
plt.plot(sol.t, sol.y[1], label='r2(t)', linestyle='-')
plt.plot(sol.t, sol.y[2], label='p1(t)', linestyle='--')
plt.plot(sol.t, sol.y[3], label='p2(t)', linestyle='--')
plt.xlabel('Tiempo')
plt.ylabel('Concentración')
plt.title('Evolución estable del sistema génico con 2 genes')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()
