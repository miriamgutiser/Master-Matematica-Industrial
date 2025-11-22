% Función de Milstein para CIR
function rT = milstein_CIR(alpha, gamma, rho, r0, T, N, n)
    dt = T / N;
    rT = zeros(n, N + 1);
    rT(:, 1) = r0;

    for sim = 1:n
        for t = 1:N
            dW = sqrt(dt) * randn;
            r_t = rT(sim, t);
            r_nueva = r_t + alpha * (gamma - r_t) * dt ...
                    + rho * sqrt(max(r_t, 0)) * dW ...
                    + 0.5 * rho^2 * (1 / sqrt(max(r_t, 0))) * (dW^2 - dt);
            rT(sim, t + 1) = max(r_nueva, 0); %  evitar valores negativos
        end
    end
end