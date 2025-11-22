% Función de Euler-Maruyama para CIR
% Se adapta el código del ejercicio anterior para que obtenga con n simulaciones los
% resultados
function rT = euler_maruyama_CIR(alph, gamma, rho, r0, T, N, n)
    dt = T / N;
    rT = zeros(n, N + 1);
    rT(:, 1) = r0;

    for sim = 1:n
        for t = 1:N
            dW = sqrt(dt) * randn;
            r_nueva = rT(sim, t) + alph * (gamma - rT(sim, t)) * dt ...
                    + rho * sqrt(max(rT(sim, t), 0)) * dW;
            rT(sim, t + 1) = max(r_nueva, 0); %para que no salgan valores negativos
        end
    end
end