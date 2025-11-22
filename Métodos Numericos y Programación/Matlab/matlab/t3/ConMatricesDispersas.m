% Dimensiones de las matrices dispersas
mdim = [100, 500, 1000, 2000];
rep = 10; % Número de repeticiones por cada dimensión

% Inicializar vectores para guardar tiempos de ejecución promedio
tr = zeros(size(mdim)); % Tiempos para la función remonte
tb = zeros(size(mdim)); % Tiempos para el operador backslash '\'

% Función para estimar el exponente p en la complejidad O(n^p)
p_estim = @(n, t) log(t(2:end) ./ t(1:end-1)) ./ log(n(2:end) ./ n(1:end-1));

for i = 1:length(mdim)
    totalr = 0;
    totalb = 0;
    for r = 1:rep
        % Generar matriz dispersa inversible
        A_sparse = sprandsym(mdim(i), 0.05, 1, 1); % Matriz dispersa con 5% de densidad
        I = 2 * speye(size(A_sparse)); % Valores adicionales en la diagonal
        A = triu(A_sparse + I); % Matriz triangular superior
        b = rand(mdim(i), 1); % Vector columna de términos independientes

        % Calcular tiempo para el método remonte
        tic;
        x = remonte(A, b);
        disp(['remonte: ' num2str(mdim(i)) ',' num2str(norm(A*x-b))])
        totalr = totalr + toc;

        % Calcular tiempo para el operador backslash '\'
        tic;
        x = A \ b;
        disp(['backslash: ' num2str(mdim(i)) ',' num2str(norm(A*x-b))])
        totalb = totalb + toc;
    end
    % Calcular tiempo promedio
    tr(i) = totalr / rep;
    tb(i) = totalb / rep;
end

% Estimación del exponente p de la complejidad O(n^p)
pr = p_estim(mdim, tr);
pb = p_estim(mdim, tb);
mdim_avg = (mdim(2:end) + mdim(1:end-1)) / 2; % Tamaño de matriz promedio entre pares consecutivos

% Gráfica de comparación de tiempos
figure;
subplot(1, 2, 1);
plot(mdim, tr, '-o', mdim, tb, '-x');
xlabel('Dimensión de la matriz');
ylabel('Tiempo (s)');
title('Comparativa de tiempos de ejecución');
legend('Remonte', 'backslash');

% Gráfica de estimación del exponente p de la complejidad O(n^p)
subplot(1, 2, 2);
plot(mdim_avg, pr, '-o', mdim_avg, pb, '-x');
xlabel('Dimensión de la matriz promedio');
ylabel('Estimación de p');
title('Estimación del exponente p en la complejidad O(n^p)');
legend('Remonte', 'backslash');


%Metodo Remonte
function x = remonte(A, b)
% remonte - Solución de un sistema de ecuaciones lineales triangular superior
%   usando el método de sustitución hacia atrás.
%
%     x = remonte(A, b) resuelve el sistema de ecuaciones lineales Ax = b,
%     donde A es una matriz triangular superior (nxn) y b es un vector
%     columna (nx1) de términos independientes.
%
%   Ejemplo de uso
%     A = [3, 2, -1; 0, 1, 4; 0, 0, 2];
%     b = [5; 6; 4];
%     x = remonte(A, b)
%
%   Limitaciones
%     - La matriz A debe ser triangular superior. Si se proporciona una
%       matriz que no sea triangular superior, la función generará un error.
    arguments
        A (:,:) double {mustBeNumeric, mustBeTriangularUpper}
        b (:,1) double {mustBeNumeric}
    end
    n = length(b);
    x = zeros(n, 1);
    x(n) = b(n) / A(n, n);

    for i = n-1:-1:1
        x(i) = (b(i) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
    end
end

function mustBeTriangularUpper(A)
% Función de validación que verifica si la matriz es triangular superior
    if ~istriu(A)
        error('La matriz A debe ser triangular superior.');
    end
end