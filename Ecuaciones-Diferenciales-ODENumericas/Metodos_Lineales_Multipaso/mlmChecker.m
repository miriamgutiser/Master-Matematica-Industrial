function sol = mlmChecker ( alph, bet, tol, d )
% MLMCHECKER Analiza un Método Lineal Multipaso (MLM)
%
% Esta función evalúa las características de un método lineal multipaso.
% Determina:
%   - Estado de convergencia (1 a 5, según criterios internos).
%   - Si el método es explícito (1) o implícito (2).
%   - El orden del método.
%
% INPUTS:
%   alph - Vector de coeficientes alpha del método MLM.
%   bet  - Vector de coeficientes beta del método MLM.
%   tol  - Tolerancia para la evaluación de condiciones.
%   d    - Modo debug (1 o 0).
%
% OUTPUT:
%   sol  - Vector [convStatus expStatus p]:
%          convStatus: Estado de convergencia (1-5).
%          expStatus : 1 para explícito, 2 para implícito.
%          p         : Orden del método.
%
% Ejemplo:
%   sol = mlmChecker([ 1 0 -1 ], [ 1/3 4/3 1/3 ], 1e-6, 1);

    % Inicializar valores de salida
    convStatus = -1;
    expStatus = -1;
    p = -1;

    % Verificar tamaños de entrada
    if length ( alph ) ~= length ( bet )
        fprintf ( 'Error: Los vectores alpha y beta tienen longitudes diferentes.\n' );
        sol = [ convStatus expStatus p ];
        return;
    end

    % Verificar que el método sea válido
    if abs(alph(end)) + abs(bet(end)) == 0
        fprintf('Error: Los coeficientes finales de alpha y beta no pueden ser ambos cero.\n');
        sol = [convStatus, expStatus, p];
        return;
    end

    % Evaluar la convergencia del método
    convStatus = infoConvergence ( alph, bet, tol );
    if convStatus ~= 5
        if d
            debugConvergenceError ( convStatus );
        end
        sol = [ convStatus expStatus p ];
        return;
    end

    % Determinar si el método es explícito o implícito
    if bet ( 1 ) == 0
        expStatus = 1; % Explícito
    else
        expStatus = 2; % Implícito
    end

    % Calcular el orden del método
    p = infoOrder ( alph, bet, tol );

    % Resultado final
    sol = [ convStatus expStatus p ];
end