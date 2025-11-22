%Ejemplo del metodo de congruencia lineal para generar muestras de una
%uniforme, con N = 1000, a= 16807, b = 0, M = 2^31-1, N_0 = 12345 (semilla)
%Ejemplo de clase. 
clc
clear all
U = congruencia_lineal(1000, 16807, 0, 2^31-1, 12345);
histogram(U)  %representación gráfica de la distribución en forma de histograma 
