function [Q, R] = QR_Householder(A)
% QR_Householder - Factorización QR de una matriz A utilizando matrices de
% householder. 
% 
%   [Q, R] = QR_Householder(A) descompone la matriz A en una matriz Q
%   ortogonal y R triangular superior, y las devuelve. Permite
%   especificar<.
%       -Q : Matriz ortogonal de tamaño (mxm)
%       -R: matri triangular superior de tamaño (mxn)
%       -A: Matriz de tamaño (mxn)
%
% Ejemplo de uso: 
% A = [2 4; 1 3; 0 0];
% [Q, R] = QR_Householder(A);


[m, n] = size(A);
Q = eye(m); % Inicializamos Q como la matriz identidad
R = A;      % Inicializamos R como A

for k = 1:min(m, n)
    % Extraemos el vector columna desde la diagonal
    x = R(k:end, k);
    
    % Calculamos el vector de Householder
    e1 = zeros(length(x), 1); 
    e1(1) = 1; % Primer vector canónico
    
    % Calculamos el factor de normalización para el reflector
    v = sign(x(1)) * norm(x) * e1 + x;
    v = v / norm(v); % Normalizamos el vector
    
    % Formamos la matriz de Householder
    Hk = eye(m); % Matriz identidad del tamaño m x m
    Hk(k:end, k:end) = eye(length(v)) - 2 * (v * v'); % Submatriz modificada
    
    % Actualizamos R y Q
    R = Hk * R; % Aplicamos la transformación a R
    Q = Q * Hk'; % Acumulamos la transformación en Q
end

% Aseguramos que Q y R cumplen con las propiedades esperadas
R = R(1:n, :); % Limitamos R a una matriz triangular superior de tamaño n x n
Q = Q(:, 1:m); % Limitamos Q al tamaño adecuado si es rectangular
end
