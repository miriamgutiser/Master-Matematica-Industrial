%Hector Mendez Casuso
%72205079Y
%Práctica LLS
%Ejercicio 5

clear all
clc 
format short e

A = [1 0; 0 1e-6; 0 0];
b = [1; 0; 1];
E = [0 0; 0 0; 0 1e-8];

%Resolucion con el metodo QR de minimos cuadrados
m=3; 
n=2;
rank(A) %=2, size(A,2)=2 %rango maximo

%Solucion problema Ax-b
[hatx, ifallo] =lsquares(A, b);
% hatx =  1   0          ifallo = 0

%Solucion problema (A+E)x-b
[tildex, ifallo2] =lsquares(A+E, b);
% xtilde =  1.0000e+00   9.9990e+03          ifallo=0

%Error ralatuvo en la solucion
norm(hatx-tildex)/(hatx)    %   9.9990e+03

%Error relativo en el residuo
hatr=A*hatx-b;
tilder=(A+E)*tildex-b;
normb=norm(b);
norm(hatr-tilder)/normb     %   7.0707e-03


%Cotas teoricas
ca=cond(A)  %  1000000
   (1+2*ca)*norm(E)/norm(A) %  2.0000e-02
   
%Cota para el error relativo de la solucion
epsilon = norm(E)/norm(A)   %   1.0000e-08
hateta = norm(hatr/ normb);  %   7.0711e-01
AMPLIFICADOR = (2*ca+(ca^2)*hateta)/sqrt(1-hateta^2)  %   1.0000e+12

norm(hatx-tildex)/norm(hatx)  %   9.9990e+03
COTA=epsilon*AMPLIFICADOR     %   1.0000e+04


%Casi alcanzamos la cota!!!!!
%Conclusion: la cota esta bien ajustada