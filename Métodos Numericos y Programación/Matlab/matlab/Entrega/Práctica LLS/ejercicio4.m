%Hector Mendez Casuso
%72205079Y
%Práctica LLS
%Ejercicio 4

clear all
clc
format short e

%DATOS
t = [1.02 0.95 0.87 0.77 0.67 0.56 0.44 0.30 0.16 0.01]';
s = [0.39 0.32 0.27 0.22 0.18 0.15 0.13 0.12 0.13 0.15]';

%MODELO1 (con 6 parametros)
%Ecuación de la órbita: 0=a.*X.^2+b.^x.^y+c.*y.^2+d^*x+e.*y+f
A=[t.^2 t.*s s.^2 t s ones(10,1)]; %MATRIZ DEL MODELO 1
[x,ifallo] =lsquares(A, zeros(10,1));
%Se obtiene la solución trivial [0 0 0 0 0 0]

%MODELO 2 (con 5 parámetros)
AA=[t.*s s.^2 t s ones(10,1)];
bb=[-t.^2];

[xx,ifallo2]=lsquares(AA, bb);
%PARÁMETROS DEL MODELO 2:
%   -1.4365e-01
%    2.6356e+00
%   -5.5145e-01
%   -3.2229e+00
%    4.3289e-01

