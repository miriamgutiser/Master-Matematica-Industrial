% Configuración inicial
x_exact = linspace(0, 2, 1000); % Valores de x para la derivada exacta
dx_values = [0.1, 0.01, 0.001]; % Valores de delta x para las aproximaciones

% Definición de la función original y su derivada exacta
f = @(x) cos(x).^2 + sin(x); % Función
f_prime_exact = @(x) -2*cos(x).*sin(x) + cos(x); % Derivada exacta

% Cálculo de aproximaciones por diferencias progresivas y centradas
x_approx = 0:dx:2; % Valores de x para las aproximaciones


for dx = dx_values
    % Gráfica de la derivada exacta
    figure;
    y_exact = f_prime_exact(x_exact);
    plot(x_exact, y_exact, 'LineWidth', 2, 'Color', 'r', 'DisplayName', 'Derivada exacta');
    hold on;

    % Cálculo de aproximaciones por diferencias progresivas y centradas
    x_approx = 0:dx:2; % Valores de x para las aproximaciones

    % Diferencias progresivas
    f_prog = (f(x_approx + dx) - f(x_approx)) / dx;
    plot(x_approx, f_prog, 'LineWidth', 1, 'Color', 'b', 'DisplayName', ['Prog., dx = ' num2str(dx)]);

    % Diferencias centradas
    f_cent = (f(x_approx + dx) - f(x_approx - dx)) / (2 * dx);
    plot(x_approx, f_cent, 'LineWidth', 1, 'Color', 'g', 'DisplayName', ['Cent., dx = ' num2str(dx)]);

    % Configuración de la gráfica
    title(['Δx = ' num2str(dx)]);
    xlabel('x');
    ylabel('f''(x)');
    legend;
    grid on;
    hold off;
end
