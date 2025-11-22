function x = lsquares2(A,b)
% MetodoQR - metodo directo para resolver sistemas de ecuaciones lineales. 
%
% x = lsquares2(A,b) resuelve el sistema de ecuaciones lineales 
%   Ax = b, usando una factorizacion QR con matrices de Householder. De forma que se resuelve el sistema Rx = Q^t*b. 
% Devuelve el vector solución x. De forma que se resuelve el sistema Rx = Q^t*b. 
% Permite especificar: 
%       -A: matriz cuadrada
%       -b: vector con el mismo numero de filas que A
%       -x:  vector solucion

%FUNCIONES AUXILIARES: QR_Householder y remonte

% inicializamos los argumentos de salida
[m, n]  = size(A); %m filas y n columnas
[Q, R] = QR_Householder(A);
Qt = Q';
bs = Qt .* b;
x = remonte(R, bs);
