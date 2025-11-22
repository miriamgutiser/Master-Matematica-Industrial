%Hector Mendez Casuso
%72205079Y
%Práctica LLS
%Ejercicio 6, parte 2

clear all
clc 
format short e

% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>CASO n = 30
n = 30; m = 4 * n; % dimensiones de la matriz
rng('default');
for j = 0:n-1
    s(j+1,1) = 2^(-j);
end

[V,R] = qr(randn(n));
[U,R] = qr( randn(m));
A = U(:,1:n)*diag(s)*V';
rank(A) %=30,  %rango maximo

xexacta = randn(n,1); b = A*xexacta; %Segun como esta definido b, x es la solucion exacta

bp = b+1e-6*norm(b)*U(:,n+1);
[xtilde, ifallo] = lsquares(A, bp);
norm(xtilde-xexacta)/norm(xexacta)  %     1.5655e-07
norm(A*xtilde-bp)                   %     6.3089e-07
cond(A)                             %     5.3687e+08


%RESOLVEMOS CON LE METODO DE LAS ECUACIONES NORMALES
[L, ind] = chol(A'*A, 'lower'); ind %29
[y, ifallo] = solvetrinf(L, A'*bp); ifallo
[xchol1, ifallo] = solvetrsup(L', y); ifallo
% A'*A COMPUTACIONALMENTE NO ES DEFINIDA POSITIVA

%------------------------------------------RESOLVEMOS CON QR CON PIVOTACION
[Q, R, p] = qr(A,'vector'),p
r = rank(A)
[xP, ifallo] = solvetrsupMOD(R(1:r,1:r),(Q(1:m,1:r)'*bp))
if r < n
    xP = [xP; zeros(n-r,1)];
end
xP(p)=xP %aplico la pivotacion (es pivotaciond e columnas)

%-----------------------RESOLVEMOS CON EL METODO DE LAS ECUACIONES NORMALES
[L, ind] = chol(A'*A, 'lower'); ind %28
                          %A'*A COMPUTACIONALMENTE NO ES DEFINIDA POSITIVA


% % %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>CASO n=47
% % clc
% % clear all
% % 
% % n = 47; m = 4 * n; % dimensiones de la matriz
% % rng('default');
% % for j = 0:n-1
% %     s(j+1,1) = 2^(-j);
% % end
% % 
% % [V,R] = qr(randn(n));
% % [U,R] = qr( randn(m));
% % A = U(:,1:n)*diag(s)*V';
% % rank(A) %=30,  %rango maximo
% % 
% % xexacta = randn(n,1); b = A*xexacta; %Segun como esta definido b, x es la solucion exacta
% % 
% % bp = b+1e-6*norm(b)*U(:,n+1);
% % [xtilde, ifallo] = lsquares(A, bp);
% % norm(xtilde-xexacta)/norm(xexacta)  %     1.5655e-07
% % norm(A*xtilde-bp)                   %     6.3089e-07
% % cond(A)                             %     5.3687e+08
% % 
% % 
% % %RESOLVEMOS CON LE METODO DE LAS ECUACIONES NORMALES
% % [L, ind] = chol(A'*A, 'lower'); ind %45
% % [y, ifallo] = solvetrinf(L, A'*bp); ifallo
% % [xchol1, ifallo] = solvetrsup(L', y); ifallo
% % % A'*A COMPUTACIONALMENTE NO ES DEFINIDA POSITIVA 