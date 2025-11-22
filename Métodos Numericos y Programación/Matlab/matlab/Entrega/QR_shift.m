function Ak=QR_shift(A,nmax,toll,n_it);
%_________________________________________________________________________________________
%
% Función: QR_shift
% ___________________
%
%
%
%    Llamadas:  Ak=QR_shift(A,nmax,toll,n_it);
%               Ak=QR_shift(A,nmax,toll);  
% 
%    Comentario:
%
%    La función 'QR_shift' implementa el método QR sin desplazamiento (para las 
%    primeras n_it iteraciones) y con desplazamiento (para las siguientes) para calcular los
%    autovalores de la matriz A. El desplazamiento en la (n-k+1)-ésima iteración coincide 
%    con el elemento B(k,k), donde B es la matriz transformada por el método en 
%    dicha iteración.
%    Para reducir la complejidad computacional, la matriz A debe transformarse previamente
%    en una matriz de tipo Hessenberg superior mediante el comando 
%    MATLAB 'hess(A)'.
%
% Parámetros de entrada:
% ____________________
%
% A       matriz, de tamaño n x n, de la cual se desean calcular los autovalores; 
% nmax    número máximo de iteraciones permitidas;
% toll    tolerancia para el criterio de parada;
% n_it    número de iteraciones a realizar con el método QR sin desplazamiento.
%
% Nota:   Si n_it = nmax, implementa el método QR sin desplazamiento;
%         si n_it = 0, o si n_it no se especifica, implementa únicamente el método 
%         QR con desplazamiento;
%         si 0 < n_it < nmax, el método funciona como se describe anteriormente.
%
% Parámetros de salida:
% _____________________
%
% Ak      matriz n x n que aproxima, dentro de la tolerancia dada y en el caso  
%         de autovalores todos reales, una matriz triangular superior que 
%         contiene, en la diagonal principal, las aproximaciones de los 
%         autovalores de A. En el caso de que la matriz A tenga autovalores 
%         complejos, Ak aproxima, dentro de la tolerancia dada, una matriz
%         de tipo triangular por bloques (2 x 2) en la diagonal. 
%         Los autovalores complejos conjugados de dichos bloques 2 x 2 
%         son las aproximaciones de los autovalores complejos de A.
%____________________________________________________________________________________
%
% Ejemplos de uso de la función:
% ___________________________________
%
% Desplazamiento desde el principio y para todas las 
% iteraciones
%
% A1=[4 -1 -1 -1 ; -1 4 -1 -1; -1 -1 4 -1; -1 -1 -1 4 ];
% A=hess(A1);  % transformación de A1 en una matriz de tipo Hessenberg superior
%              % (en este caso, debido a la simetría, es tridiagonal simétrica)
% nmax=80;
% toll=1.e-14;
% Ak=QR_shift(A,nmax,toll,0); % Ak=QR_shift(A,nmax,toll); 
% ___________________________________
%
% 3 iteraciones QR sin desplazamiento, las 
% siguientes con desplazamiento
%
% A1=[4 -1 -1 -1 ; -1 4 -1 -1; -1 -1 4 -1; -1 -1 -1 4 ];
% A=hess(A1);  % transformación de A1 en una matriz de tipo Hessenberg superior
%              % (en este caso, debido a la simetría, es tridiagonal simétrica)
% nmax=80;
% toll=1.e-14;
% n_it=3;
% Ak=QR_shift(A,nmax,toll,n_it);
%___________________________________________________________________________________
%
if nargin==3 | isempty(n_it)
    n_it=0;
end
[n,m]=size(A);
Ak=[];
if n~=m;
    disp('Matriz no cuadrada')
    Ak=[];
    return
end
Ak=zeros(n);
B=A;
for k=n:-1:2
    it=0;
    I=eye(k);
    s=abs(B(k,k-1));
    while s > toll*(abs(B(k,k))+abs(B(k-1,k-1))) & it < nmax
       it=it+1;
       if it <= n_it        % método QR clásico
           [Q,R]=qr(B);
           B=R*Q;
           s=abs(B(k,k-1));
           
       else                 % método QR con desplazamiento
           mu=B(k,k);  
           [Q,R]=qr(B-mu*I);
           B=R*Q+mu*I; 
           s=abs(B(k,k-1));
       end
    end
    %fprintf('\n%2d° Autovalor         : %18.10e \n',n-k+1,B(k,k));
    %fprintf(' Número de Iteraciones  : %3d \n',it);
    %fprintf(' Elemento extradiagonal s : %10.3e\n',s);
    Ak(1:k,k)=B(:,end);
    Ak(k,k-1)=s;
    B=B(1:k-1,1:k-1);
    if it==nmax
        fprintf('Superado el número máximo de iteraciones en el cálculo del %2d° autovalor \n',n-k+1);
    end
end
Ak(1,1)=B;    
%fprintf('\n%2d° Autovalor         : %18.10e \n',n,B);
str=[];
for i=1:n
    str=[str ' %22.10e '];
end
fprintf('\n Matriz que contiene los autovalores: \n Ak = \n');
fprintf( [str '\n'],Ak');
