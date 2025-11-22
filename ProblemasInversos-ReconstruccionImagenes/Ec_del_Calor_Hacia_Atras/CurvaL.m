%% Selección del parámetro alpha por curva L en Ej2_2


load('datos_T04_M30.mat','xi','u_aprox');   

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
alpha_vals = [1e-2, 1e-5, 1e-8];
G = u_aprox;  
x = zeros (length(alpha_vals), 1);
y = zeros (length(alpha_vals), 1);
F_alphas = zeros(length(G), 3);

for k = 1:length(alpha_vals)
    alpha = alpha_vals(k);
    F = tikhonov(A, G, alpha); 
    F_alphas(:,k) = F;
    x(k) = log(norm(A*F-G));
    y(k) = log(norm(F));

end
 figure; 
 plot(x, y, 'ko','LineWidth',1.5,'MarkerSize',4);
 xlabel('$\log(\|AF - G\|)$', 'Interpreter','latex');
 ylabel('$\log(\|F\|)$', 'Interpreter','latex');
title(sprintf('Curva L para alpha = %.0e, %.0e, %.0e', ...
      alpha_vals(1), alpha_vals(2), alpha_vals(3)));

% Etiquetar los puntos con el valor de alpha correspondiente
for i = 1:length(alpha_vals)
    text(x(i)*0.98, y(i),[ num2str(alpha_vals(i), '%.0e')], 'FontSize', 10);
end
