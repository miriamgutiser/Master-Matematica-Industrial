%Hector Mendez Casuso
%72205079Y
%Práctica LLS
%Ejercicio 7

clear all
clc 
format short e

A = [1 1; 1e-8 0; 0 1e-8];
rank(A)    % 2  rango maximo
%En teoria A'*A es simetrica y definidia positiva

A'*A;
%   1     1
%   1     1
% 1+1e-16=1 en la maquina
rank(A'*A) % 1