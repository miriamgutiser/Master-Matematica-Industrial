% Jacobiano (con respecto a y) de la funión f que define la EDO y'=f(x,y)
function vjacf=jacf(x,y)
%vjacf(1,:)=[0,1];
%vjacf(2,:)=[-1,0];
vjacf(1,:) = [2.*x.*y(4),0,0,2.*x.*y(1)];
vjacf(2,:) = [50.*x.*y(4).*y(1).^4,0,0,10.*x.*y(1).^5];
vjacf(3,:) = [0,0,0,2.*x];
vjacf(4,:) = [0,0,-2.*x,0];
%vjacf=2.*exp(-x).*y-1;
% vjacf = -1e6;
end