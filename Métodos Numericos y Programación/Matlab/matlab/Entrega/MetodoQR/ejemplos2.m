% Ejemplo 1: Sistema sobre determinado
A1 = [2, 1; 1, -1; 1, 1];
b1 = [3; 0; 4];
[x1, conv1] = lsquares(A1, b1);
fprintf('Solución del sistema 1:\n');
if conv1 == 0
    disp(x1);
else
    fprintf('No se pudo resolver el sistema.\n');
end
% Ejemplo 2: Sistema subdeterminado
A2 = [1, 0; 0, 1; 1, 1];
b2 = [1; 2; 3];
[x2, conv2] = lsquares(A2, b2);
fprintf('Solución del sistema 2:\n');
if conv2 == 0
    disp(x2);
else
    fprintf('No se pudo resolver el sistema.\n');
end
% Ejemplo 3: Sistema con ruido en los datos
A3 = [1, 1; 1, -1; 1, 0];
b3 = [2.1; 0.9; 1.1];
[x3, conv3] = lsquares(A3, b3);
fprintf('Solución del sistema 3 (con ruido):\n');
if conv3 == 0
    disp(x3);
else
    fprintf('No se pudo resolver el sistema.\n');
end
% Ejemplo 4: Sistema cuadrado
A4 = [3, 2, -1; 2, -2, 4; -1, 0.5, -1];
b4 = [1; -2; 0];
x4 = lsquares2(A4, b4);
fprintf('Solución del sistema 4 (matriz cuadrada):\n');
disp(x4)