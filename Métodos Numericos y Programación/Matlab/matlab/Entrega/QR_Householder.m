function [Q, R] = QR_Householder(A)
%____________________________________________________________________________________
%
% Función: QR_Householder
% ________________________
%
% Descripción:
%
% Este algoritmo realiza la factorización QR de una matriz \( A \) utilizando 
% las reflexiones de Householder. La matriz \( A \) se descompone en:
% 
%    \( A = Q * R \),
%
% donde \( Q \) es una matriz ortogonal (o unitaria) y \( R \) es una matriz
% triangular superior.
%
% Parámetros de entrada:
% ______________________
%
% A   Matriz \( m \times n \), con \( m \geq n \).
%
% Parámetros de salida:
% _____________________
%
% Q   Matriz ortogonal (o unitaria) \( m \times m \).
% R   Matriz triangular superior \( m \times n \).
%
% Ejemplo de uso:
% _______________
%
% A = [2 4; 1 3; 0 0];
% [Q, R] = QR_Householder(A);
%
%____________________________________________________________________________________

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
