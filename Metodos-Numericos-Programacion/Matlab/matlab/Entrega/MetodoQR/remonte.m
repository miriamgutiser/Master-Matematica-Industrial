function [x, ifallo] = remonte(U, b)
% remonte - Solución de un sistema de ecuaciones lineales triangular superior
%   usando el método de sustitución hacia atrás.
%
%   [x,ifallo] = solvetrsup(A,b) permite especificar:
%           - A: matriz triangular superior (nxn) 
%           - b:  vector columna (nx1) de términos independientes.
%           - x: solución calculada si conv = 0
%           - ifallo : indicador de la evolucion del proceso con los valores:
%                   0: proceso finalizado con exito
%                   1: Fin no satisfactorio. Proceso incompleto
%
%   Ejemplo de uso
%     A = [3, 2, -1; 0, 1, 4; 0, 0, 2];
%     b = [5; 6; 4];
%     [x, ifallo] = remonte(A, b)
%
%   Limitaciones
%     - La matriz A debe ser triangular superior. Si se proporciona una
%       matriz que no sea triangular superior, la función generará un error.

n = size(U,1);  %numero de ecuaciones del sistema
%Inicializamos los argumentos de salida
x = zeros(n,1); %DIMENSIONAMOS COMO VECTOR COLUMNA

eps1 = eps^0.75;
ifallo = 0;

if abs(U(n,n)) < eps1
    fprintf('\n MATRIZ COMPUTACIONALMENTE SINGULAR. \n');
    x = [];
    ifallo = 1;
    return
end
    
x(n) = b(n) / U(n,n);

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