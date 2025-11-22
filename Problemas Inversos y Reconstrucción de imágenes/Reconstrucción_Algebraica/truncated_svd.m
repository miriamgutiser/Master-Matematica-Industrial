function x = truncated_svd(A, b, m)
% TRUNCATED_SVD Resuelve Ax = b usando SVD truncada con los m valores singulares más grandes
%
%   x_m = truncated_svd(A, b, m)
%
% Entradas:
%   A - Matriz del sistema (m x n)
%   b - Vector columna (m x 1)
%   m - Número de valores singulares más grandes a usar (m <= rank(A))
%
% Salida:
%   x - Solución aproximada con SVD truncada

    % Descomposición SVD 
    [U, S, V] = svd(A);  

    sigma = diag(S);

    % Ordenar valores singulares en orden descendente y reordenar vectores
    [sigma_sorted, idx] = sort(sigma, 'descend');
    U = U(:, idx);
    V = V(:, idx);

     % Filtrado por tolerancia numérica
    tol = 1e-16;
    valid = sigma_sorted / sigma_sorted(1) > tol;
    sigma_valid = sigma_sorted(valid);

    % Seleccionar los m valores singulares más grandes
    sigma_m = sigma_valid(1:m);
    U_m = U(:, 1:m);
    V_m = V(:, 1:m);

    x =  V_m *diag(1 ./ sigma_m)* (U_m' * b);
end
