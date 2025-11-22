
% Parámetros
N = 50; % Tamaño de la matriz
Delta_x = 1 / (N-1);
[x, y] = meshgrid((0:N-1) * Delta_x, (0:N-1) * Delta_x);
z = [0,1]; % Valores de z*
m_val = 1:15;
w = 0.3;

% Función f. 0<= x,y,z<=1
f = @(x, y, z) x.^2 .* (sin(5*pi*y + 3*log(x.^3 + y.^2 + z + pi^2)) -1).^2 - ...
    4*x.^2 .* y.^3 .* (1-z)^(3/2) + (x + z - 1) .* (2*y - z) .* cos(30*(x + z)) ...
    .* log(6 + x.^2.*y.^2 + z.^3);

% Generación de las matrices originales
A1 = f(x, y, z(1));
A2 = f(x, y, z(2));

% Normalización
f_min1 = min(A1(:)); f_max1 = max(A1(:));
f_min2 = min(A2(:)); f_max2 = max(A2(:));

A1 = 2 * (A1 - f_min1) / (f_max1 - f_min1) - 1;
A2 = 2 * (A2 - f_min2) / (f_max2 - f_min2) - 1;

% Eliminación aleatoria de elementos
elems1 = rand(N, N) > w;
A1_gappy = A1 .* elems1;

elems2 = rand(N, N) > w;
A2_gappy = A2 .* elems2;

% Parámetros del algoritmo
max_iter = 1000;
tol = 1e-6;

% Vectores para almacenar los errores RMSE
RMSE_values1 = zeros(size(m_val));
RMSE_values2 = zeros(size(m_val));

for k = 1:length(m_val)
    m = m_val(k);

    % Aplicar SVD truncado a las matrices incompletas
    A_rec1 = truncated_svd(A1_gappy, m, max_iter, tol);
    A_rec2 = truncated_svd(A2_gappy, m, max_iter, tol);

    % Calcular error RMSE comparando con las originales
    RMSE_values1(k) = (1/N) * norm(A1 - A_rec1, 'fro');
    RMSE_values2(k) = (1/N) * norm(A2 - A_rec2, 'fro');
end

figure;
hold on;
plot(m_val, RMSE_values1, 'b-o', 'MarkerSize', 5, 'MarkerFaceColor', 'b', 'DisplayName', 'Matriz A1');
plot(m_val, RMSE_values2, 'r-s', 'MarkerSize', 5, 'MarkerFaceColor', 'r', 'DisplayName', 'Matriz A2');

xlabel('Número de modos retenidos (m)');
ylabel('Error RMSE');
xticks(1:1:15);
title('Variación del RMSE con m');
grid on;
legend('show'); % Muestra la leyenda con etiquetas definidas en DisplayName
hold off;
