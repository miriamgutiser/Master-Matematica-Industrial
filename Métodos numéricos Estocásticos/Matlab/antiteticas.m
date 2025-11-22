%Con variables antitéticas para reducir la varianza 
function [mu, IC] = antiteticas(N)
    U = rand(1, N);
    X1 = U;
    X2 = 1 - U; %porque es uniforme
    fX1 = X1.^2 + 3*X1 - 3;
    fX2 = X2.^2 + 3*X2 - 3;
    fX = (fX1 + fX2) / 2; %construccion estimador
    mu = mean(fX); %media
    sigma = std(fX); %varianza
    z = 1.96;
    IC = [mu - z*sigma/sqrt(N), mu + z*sigma/sqrt(N)];
end
