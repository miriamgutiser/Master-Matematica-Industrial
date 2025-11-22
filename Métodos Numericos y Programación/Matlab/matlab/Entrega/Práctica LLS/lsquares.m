function [x,ifallo] = lsquares(A,b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OBJETIVO: Resolver el problema de minimos cuadrados lineales
%    Min \|Ax-b\|_2^2
% siendo A de rango maximo, 
% usando una factorizacion QR con matrices de Householder
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EN ENTRADA:
% A matriz con mas filas que columnas y de rango maximo
% b vector con el mismo numero de filas que A
%EN SALIDA
% x  la solucion
% ifallo indicador de fallo con los valores
%       0    proceso con exito
%       1    no se ha podido resolver el problema
%FUNCIONES AUXILIARES: houscero y solvetrsup
%------------------------------------------------------------------

% inicializamos los argumentos de salida
[m, n]  = size(A); %m filas y n columnas
x = zeros(n);      % que sea vector columna
ifallo = 0;

%Vamos a transformar la A en triangular superior
for k=1: n  %recorre las columnas
    [h, ssigma, snormh2] = houscero(A(k:m, k));
    A(k,k) = ssigma;
    beta=2/(snormh2); %parámetro auxiliar
    for j=k+1:n %recorre las col a la dcha de la k-esima
        s = h'*A(k:m,j);
        s = beta*s;
        A(k:m,j) = A(k:m,j)-s*h;
    end
    %Multiplicamos por la matriz de Householder al vector
    %de terminos independientes
    s=h'*b(k:m);
    s=beta*s;
    b(k:m)=b(k:m)-s*h;
end

%Resolvemos el problema triangular
[x, ifallo] = solvetrsup(A(1:n,:),b(1:n));

end