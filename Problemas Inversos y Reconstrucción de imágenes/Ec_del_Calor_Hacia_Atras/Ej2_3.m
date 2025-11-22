%% Apartado 3 - Resolución sistema AF = G por método de Tikhonov iterado

alpha = 1e-5;  
    

% Tikhonov n = 1 
x_1 = tikhonov_iterado(A, G, alpha, 1);

% Tikhonov n = 2
x_2 = tikhonov_iterado(A, G, alpha, 2);

% Función exacta
f_inicial = (2/pi)*xi .* (xi<=pi/2) + (2/pi)*(pi - xi) .* (xi>pi/2);

% Representación 
figure; hold on
plot(xi, f_inicial,   'k-',  'LineWidth',2);
plot(xi, x_1,   'ro-', 'LineWidth',1, 'MarkerSize',4);
plot(xi, x_2,   'bs-', 'LineWidth',1, 'MarkerSize',4);
legend('Exacta','Tikhonov 1','Tikhonov 2','Location','northeast');
xlabel('x_i'); ylabel('f(x_i)');
title(sprintf('Solución sistema por método de Tikhonov iterado (alpha=%.0e)', alpha));
grid on; hold off