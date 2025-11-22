% Function defining the differential equation y' = f(x, y).
%
% This function returns the value of f(x, y) for a given x and vector y.

function vf = f(x, y)
    %Ejercicio 2
     %vf = [2 .* x .* y(4) .* y(1), 10 .* x .* y(4) .* y(1).^5,...
         2 .* x .* y(4), -2 .* x .* (y(3) - 1)];

    %Ejercicio 3
    vf = exp(-x).*y.^2 - y;
    % vf = 0 .* x + y;

    %vf = [- x .* y(1) .* y(2), (log(y(1)) - y(2)) ./ x];

    %Ejercicio 1
    %vf = [y(2), -y(1) + cos(3.*x)];
end