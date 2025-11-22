function U = congruencia_lineal(N ,a, b, M, N_0)
% Metodo de congruencia lineal para generar muestras de una 
% uniforme.
U = zeros(1,N);
N = N_0;
for i = 1:N
    N = mod(a*N + b, M);
    U(i) = N / M; %Escalar para que las muestras esten entre [0,1]
end
end 