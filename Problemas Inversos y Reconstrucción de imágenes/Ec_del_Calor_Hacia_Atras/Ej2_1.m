%% Apartado 1 – Aproximación u(x,0.4) por diferencias finitas

% Parámetros
L = pi;            
Mdf = 40;           
Ndf = 400;           
T   = 0.4;           

dx = L / (Mdf+1);
dt = T / (Ndf+1);
d = dt / dx^2;          % 0 < d < 1/2

% malla interior para Diferencias Finitas
xDiferenciasFinitas = (1:Mdf)' * dx;

% matriz tridiagonal A_df
e  = ones(Mdf, 1);
A_df = spdiags([d*e, (1-2*d)*e, d*e], -1:1, Mdf, Mdf);

% Condición inicial
fDiferenciasFinitas = (2/pi)*xDiferenciasFinitas .* (xDiferenciasFinitas <= L/2) ...
    + (2/pi)*(L - xDiferenciasFinitas) .* (xDiferenciasFinitas > L/2);

%Iterar esquema Diferecnias Finitas hasta t = 1
% t = (Ndf +1)dt = (Ndf +1)T/(Ndf+1) = T = 1
u = fDiferenciasFinitas;
for j = 1:(Ndf+1)
  u = A_df * u;
end
uDiferenciasFinitas = u;   

% Interpolar en la malla deseada M = 30
M = 30;
xi = (0:M)' * (L/M);      % nodos xi = iL / M, i=0,...,M

% Construir vector de datos u_aprox en xi:
u_aprox = zeros(M+1,1);
u_aprox(2:end-1) = ...                         %u(0,t)=u(pi,t)=0 
   spline(xDiferenciasFinitas, uDiferenciasFinitas, xi(2:end-1)); 

save('datos_T04_M30.mat','xi','u_aprox')

% Gráfica
figure;
plot(xi, u_aprox, 'o-','LineWidth',1.2); xlabel('x_i'); ylabel('u(x_i,0.4)');
title('Valores aproximados de u(x,0.4) para M=30 (Diferencias Finitas M = 40,N = 400)');
grid on


           
