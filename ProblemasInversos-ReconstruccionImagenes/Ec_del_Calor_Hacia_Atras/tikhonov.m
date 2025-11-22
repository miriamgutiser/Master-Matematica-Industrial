
function x_alpha = tikhonov (A, b, alpha, x0)
% TIKHONOV   Resuelve el sistema Ax = b usando  el método de regularización 
% de Tikhonov.
%
%   x_alpha = tikhonov(A, b, alpha)
%      (A'*A + alpha*I)x = A'*b
%
%   x_alpha = tikhonov(A, b, alpha, x0)
%     (A'*A + alpha*I)x = A'*b + alpha*x0
%
% Entradas:
%   A:      Matriz del sistema (m x n)
%   b:      Vector  (m x 1)
%   alpha:  Parámetro de regularización
%   x0:     Vector  (n x 1) 
%
% Salida:
%   x_alpha: Solución regularizada

    if nargin < 4
        x0 = zeros(size(A,2), 1); 
    end

    x_alpha = (A' * A + alpha * eye(size( A' * A))) \ (A' * b + alpha * x0);
end
