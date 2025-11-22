function [y,ifallo] = solvetrinf(L,b)
%Héctor Méndez Casuso
%72205079Y
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%OOBJETIVO: resolver un sistema de ecuaciones lineales triangular inferior 
%de la forma L*y=b 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EN ENTRADA
% L: matriz de coeficientes del sistema
%    no se usa la parte de encima de la diagonal principal.
% b: vector COLUMNA con los términos independientes
%
%EN SALIDA:
% y: solución calculada si ifallo = 0
%ifallo : indicador de la evolucion del proceso con los valores:
%    0: proceso finalizado con exito
%    1: Fin no satisfactorio. Proceso incompleto
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = size(L,1);  %numero de ecuaciones del sistema
%Inicializamos los argumentos de salida
y = zeros(n,1); %DIMENSIONAMOS COMO VECTOR COLUMNA

eps1 = eps^0.75;
ifallo = 0;

if abs(L(1,1)) < eps1
    fprintf('\n MATRIZ COMPUTACIONALMENTE SINGULAR. \n');
    y=[];
    ifallo = 1;
    return
end
    
y(1) = b(1)/L(1,1);

for i=2:n
    if abs(L(i,i)) < eps1
        fprintf('\n MATRIZ COMPUTACIONALMENTE SINGULAR. \n');
        y=[];
        ifallo = 1;
        return
    end
    y(i) = (b(i)-L(i,1:i-1)*y(1:i-1))/(L(i,i));
end

end

