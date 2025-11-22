%Reconstrucción SVD truncada, con un número fijo m de modos
%Reconstrucción inicial con valores medios

function A_rec = truncated_svd (A_gappy, m, max_iter, tol)
    %Algoritmo iterativo para reconstrucción de matrices 'gappy' usando SVD

    %Parámetros:
    %   -A_gappy: Matriz con un cierto porcentaje de elementos vacíos
    %   -m: Número de modos fijos   
    %   -tol: tolerancia para la convergencia
    %   -max_iter: número maximo de iteraciones

    [~,N] = size(A_gappy);


    %Elementos eliminados de la matriz, valores 'gappy'
    elems = isnan(A_gappy);

    %Reconstrucción inicial A_0
    A_0 = A_gappy;

    % Opción 1: Usar la media de los valores conocidos (actual)
    valor_medio = mean(A_gappy(~elems), 'all');
    A_0(elems) = valor_medio; %Rellenamos los huecos con la media para que no sean NaN
    
    % Opción 2: Usar valores aleatorios en los huecos
    %A_0(elems) = rand(size(A_gappy(elems))) * 2 - 1; % Números entre -1 y 1

    A_rec = A_0;
    iter = 0;
    RMSE_prev = inf; 

    while iter < max_iter
        iter = iter + 1;

        %Aplicamos SVD a la matriz inicial
        [U, S, V] = svd(A_rec);

    
        % Extraer los valores singulares y ordenarlos
        valores_singulares = diag(S);
        [m_valores, idx] = sort(valores_singulares, 'descend');
        
        % Tomar los m valores singulares más grandes
        if m < length(m_valores)
            m_valores(m+1:end) = 0;
        end
        
        % Construir nueva matriz S con solo los m valores singulares más grandes
        S_trunc = zeros(size(S));
        for i = 1:min(m, length(m_valores))
            S_trunc(idx(i), idx(i)) = m_valores(i);
        end

        %Reconstruccion de los m modos principales
        A_s = U* S_trunc* V';

        %Restaurar los puntos 'non-gappy'
        A_s(elems) = A_gappy(elems);

         %Calculo error
        RMSE = (1/N) *norm(A_rec - A_s, 'fro'); %Norma frobenius, ||.||_2
        
        %Criterio de parada 
        if RMSE < tol
            break;
        end
        RMSE_prev = RMSE; 

        %Matriz reconstruida
        A_rec = A_s;
    end
end