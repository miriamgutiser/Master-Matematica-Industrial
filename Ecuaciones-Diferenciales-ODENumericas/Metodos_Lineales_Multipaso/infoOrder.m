function q = infoOrder(alph, bet, tol)
% INFOORDER Calcula el orden de un Método Lineal Multipaso (MLM)
%
% Esta función determina el orden del método, definido como el valor máximo 
% de `q` para el cual se cumple que `C_q = 0` dentro de una tolerancia dada.
%
% INPUTS:
%   alph - Vector de coeficientes α del método.
%   bet  - Vector de coeficientes β del método.
%   tol  - Tolerancia numérica para determinar si C_q ≠ 0.
%
% OUTPUT:
%   q - Orden del método (entero positivo).
%
% Ejemplo:
%   fprintf('El orden del método es %d.\n', infoOrder([ 1 0 -1 ], [ 1/3 4/3 1/3 ], 1e-6));

    k = length ( alph ); % Número de pasos
    q = 1; % Inicializar el orden

    % Invertir los coeficientes para trabajar con el sumatorio
    a = flip ( alph );
    b = flip ( bet );

    % Iterar hasta que se encuentre el primer C_q que exceda la tolerancia
    while true
        % Índices de los pasos
        j = 2 : k;

        % Cálculo de las sumas de la fórmula
        sumA = sum ( ( j - 1 ).^( q + 1 ) .* a( j ) );
        sumB = sum ( ( j - 1 ).^q .* b ( j ) );

        % Evaluar el coeficiente C_q
        C_q = ( 1 / factorial ( q + 1 ) ) * sumA - ( 1 / factorial ( q) ) * sumB;

        % Comprobar si C_q excede la tolerancia
        if abs ( C_q ) > tol
            break;
        end

        % Incrementar el orden si C_q sigue siendo válido
        q = q + 1;
    end
end