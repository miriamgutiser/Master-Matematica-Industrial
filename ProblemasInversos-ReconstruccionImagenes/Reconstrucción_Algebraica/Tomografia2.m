
%25 ángulos comprendidos entre [0,180]
load('DatosTomografia2.mat')

%Dimensión de la imagen
n = 70;

%Método de Tiknhonov con distintos valores de alpha

%Valores de alpha 
valores_alpha = [1e-5, 1e-3, 0.1, 1];

for i = 1: length(valores_alpha)
    alpha = valores_alpha(i);

    F_alpha = tikhonov(A, R(:), alpha);

    figure;
    pcolor(reshape(F_alpha, n, n)); shading interp; colormap(gray);
    title(['Método de Tikhonov: alpha = ', num2str(alpha)]);

end

%SVD truncado con distintos valores de m 

% Obtener y mostrar todos los valores singulares
[~, S, ~] = svd(A);
valores_singulares = diag(S);

figure;
plot(valores_singulares, 'LineWidth', 1.5) 
xlabel('Índice en la matriz');
ylabel('Valor singular');
title('Valores singulares de A');
grid on;

valores_m = [200, 1000, 2000];
for i = 1: length(valores_m)
    m = valores_m(i);
    F_m = truncated_svd(A, R(:),m);

    figure;
    pcolor(reshape(F_m, n, n)); shading interp; colormap(gray);
    title(['Truncando la SVD de A: m = ', num2str(m)]);

end


 



