%% DIFERENCIAS FINITAS

% Parámetros
L = pi;
M_df  = 0;                     % M+1 = 41                    
dx = L/(M_df+1);                
x = (1:M_df)'*dx;              

T     =  1;                      
N_df = 1000;                   % N+1 = 1001
dt = T/(N_df+1);               
d = dt/(dx^2);              

% Construir matriz A 
e = ones(M_df,1);
A = spdiags([d*e, (1-2*d)*e, d*e], -1:1, M_df, M_df);

% Condición inicial f(x)
u_x0  = (2/pi)*x .* (x <= L/2) + (2/pi)*(L - x) .* (x > L/2);

% Iteración temporal 
u  = u_x0;
for j = 1:(N_df+1)
    u = A*u;
end

xDiferenciasFinitas = x;
uDiferenciasFinitas = u;

% Representación
figure;
plot(xDiferenciasFinitas, uDiferenciasFinitas, '-o','LineWidth',1.2);
xlabel('x');
ylabel('u(x,T)');
title(sprintf('Esquema DF: u(x, %.2f) con M+1=%d, N+1=%d', T, M_df+1, N_df+1));
grid on

