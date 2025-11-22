# -*- coding: utf-8 -*-
"""
Created on Fri Apr 11 15:24:10 2025

@author: Miriam
"""

import numpy as np
import matplotlib.pyplot as plt

strike = np.linspace(50, 150,24)
maturity = np.linspace(0.5, 2.5,24)
strike, maturity = np.meshgrid(strike, maturity)

vi = (strike -100)**2/(100-strike)/maturity

fig = plt.figure()

ax = fig.add_subplot(projection = '3d') #ejes en 3 dimensiones
surf = ax.plot_surface(strike, maturity, vi, cmap = plt.cm.rainbow)

ax.set_xlabel('strike')
ax.set_ylabel('vencimiento')
ax.set_zlabel('implied volatility')
fig.colorbar(surf)

