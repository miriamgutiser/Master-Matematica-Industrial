function [u,sigma] = housecero(x)
%HOUSECERO Crea ceros en un vector usando una matriz Householder.
%[u,sigma] = housecero(x) produce un vector u
%que define una matriz Householder H, y una constante sigma
%tal que Hx = [sigma, 0, ...., 0]'.
%input : vector x
%output : vector u, y constante sigma
[m,n] = size(x);
 mm = max(abs(x));
 x = x/mm;
 s = sign(x(1));
 if s == 0
 s = 1;
 end
 sigma = s * norm(x,2);
 u = x + sigma * eye(m,1);
 sigma = -mm * sigma; 