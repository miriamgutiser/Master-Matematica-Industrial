%Método que genera muestras de una normal bidimensional con vector de medias y matriz
% de covarianzas dados a partir de muestras de uniforme generadas con rand de Matlab

function muestras = normal_bidimensional(mu, Sigma, N)
    L = chol(Sigma, 'lower');  %descomposición Choleski, L triangular inferior
    Z = randn(2, N);  %componentes de Z
    muestras = (L * Z) + mu; 
end

