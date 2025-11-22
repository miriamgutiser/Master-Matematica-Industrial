function [x,ifallo] = solvetrsupMOD(U,b)
%Héctor Méndez Casuso
%72205079Y
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%OOBJETIVO: resolver un sistema de ecuaciones lineales triangular superior 
%de la forma U*x=b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EN ENTRADA
% U: matriz de coeficientes del sistema
%    no se usa la parte de debajo de la diagonal principal.
% b: vector COLUMNA con los términos independientes
%
%EN SALIDA:
% x: solución calculada si ifallo = 0
%ifallo : indicador de la evolucion del proceso con los valores:
%    0: proceso finalizado con exito
%    1: Fin no satisfactorio. Proceso incompleto
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = size(U,1);  %numero de ecuaciones del sistema
%Inicializamos los argumentos de salida
x = zeros(n,1); %DIMENSIONAMOS COMO VECTOR COLUMNA

eps1 = eps^0.85; %4.98e-14
ifallo = 0;

if abs(U(n,n)) < eps1
    fprintf('\n MATRIZ COMPUTACIONALMENTE SINGULAR. \n');
    x = []; abs(U(n,n))
    ifallo = 1;
    abs(U(n,n))
    return
end
    
x(n) = b(n)/U(n,n);

for i=n-1:-1:1
    if abs(U(i,i)) < eps1
        fprintf('\n MATRIZ COMPUTACIONALMENTE SINGULAR. \n');
        x=[];
        ifallo = 1;
        return
    end
    x(i) = (b(i)-U(i,i+1:n)*x(i+1:n))/(U(i,i));
end

end

