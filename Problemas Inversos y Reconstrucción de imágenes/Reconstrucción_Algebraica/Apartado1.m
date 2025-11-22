%Apartado 1

%1. Dibuja el sinograma proporcionado
load('DatosTomografia1.mat')
figure;
imagesc(R); colormap('gray'); colorbar; xlabel('Ángulo'); ylabel('Detector');
title('Sinograma');


%2. Resuelve el sistema correspondiente: AF = R(:)
% y representa la imagen obtenida

F = A \ R(:);

figure; pcolor(reshape(F, 70, 70)); shading interp; colormap('gray');
title('Imagen reconstruida sin regularización');
