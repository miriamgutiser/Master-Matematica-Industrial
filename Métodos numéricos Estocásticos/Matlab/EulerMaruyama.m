function Y = EulerMaruyama(T, N, Y0, alpha, beta)
    % Método de Euler-Maruyama
    % Variables:
    %   -T: Tiempo total
    %   - N: Número de pasos de tiempo
    %   -Y0: Condición inicial
    %   -alpha y beta conocidos
   
    dt = T / N;             % Tamaño del paso
    Y = zeros(1, N + 1);    % Inicializar solución
    Y(1) = Y0;              % Condición inicial

    for t = 1:N
        dW = sqrt(dt) * randn;  % Incremento browniano
        Y(t + 1) = Y(t) + alpha(t * dt, Y(t)) * dt + beta(t * dt, Y(t)) * dW;
    end
end
