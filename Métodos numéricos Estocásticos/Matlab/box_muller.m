%Elaborar un programa de Matlab que genere a partir de ellas muestras de 
% la N (µ.σ 2 ) a partir de muestra de uniforme generadas con rand de
% Matlab. Utilizamos el método de Box_muller para simular distribuciones
% normales estándar Z y definimos X = mu + sigma*Z. 

function muestra = box_muller(mu, sigma, N)
    U1 = rand(1, N/2);
    U2 = rand(1, N/2);
    Z1 = sqrt(-2 * log(U1)) .* cos(2 * pi * U2);
    Z2 = sqrt(-2 * log(U1)) .* sin(2 * pi * U2);
    muestra = [Z1, Z2] * sigma + mu;
end


