%Hector Mendez Casuso
%72205079Y
%Práctica LLS
%Ejercicio 3

clear all
clc
format short e

m = 200;

%GENERAMOS PUNTOS EQUIESPACIADOS
t = linspace(0,5,m)'; %OJO: vector columna
y = erf(t);

e = exp(-t.^2); %Es un vector

A = [e.*t.^2 e.*t e ones(m,1)];

x = A\y;
% x =
%   -3.2416e-01
%    8.8740e-01
%   -9.8216e-01
%    1.0012e+00

%Valor de la funcion: 
norm(A*x-y)^2;  %= 2.5553e-03
