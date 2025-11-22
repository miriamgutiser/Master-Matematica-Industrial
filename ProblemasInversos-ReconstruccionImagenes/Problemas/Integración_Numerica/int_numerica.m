% Ejercicio de Integración Numérica (Diapositiva 24)

% Configuración inicial
dx_values = [0.1, 0.01, 0.001]; % Valores de delta x
epsilon_levels = [1e-2, 1e-3, 1e-6]; % Niveles de ruido

% Función original
f = @(x) cos(x).^2 + sin(x);

% Valor exacto de la integral (simbólicamente o usando integral)
integral_exact = integral(f, 0, 2);

% Inicializar tabla de resultados
results = zeros(length(dx_values), 1 + length(epsilon_levels));

% Cálculo para la función original
fprintf('Resultados para la función original:\n');
for i = 1:length(dx_values)
    dx = dx_values(i);
    x_approx = 0:dx:2;
    integral_trap = trapz(x_approx, f(x_approx));
    error = abs(integral_exact - integral_trap);
    results(i, 1) = error; % Guardar en la primera columna
    fprintf('Delta x = %.4f, Error = %.10f\n', dx, error);
end

%ESTO ESTA MAL-CORREGIR
% Cálculo para las funciones con ruido
for j = 1:length(epsilon_levels)
    epsilon_val = epsilon_levels(j);
    fprintf('\nResultados para la función con ruido epsilon = %.0e:\n', epsilon_val);
    for i = 1:length(dx_values)
        dx = dx_values(i);
        x_approx = 0:dx:2;
        epsilon = epsilon_val * (2 * rand(size(x_approx)) - 1); % Generar ruido aleatorio
        f_epsilon = @(x) f(x) + epsilon; % Función con ruido
        integral_trap = trapz(x_approx, f_epsilon(x_approx));
        error = abs(integral_exact - integral_trap);
        results(i, j+1) = error; % Guardar en la tabla
        fprintf('Delta x = %.4f, Error = %.6e\n', dx, error);
    end
end


