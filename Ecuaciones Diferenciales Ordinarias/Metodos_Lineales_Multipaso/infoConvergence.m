function convStatus = infoConvergence ( alph, bet, tol )
% INFOCONVERGENCE Evalúa la convergencia de un Método Lineal Multipaso (MLM)
%
% Esta función analiza un MLM para determinar si es consistente, estable y, 
% por lo tanto, convergente, basado en las propiedades de sus polinomios asociados.
%
% INPUTS:
%   alph - Vector de coeficientes del polinomio rho.
%   bet  - Vector de coeficientes del polinomio sigma.
%   tol  - Tolerancia para la evaluación numérica.
%
% OUTPUT:
%   convStatus - Indicador de estado de convergencia:
%       1: Inconsistente porque ρ(1) ≠ 0.
%       2: Inconsistente porque ρ'(1) ≠ σ(1).
%       3: Inestable porque ρ(r) tiene alguna raíz de módulo > 1.
%       4: Inestable porque ρ(r) tiene una raíz doble de módulo 1.
%       5: Convergente.
%
% Ejemplo:
%   convStatus = infoConvergence ( [ 1 0 -1 ], [ 1/3 4/3 1/3 ], 1e-6);

    % Evaluar consistencia: ρ(1) ≠ 0
    rho1 = polyval ( alph, 1 );
    if abs ( rho1 ) > tol
        convStatus = 1;
        return;
    end

    % Evaluar consistencia: ρ'(1) ≠ σ(1)
    rhop = polyder ( alph );
    rhop1 = polyval ( rhop, 1 );
    sig1 = polyval ( bet, 1 );
    if abs ( rhop1 - sig1 ) > tol
        convStatus = 2;
        return;
    end

    % Evaluar estabilidad: raíces de ρ(r)
    vr = roots ( alph );
    vmr = abs ( vr ); % Módulos de las raíces
    vrone = vr ( abs ( vmr - 1 ) < tol ); % Raíces de módulo cercano a 1
    w = unique ( vrone ); % Raíces únicas de módulo 1

    if any ( vmr > 1 + tol )
        % No estable por raíces con módulo > 1
        convStatus = 3;
    elseif length ( vrone ) ~= length ( w )
        % No estable por raíces dobles de módulo 1
        convStatus = 4;
    else
        % Convergente
        convStatus = 5;
    end
end