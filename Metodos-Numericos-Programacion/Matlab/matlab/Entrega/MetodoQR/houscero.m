function [h,sigma,normh2] = houscero(x) 
% housecero - metodo para determina una matriz de Householder 
% que transforma un vector x en un multiplo de la primera columna de la matriz identidad. 
% No se construye la matriz de HouseHolder, basta dar el vector h que la determina
%
%   [h,sigma,normh2] = houscero(x) permite especificar:
%           -x: vector que se desea transformar.
%           -h : vector que determina la matriz de Householder H 
% tal que Hx = [sigma, 0, ...., 0]'. 
%           -sigma: escalar que determina el vector transformado.
%           -normh2: cuadrado de la norma 2 del vector h
%
%
  s = length(x);
  t = norm(x, inf);
  x= x / t; % escalamos x para evitar posible overflow
  signo = sign(x(1));
  if signo == 0
     signo = 1;
  end
  normx2 = x(2:s)' * x(2:s);
  sigma = signo * sqrt(x(1) * x(1)+normx2); %signo*norm(x,2);
  h = x;
  h(1) = x(1) + sigma;
  normh2 = h(1) * h(1)+normx2;
  sigma = -t * sigma; %usando el escalamiento
