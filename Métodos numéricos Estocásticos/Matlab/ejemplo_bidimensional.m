% Ejemplo de uso de normal_bidimensional
clc
clear all
mu = [3; 4];
Sigma = [2, 0.5; 0.5, 1];
muestras = normal_bidimensional(mu, Sigma, 1000);
