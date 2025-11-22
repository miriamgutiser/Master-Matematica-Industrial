function debugConvergenceError ( convergenceStatus )
% DEBUGCONVERGENCEERROR Muestra el mensaje de error correspondiente a la convergencia de un MLM
%
% Esta función interpreta el estado de convergencia de un método lineal multipaso (MLM)
% y muestra un mensaje descriptivo del problema encontrado.
%
% INPUT:
%   convergenceStatus - Código de estado de convergencia:
%       1: No es consistente porque ρ(1) ≠ 0.
%       2: No es consistente porque ρ'(1) ≠ σ(1).
%       3: No es estable porque ρ(r) tiene alguna raíz de módulo > 1.
%       4: No es estable porque ρ(r) tiene una raíz doble de módulo 1.
%
% Ejemplo:
%   debugConvergenceError(3);

    switch convergenceStatus
        case 1
            fprintf ( 'Error: MLM no es consistente porque ρ(1) ≠ 0.\n' );
        case 2
            fprintf ( 'Error: MLM no es consistente porque ρ''(1) ≠ σ(1).\n' );
        case 3
            fprintf ( 'Error: MLM no es estable porque ρ(r) tiene alguna raíz de módulo > 1.\n' );
        case 4
            fprintf ( 'Error: MLM no es estable porque ρ(r) tiene una raíz doble de módulo 1.\n' );
        otherwise
            fprintf ( 'Error: Código de estado de convergencia no reconocido.\n' );
    end
end