% Function defining the ODE y'=f(x,y)
function vf = f(x,y)
% vf = [y(2),cos(3.*x)-y(1)];
vf = [2.*x.*y(4).*y(1),10.*x.*y(4).*y(1).^5,2.*x.*y(4),-2.*x.*(y(3)-1)];
% vf = exp(-x).*y.^2-y;
% vf = cos(x)-1e6.*(y-sin(x));
% vf = [y(2),y(3),log(1 + x.^4 + abs(y(1)) + (y(3)).^2) - sin(x).*y(2) + x.*y(1)];
end