%% Apartado 5 - Perturbación del vector G

load ("datos_T04_M30.mat");

% Matriz A para M=30, N=10, T=0.4
L  = pi;
M  = 30;         
N  = 10;          
T  = 0.4;         
dy = L / M;
yi = (0:M)' * dy;

w = ones(M+1,1);
w(2:end-1) = 2;

% A(i,j)
A = zeros(M+1);
for i = 1:M+1
    x_i = (i-1)*dy;
    for j = 1:M+1
        y_j = (j-1)*dy;
        s = 0;
        for n = 1:N
            s = s + exp(-(n*pi)^2 * T / L^2) * ...
                    sin(n*pi*x_i / L) * sin(n*pi*y_j / L);
        end
        Kij      = (2/L) * s;
        A(i,j)   = (L/(2*M)) * w(j) * Kij;
    end
end

% Perturbación de G con error  |eps_i| <= 0.01*max(G)
rng(0);
eps_max = 0.01 * max(u_aprox);
epsilon = (2*rand(size(u_aprox)) - 1) * eps_max;
G_per = u_aprox + epsilon;

% Solución por Tikhonov y Tikhonov iterado
alpha_per = 1e-3;                
x0_per = tikhonov(A, G_per, alpha_per);             % Tikhonov 0
x1_per = tikhonov_iterado(A, G_per, alpha_per,1);   % Tikhonov 1
x2_per = tikhonov_iterado(A, G_per, alpha_per, 2);  % Tikhonov 2

% Solución por Landweber 
mu = 0.95 / norm(A'*A);      
n  = [10, 80, 300];
phi_1 = landweber(A, G_per, mu, n(1));
phi_2 = landweber(A, G_per, mu, n(2));
phi_3 = landweber(A, G_per, mu, n(3));

f_inicial = (2/pi)*xi .* (xi<=pi/2) + (2/pi)*(pi - xi) .* (xi>pi/2);


% Gráfica
figure;
hold on
plot(xi, f_inicial, 'k-', 'LineWidth', 1, 'DisplayName', 'Exacta');
plot(xi, x0_per, 'ro-', 'LineWidth', 1, 'MarkerSize', 4, 'DisplayName', 'Tikhonov 0');
plot(xi, x1_per, 'gs-', 'LineWidth', 1.2, 'MarkerSize', 4, 'DisplayName', 'Tikhonov 1');
plot(xi, x2_per, 'bd-', 'LineWidth', 1, 'MarkerSize', 4, 'DisplayName', 'Tikhonov 2');
legend('Exacta','Tikhonov 0','Tikhonov 1','Tikhonov 2','Location','northeast');
title(sprintf('Solución sistema por método de Tikhonov con vector G perturbado (alpha=%.0e)', alpha_per));
xlabel('x_i'); ylabel('f(x_i)');
grid ('on'); hold off

figure
hold on
plot(xi, f_inicial, 'k-', 'LineWidth',2);
plot(xi, phi_1, 'r*-', 'LineWidth',1,'MarkerSize',4);
plot(xi, phi_2, 'g*-', 'LineWidth',1,'MarkerSize',4);
plot(xi, phi_3, 'b*-', 'LineWidth',1,'MarkerSize',4);
legend('Exacta', sprintf('Landweber %d', n(1)), sprintf('Landweber %d', n(2)), sprintf('Landweber %d', n(3)), 'Location','northeast');
title(sprintf('Solución sistema por método de Landweber con perturbación en G (mu = %.5f)', mu));
xlabel('x'); ylabel('f(x)');
grid on; hold off



