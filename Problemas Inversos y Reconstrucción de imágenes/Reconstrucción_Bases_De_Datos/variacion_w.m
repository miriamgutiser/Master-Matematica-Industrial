
%Gráfica para observar el crecimiento del error respecto la variación de
%los procentajes en la creación de las bases de datos 'gappy' y su
%reconstrucción

%Parámetros
N = 50; %Tamaño de la matriz
Delta_x = 1 / (N-1);
[x, y] = meshgrid( (0:N-1)* Delta_x, (0:N-1) * Delta_x);
z = 0; %Valores de z*
w_values = linspace(0.1, 0.9, 10); % Porcentajes de datos eliminados (10% a 90%)



%Función f. 0<= x,y,z<=1
f = @(x, y, z) x.^2 .*(sin(5*pi*y + 3*log(x.^3 + y.^2 + z +pi^2)) -1).^2 -...
    4*x.^2 .*y.^3.*(1-z)^(3/2) + (x + z - 1) .* (2*y - z) .* cos(30*(x + z))...
    .* log(6 + x.^2.*y.^2 + z.^3);




% Parámetros
N = 50; % Tamaño de la matriz
m = 5; % Número fijo de modos para SVD
max_iter = 1000;
tol = 1e-6;

% Vector para almacenar los errores RMSE
RMSE_values = zeros(size(w_values));

for k = 1:length(w_values)
    w = w_values(k);

    A1 = f(x, y, z);
    f_min1 = min(A1(:)); f_max1 = max(A1(:));
    A1 = 2 * (A1 - f_min1) / (f_max1 - f_min1) - 1;
    elems1 = rand(N, N) > w;
    A1_gappy = A1 .* elems1;

    % Aplicar SVD truncado a la matriz A1_gappy
    A_rec = truncated_svd(A1_gappy, m, max_iter, tol);

    % Calcular error RMSE comparando A1 (original) con A_rec (reconstruida)
    RMSE_values(k) = (1/N) * norm(A1 - A_rec, 'fro'); 
end

% Graficar RMSE vs. porcentaje de eliminación w
figure;
plot(w_values * 100, RMSE_values, 'o-', 'LineWidth', 2);
xlabel('Porcentaje de datos eliminados (w %)'); 
ylabel('Error RMSE'); 
title(sprintf('Variación del RMSE con w (m=%d)', m)); 
grid on;
