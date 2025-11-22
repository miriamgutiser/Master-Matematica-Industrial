%Ejer3-T1. Matrices mal condiciondas
clc

A1 = [1 -6 7; 1 -5 0; 0 1 -5];
B = [2; 2; 2];
A2 = A1 + 0.03*(2*rand(3)-1);

%1. Resulve los sistemas A1*X1 = B y A2*X2 = B
x1= A1\B;
x2= A2\B;

%2. Calcula A1* X2 y A2*X1.¿Son parecidos a B?
disp('Resultados A1*X1 y A2*X2:')
A1*x1
A2*x2

%3. A1^-1 y A2^-1.¿Se parecen?
disp('Inversas de las matrices:')
inv(A1)
inv(A2)

%Condicionamiento de A1.
disp('Condicionamiento de A1:')
cond(A1)