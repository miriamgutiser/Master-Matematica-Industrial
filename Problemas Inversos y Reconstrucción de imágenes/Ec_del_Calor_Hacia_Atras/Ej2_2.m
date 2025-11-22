%% Apartado 2 - Resolución sistema AF = G (M = 30 y N = 10) por método de Tikhonov

load('datos_T04_M30.mat','xi','u_aprox');   % xi: [0,pi] con M=30, u_aprox=G

% Matriz A para M=30, N=10, T=0.4
L  = pi;
M  = 30;         
N  = 10;          
T  = 0.4;         
dy = L / M;
yi = (0:M)' * dy;

% Trapecio compuesto
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

% Parámetro de Tikhonov y solución regularizada
alpha = 1e-5;                   
G = u_aprox;                    
F = tikhonov(A, G, alpha);  

% Temperatura inicial exacta 
f_inicial   = (2/pi)*xi .* (xi<=pi/2) + (2/pi)*(pi - xi) .* (xi>pi/2);

% Representación 
figure
plot(xi, f_inicial, 'k-', 'LineWidth', 1.5), hold on
plot(xi, F,'ro-', 'LineWidth', 1.2, 'MarkerSize',4)
xlabel('x_i'), ylabel('f(x_i)')
legend('f\_exacta','f\_reconstruida'), 
title(sprintf('Solución del sistema por método de Tikhonov  (alpha = %.0e)',alpha))
grid on
hold off
