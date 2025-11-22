%% Apartado 4 - Resolución sistema AF = G por método de Landwebber

% Elección de mu

mu = 0.95 / norm(A'*A); %<1

% Landwebber n = 10
x_10 = landweber(A, G, mu, 10);

%Landwebber n = 80
x_80 = landweber(A, G, mu, 80);

%Landwebber n = 300
x_300 = landweber(A, G, mu, 300);

% Función exacta
f_inicial = (2/pi)*xi .* (xi<=pi/2) + (2/pi)*(pi - xi) .* (xi>pi/2);

% Representación 
figure; hold on
plot(xi, f_inicial,   'k-',  'LineWidth',2);
plot(xi, x_10,   'ro-', 'LineWidth',1, 'MarkerSize',4);
plot(xi, x_80,   'bo-', 'LineWidth',1, 'MarkerSize',4);
plot(xi, x_300,  'go-', 'LineWidth',1, 'MarkerSize',4);
legend('Exacta','Landwebber n = 10','Landwebber n = 80','Landwebber n = 300', 'Location','northeast');
xlabel('x_i'); ylabel('f(x_i)');
title(sprintf('Solución sistema por método de Landwebber (mu = %.5f)', mu));
grid on; hold off