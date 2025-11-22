
%Parámetros
N = 50; %Tamaño de la matriz
Delta_x = 1 / (N-1);
[x, y] = meshgrid( (0:N-1)* Delta_x, (0:N-1) * Delta_x);
z_val = [0, 0.5, 1]; %Valores de z*

%Función f. 0<= x,y,z<=1
f = @(x, y, z) x.^2 .*(sin(5*pi*y + 3*log(x.^3 + y.^2 + z +pi^2)) -1).^2 -...
    4*x.^2 .*y.^3.*(1-z)^(3/2) + (x + z - 1) .* (2*y - z) .* cos(30*(x + z))...
    .* log(6 + x.^2.*y.^2 + z.^3);

%Transformación T : F(x,y,z) = T(f(x,y,z)) = 2.*(f(x,y,z) - f_min) ./
%(f_ma x- f_min) - 1

%Generación de las matrices
z1 = z_val(1); z2 = z_val(2); z3 = z_val(3);
A1 = f(x, y, z1); A2 = f(x, y, z2); A3 = f(x, y, z3);

%Construcción de las bases de datos
f_min1 = min(A1(:)); f_max1 = max(A1(:));
f_min2 = min(A2(:)); f_max2 = max(A2(:));
f_min3 = min(A3(:)); f_max3 = max(A3(:));

A1 = 2 * (A1 - f_min1) / (f_max1 - f_min1) - 1;
A2 = 2 * (A2 - f_min2) / (f_max2 - f_min2) - 1;
A3 = 2 * (A3 - f_min3) / (f_max3 - f_min3) - 1;

%Generación bases de datos 'gappy' A1, A2, A3
w = 0.3;  %Porcentaje de elementos eliminados
%Eliminar aleatoriamente el procentaje de elementos de la base de datos
elems1 = rand(N, N) > w;
elems2 = rand(N, N) > w;
elems3 = rand(N, N) > w;
A1_gappy = A1 .* elems1;
A2_gappy = A2 .* elems2;
A3_gappy = A3 .* elems3;

%Resultados 
figure;
set(gcf, 'Position', [100, 100, 1050, 650]);

    %Bases de datos 
subplot(2,3,1); pcolor(A1); shading interp; colormap('gray'); colorbar; title('A1 (z=0)');
subplot(2,3,2); pcolor(A2); shading interp; colormap('gray'); colorbar; title('A2 (z=0.5)');
subplot(2,3,3); pcolor(A3); shading interp; colormap('gray'); colorbar; title('A3 (z=1)');
    %Bases de datos 'gappy'
subplot(2,3,4); pcolor(A1_gappy); shading interp; colormap('gray'); colorbar; title('A1 (Gappy)');
subplot(2,3,5); pcolor(A2_gappy); shading interp; colormap('gray'); colorbar; title('A2 (Gappy)');
subplot(2,3,6); pcolor(A3_gappy); shading interp; colormap('gray'); colorbar; title('A3 (Gappy)');