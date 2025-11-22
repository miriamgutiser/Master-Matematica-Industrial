%% ESPECTRAL

% Parámetros 
L= pi;
M = 15;        % número de subintervalos para el trapecio
N = 5;         % número de términos en el truncamiento
T = 0.1;       % instante final

% Pasos en y y nodos
dy = L / M;
yi = (0:M)' * dy;      % j = 0..M

% Vector F = [f(y0); f(y1); …; f(yM)]
F = (2/pi)*yi .* (yi<=L/2) + (2/pi)*(L - yi) .* (yi > L/2);

% Pesos del trapecio
w = ones(M+1,1);
w(2:end-1) = 2;

% Prealoca A
A = zeros(M+1, M+1);

% Monta A(i,j) = (L/(2M)) * w(j) * K_N(x_i,y_j,T)
for i = 1:(M+1)
  x_i = (i-1)*dy;
  for j = 1:(M+1)
    y_j = (j-1)*dy;
    % truncamiento de la serie
    s = 0;
    for n = 1:N
      s = s + exp(- (n*pi)^2 * T / L^2) * sin(n*pi*x_i/L) * sin(n*pi*y_j/L);
    end
    Kij = (2/L) * s;
    A(i,j) = (L/(2*M)) * w(j) * Kij;
  end
end

G = A * F;

% Representación
xi = (0:M)' * dy;
figure
plot(xi, G, '-o','LineWidth',1.2)
xlabel('x_i')
ylabel('G_i = g(x_i)')
title(sprintf('Solución directa: A F = G, con M=%d, N=%d, T=%.2f', M, N, T))
grid on

uEspectral = spline(xDiferenciasFinitas, uDiferenciasFinitas,xi);

err_rel = max(abs(G - uEspectral)) / max(abs(uEspectral));
fprintf('Error relativo cuando T = 0.1 = %2e/n',err_rel);


