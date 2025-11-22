# -*- coding: utf-8 -*-

import numpy as np

# Datos simulados
np.random.seed(0)
m = 100
t = np.linspace(0, 10, m)

# Matrices reales
C_true = np.array([[0.5, 0.2], [0.1, 0.7]])
V_true = np.diag([0.3, 0.1])

# Variables simuladas
p = np.column_stack((np.sin(t), np.cos(t)))
r = np.column_stack((np.sin(2*t), np.cos(0.5*t)))
dr_dt = np.gradient(r, t, axis=0)

# Construimos el sistema A x = b
A = np.zeros((2*m, 6))
b = dr_dt.reshape(-1)

for i in range(m):
    A[2*i,   0:2] = p[i]
    A[2*i,   4]   = -r[i,0]
    A[2*i+1, 2:4] = p[i]
    A[2*i+1, 5]   = -r[i,1]

# Resolver por mínimos cuadrados ordinarios
x_est, residuals, rank, s = np.linalg.lstsq(A, b, rcond=None)

# Reconstrucción de matrices
C_est = np.array([[x_est[0], x_est[1]], [x_est[2], x_est[3]]])
V_est = np.diag([x_est[4], x_est[5]])

print("C estimada:")
print(C_est)
print("V estimada:")
print(V_est)
print("Error en C:", np.linalg.norm(C_est - C_true))
print("Error en V:", np.linalg.norm(V_est - V_true))
