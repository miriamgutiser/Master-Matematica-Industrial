function x_alpha = tikhonov_iterado(A, G, alpha, n, x_0)
% TIKHONOV_ITERADO   Tikhonov iterado
%
% phi = tikhonov_iterado(A, G, alpha, n)
% phi = tikhonov_iterado(A, G, alpha, n, x_0)
% 
% Entradas:
%   A       : matriz (m×m)
%   G       : vector de datos (m×1)
%   alpha   : regularización
%   n       : número de iteraciones
%   x_0     : aproximación inicial de x_alpha
%
% Salida:
%   x_alpha : aproximación tras n iteraciones

  if nargin<5
    x_alpha = zeros(size(A,2),1);
  else
    x_alpha = x_0(:);
  end

  % Iteraciones
  for k = 1:n
    rhs = A'*G + alpha*x_alpha;
    x_alpha = (A'*A + alpha*eye(size(A'*A))) \ rhs;
  end
end
