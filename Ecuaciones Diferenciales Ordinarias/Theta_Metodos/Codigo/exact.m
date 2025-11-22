% Exact solution of the initial value problem (IVP).
% 
% This function returns the exact solution for a given IVP at specified points x.

function vexact = exact(x)

    %Ejercicio 2
    %vexact = [exp(sin(x.^2)), exp(5 .* sin(x.^2)), sin(x.^2) + 1, cos(x.^2)];

    % vexact = exp(x);

    %Ejercicio3
    vexact = 2 ./ (exp(-x) + exp(x));
    
    %vexact = [exp(cos(x)), sin(x) ./ x];

    %Ejercicio 1
    %vexact = 9/8.*cos(x) - 1/8.*cos(3.*x);
end