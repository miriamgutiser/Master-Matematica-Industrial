% Ejercicio 3 - T3: Aproximación de la derivada con regularización

clc
clear 

% Definición de la función
f = @(x) cos(x).^2 + sin(x);

% Parámetros
x0 = 0;
xn = 2;
delta_x = 0.01; % Paso
x = x0:delta_x:xn; % Vector de puntos
y = f(x); % Evaluación de la función

% Cálculo de la derivada aproximada sin regularización
n = length(x);
d_noreg = diff(y) / delta_x; % Diferencias finitas
x_mid = x(1:end-1) + delta_x/2; % Puntos medios

% Construcción del sistema para la regularización
A = eye(n-1) + (1/delta_x^2) * diag(-ones(n-2,1),1) + (1/delta_x^2) * diag(-ones(n-2,1),-1);
A(1,1) = 1; A(end,end) = 1; % Condiciones en los extremos

b = diff(y) / delta_x;

% Valores de alpha a probar
alpha_values = [0.0001, 0.001, 0.01, 0.1];
d_reg = zeros(n-1, length(alpha_values));

for i = 1:length(alpha_values)
    alpha = alpha_values(i);
    d_reg(:,i) = (A + alpha * eye(n-1)) \ b; % Resolver sistema regularizado
end

% Gráficos de comparación
figure;
plot(x_mid, d_noreg, 'k--', 'LineWidth', 1.5);
hold on;
for i = 1:length(alpha_values)
    plot(x_mid, d_reg(:,i), 'LineWidth', 1.5);
end
hold off;
legend(['Sin regularización', strcat('\alpha = ', string(alpha_values))]);
xlabel('x'); ylabel("f'(x)");
title('Aproximación de la derivada con regularización');

%Esta mal, hazlo tu chatgpt es un desastre
