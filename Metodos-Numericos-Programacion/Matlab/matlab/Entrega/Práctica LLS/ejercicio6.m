%Hector Mendez Casuso
%72205079Y
%Práctica LLS
%Ejercicio 6

clear all
clc 
format short e

rng('default');
n = 28; m = 4*n; % dimensiones de la matriz
for j = 0:n-1
    s(j+1,1) = 2^(-j);
end

[V,R] = qr(randn(n));
[U,R] = qr( randn(m));
A = U(:,1:n)*diag(s)*V';
rank(A) %=28,  %rango maximo

xexacta = randn(n,1); b = A*xexacta; %Segun como esta definido b, x es la solucion exacta

bp = b+1e-6*norm(b)*U(:,n+1);
[xtilde, ifallo] = lsquares(A, bp);
norm(xtilde-xexacta)/norm(xexacta)  %   2.5944e-09
norm(A*xtilde-bp)   %     5.3960e-07
cond(A)             %    1.3422e+08

%RESOLVEMOS CON LE METODO DE LAS ECUACIONES NORMALES
[L, ind] = chol(A'*A, 'lower'); ind
[y, ifallo] = solvetrinf(L, A'*bp); ifallo
[xchol1, ifallo] = solvetrsup(L', y); ifallo

norm(xexacta-xchol1)/norm(xexacta) %   1.8234e-01
norm(A*xchol1-bp)                  %   5.3965e-07
cond(A'*A)                         %   1.8276e+16

%ATENCION: Los residuos son parecidos,
% pero NO la calidad de la solucion


%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>CASO II
n = 28; m = 4*n; %dimensiones de la matriz
AA=randn(m,n);
b = AA*x;

% Perturbamos los datos;
bp = b+1e-6*norm(b)*U(:,n+1);
rank(AA)
%---------------------------------------------------RESOLVEMOS CON LSQUARES
[xqr2, ifallo] = lsquares(AA, bp);
norm(xqr2-xexacta)/norm(xexacta)  %     6.1359e-07
norm(AA*xqr2-bp)                  %     4.7141e-05
cond(AA)                          %     3.0669e+00

%-----------------------RESOLVEMOS CON EL METODO DE LAS ECUACIONES NORMALES
[L2, ind2] = chol(AA'*AA, 'lower'); ind2
[y2, ifallo2] = solvetrinf(L2, AA'*bp); ifallo2
[xchol2, ifallo2] = solvetrsup(L2', y2); ifallo2

norm(xexacta-xchol2)/norm(xexacta) %    6.1359e-07
norm(AA*xchol2-bp)                 %    4.7141e-05
cond(AA'*AA)                       %    9.4058e+00

%La diferencia entre los problemas lo podemos ver con el cond(A'*A).
%En este segundo caso, el orden es de 1e+0, por tanto, la dificultad del
%problema es menor con respecto al primer caso, pues este era del orden de
%10e+16.