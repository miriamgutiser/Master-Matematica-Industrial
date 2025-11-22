% Metodo que estima la esperanza de variable aleatoria X^2+3X-3

function [mu, IC] = estimar_esperanza(N)
    X = rand(1, N);
    fX = X.^2 + 3*X - 3;
    mu = mean(fX);  %media artimética: estimación de la esperanza de fX
    sigma = std(fX); %desviación estándar de fX
    z = 1.96; % Para 95% de confianza
    IC = [mu - z*sigma/sqrt(N), mu + z*sigma/sqrt(N)]; %intervalo de confianza
end

