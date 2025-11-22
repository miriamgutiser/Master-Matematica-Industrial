%Hector Mendez Casuso
%72205079Y
%Práctica LLS
%Ejercicio 2

clear all
clc
format short e

% Modelo: TOTAL = Fijo + X1*GastoLuz + X2*GastoGas
Luz = [576, 512, 496, 599, 495, 572]';
Gas = [240, 202, 175, 159, 203, 237]';
b = [95.02, 87.09, 84.30, 93.47, 85.50, 94.49]';

% Dimensiones del problema
m = 6;%numero de tripletas de datos
n = 3;%numero de parametros del modelo

A =1.16*[ones(m,1) Luz Gas];

xx = A \ b
% x =
% 
%    2.4691e+01
%    8.2639e-02
%    4.0099e-02

%Valor de la funcion: 
norm(A*xx-b)^2  %=  2.5753e-05

%Con los resultados obtenidos hacemos las siguientes estimaciones:
%       La potencia contratada y el alquiler de contadores cuesta 24.5euros
%       El precio de kwh de luz es de 0.082639
%       El precio de kwh  de gas es 0.040021
%--------------------------------------------------------------------------


%%USAMOS LSQUARES:
[x,ifallo] = lsquares(A, b);

% x =
%    2.4503e+01
%    8.2990e-02
%    4.0021e-02
% 
% ifallo =     0

k = (6*m-3*n+41)*n;
epsilon = k*eps*sqrt(n) %= 7.8457e-14
%Cota para el error relativo en el residuo
ca = cond(A)%= 8.0632e+003 t
resc = norm(A*x-b); %residuo con la xc
normb = norm(b);
etacota = (resc/normb)+epsilon*(1+2*ca)

COTA = epsilon*(2*ca+etacota*ca^2)/sqrt(1-etacota^2) %=    1.3825e-09
 %=6.2025e-07

%Conclusion: BUENA CALIDAD teniendo en cuenta al epsilon maquina
