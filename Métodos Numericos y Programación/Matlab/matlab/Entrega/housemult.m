function A = housemult(A,u)
%HOUSEMULT Postmultiplica una matriz por una matriz
%Householder H
%A = housemult(A,u) calcula AH, donde H es una matriz
%Householder generada por un vector u.
%La matrix resultante A contiene el producto AH.
%input : Matriz A y vector u
%output : Matriz A
[m1,n] = size(A);
 beta = 2/(u'*u);
     for i = 1 : m1
     s = 0;
     s = s + u(1:n) * A(i,1:n);
     s = beta * s;
     A(i,1:n) = A(i,1:n) - (s*u(1:n))';
     end
end