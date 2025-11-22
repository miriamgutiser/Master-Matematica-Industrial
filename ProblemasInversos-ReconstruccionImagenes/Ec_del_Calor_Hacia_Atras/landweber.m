function x_mu = landweber(A, G, mu, n, x_0)
% LANDWEBER_ITERADO  Iteración de Landweber para resolver AF=G
%
% phi = landweber_iterado(A, G, mu, n)
% phi = landweber_iterado(A, G, mu, n, x_0)
%
%   A       : matriz (m×n) del sistema AF=G
%   G       : vector (m×1) de datos medidos
%   mu      : paso de Landweber (debe cumplir mu*||A'*A|| <= 1)
%   n       : número de iteraciones
%   x_0     : aproximación inicial
%
% Devuelve:
%   x_mu     : aproximación tras n iteraciones

    if nargin<5
        x_mu = zeros(size(A,2),1);
    else
        x_mu = x_0(:);
    end

    for k = 1:n
        x_mu = x_mu - mu * A' * (A*x_mu - G);
    end
end
