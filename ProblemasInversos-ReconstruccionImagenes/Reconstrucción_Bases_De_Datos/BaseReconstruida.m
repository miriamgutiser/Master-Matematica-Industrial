%Comparación gráfica de las 3 matrices
m = 5;
max_iter = 1000;
tol = 1e-6;
A_rec = truncated_svd(A1_gappy, m, max_iter, tol);

figure;
set(gcf, 'Position', [100, 100, 1150, 300]);

subplot(1,3,1); pcolor(A1); shading interp; colormap('gray'); colorbar; title('A1'); 
subplot(1,3,2); pcolor(A1_gappy); shading interp; colormap('gray'); colorbar; title('A1_{gappy}'); 
subplot(1,3,3); pcolor(A_rec); shading interp; colormap('gray'); colorbar; title('A1_{reconstruida}'); 

RMSE = (1/N) *norm(A1 - A_rec, 'fro'); %Norma frobenius, ||.||_2
MaxE = max(abs(A1(:) - A_rec(:)));
disp(['Error máximo (maxE): ', num2str(MaxE)]);
disp(['Error cuadrático medio(RMSE): ', num2str(RMSE)]);