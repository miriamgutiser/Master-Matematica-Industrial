% Configuración inicial
x_exact = linspace(0, 2, 1000); % Valores de x para la derivada exacta
dx_values = [0.1, 0.01, 0.001]; % Valores de delta x para las aproximaciones

% Definición de la función original y su derivada exacta
f = @(x) cos(x).^2 + sin(x); % Función
f_prime_exact = @(x) -2*cos(x).*sin(x) + cos(x); % Derivada exacta


% Generar ruido epsilon
epsilon_levels = [0.01, 0.001];

for epsilon_val = epsilon_levels
    % Definición de la función con ruido
    epsilon = @(x) epsilon_val * (2 * rand(size(x)) - 1); % Ruido aleatorio entre [-epsilon_val, epsilon_val]
    f_epsilon = @(x) f(x) + epsilon(x); % Función con ruido

    for dx = dx_values
        % Gráfica de la derivada exacta
        figure;
        y_exact = f_prime_exact(x_exact);
        plot(x_exact, y_exact, 'LineWidth', 2, 'Color', 'r', 'DisplayName', 'Derivada exacta');
        hold on;

        % Cálculo de aproximaciones por diferencias progresivas y centradas
        x_approx = 0:dx:2; % Valores de x para las aproximaciones

        % Diferencias progresivas
        f_prog = (f_epsilon(x_approx + dx) - f_epsilon(x_approx)) / dx;
        plot(x_approx, f_prog, 'LineWidth', 1, 'Color', 'b', 'DisplayName', ['Prog., dx = ' num2str(dx)]);

        % Diferencias centradas
        f_cent = (f_epsilon(x_approx + dx) - f_epsilon(x_approx - dx)) / (2 * dx);
        plot(x_approx, f_cent, 'LineWidth', 1, 'Color', 'g', 'DisplayName', ['Cent., dx = ' num2str(dx)]);

        % Configuración de la gráfica
        title(['Δx = ' num2str(dx) ', ε = ' num2str(epsilon_val)]);
        xlabel('x');
        ylabel('f''(x)');
        legend;
        grid on;
        hold off;
    end
end
