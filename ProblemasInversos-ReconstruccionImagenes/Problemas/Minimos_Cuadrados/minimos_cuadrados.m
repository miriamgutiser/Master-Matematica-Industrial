%Se busca una curva que se ajuste a los datos de la tabla (x,y)
% Datos del problema
x = [1, 2, 3, 4, 5, 6]';
%x = 0:0.1:7;
y = [0.9, 1.4, 2.1, 2.7, 3.1, 3.3]';

% Aproximación por mínimos cuadrados para una recta (grado 1)
A1 = [x, ones(size(x))];
coeff1 = (A1' * A1) \ (A1' * y); % Coeficientes [a, b]
y1 = A1 * coeff1;

% Aproximación por mínimos cuadrados para un polinomio de grado 2
A2 = [x.^2, x, ones(size(x))];
coeff2 = (A2' * A2) \ (A2' * y); % Coeficientes [a, b, c]
y2 = A2 * coeff2;

% Aproximación por mínimos cuadrados para un polinomio de grado 5
A5 = [x.^5, x.^4, x.^3, x.^2, x, ones(size(x))];
coeff5 = (A5' * A5) \ (A5' * y); % Coeficientes [a, b, c, d, e, f]
y5 = A5 * coeff5;

% Gráfica de los datos y las aproximaciones
figure;
hold on;
scatter(x, y, 'filled', 'DisplayName', 'Datos originales'); % Datos originales
plot(x, y1, 'LineWidth', 1, 'Color', 'g', 'DisplayName', 'Aproximación Grado 1 (Recta)');
plot(x, y2, 'LineWidth', 1, 'Color', 'r', 'DisplayName', 'Aproximación Grado 2 (Parábola)');
plot(x, y5, 'LineWidth', 1, 'Color', 'k', 'DisplayName', 'Aproximación Grado 5 (Polinomio)');
legend;
xlabel('x');
ylabel('y');
title('Aproximaciones Polinómicas por Mínimos Cuadrados');
grid on;
hold off;
