
%Parámetros
N = 50; %Tamaño de la matriz
Delta_x = 1 / (N-1);
[x, y] = meshgrid( (0:N-1)* Delta_x, (0:N-1) * Delta_x);
z = 0; %Valores de z*
w_values = linspace(0.1, 0.9, 10); % Porcentajes de datos eliminados (10% a 90%)



%Función f. 0<= x,y,z<=1
f = @(x, y, z) x.^2 .*(sin(5*pi*y + 3*log(x.^3 + y.^2 + z +pi^2)) -1).^2 -...
    4*x.^2 .*y.^3.*(1-z)^(3/2) + (x + z - 1) .* (2*y - z) .* cos(30*(x + z))...
    .* log(6 + x.^2.*y.^2 + z.^3);


A1 = f(x, y, z);
f_min1 = min(A1(:)); f_max1 = max(A1(:));
A1 = 2 * (A1 - f_min1) / (f_max1 - f_min1) - 1;
elems1 = rand(N, N) > w;
A1_gappy = A1 .* elems1;


% Parámetros
N = 50; % Tamaño de la matriz
m = 5; % Número fijo de modos para SVD
max_iter = 1000;
tol = 1e-6;



A_rec_media = truncated_svd(A1_gappy, m, max_iter, tol);
A_rec_aleatoria = truncated_svd2(A1_gappy, m, max_iter, tol);

RMSE_media = (1/N) *norm(A1- A_rec_media, 'fro');
disp(RMSE_media)
RMSE_aleatorio = (1/N) *norm(A1 - A_rec_aleatoria, 'fro');
disp(RMSE_aleatorio)

figure;


subplot(1,2,1); pcolor(abs(A1- A_rec_media)); shading interp; colormap('gray'); 
colorbar; title('Error con inicialización media'); 


subplot(1,2,2);
pcolor(abs(A1 - A_rec_aleatoria));  shading interp; colormap('gray'); 
colorbar; title('Error con inicialización aleatoria');



