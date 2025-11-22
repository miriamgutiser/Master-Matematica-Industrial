%Resultados Euler-Maruyama y Milstein I

% Parámetros del modelo CIR
alpha = 0.3;
gamma = 0.04;
rho = 0.3;
r0 = 0.02;
T = 1;              
N = 100;            % Número de pasos de tiempo

disp('Resultados de CIR con Euler-Maruyama')
    % Euler-Maruyama
    r_euler1 = euler_maruyama_CIR(alpha, gamma, rho, r0, T, N, 10);
    mean_euler1 = mean(r_euler1);
    r_euler2 = euler_maruyama_CIR(alpha, gamma, rho, r0, T, N, 100);
    mean_euler2 = mean(r_euler2);
    r_euler3 = euler_maruyama_CIR(alpha, gamma, rho, r0, T, N, 1000);
    mean_euler3 = mean(r_euler3);
    disp('E(rt) con n=10')
    disp(mean_euler1)
    disp('E(rt) con n=100')
    disp(mean_euler2)
    disp('E(rt) con n=1000')
    disp(mean_euler3)

disp('Resultados de CIR con Milstein I')
    r_milstein1 = milstein_CIR(alpha, gamma, rho, r0, T, N, 10);
    mean_milstein1 = mean(r_milstein1);
    r_milstein2 = milstein_CIR(alpha, gamma, rho, r0, T, N, 100);
    mean_milstein2 = mean(r_milstein2);
    r_milstein3 = milstein_CIR(alpha, gamma, rho, r0, T, N, 1000);
    mean_milstein3 = mean(r_milstein3);
    disp('E(rt) con n=10')
    disp(mean_milstein1)
    disp('E(rt) con n=100')
    disp(mean_milstein2)
    disp('E(rt) con n=1000')
    disp(mean_milstein3)
