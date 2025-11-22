%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Descuentos y capoitalizaación
% pvfix, fvfix, fvvar, pvvar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Valor actualizado (descuento) y Valor capitalizado de n pagos por importe p al tipo relativo t al periodo de los pagos
% Parámetros
t = 0.04;   % tipo t realtivo al periodo de pago (tasa)
n = 12;     % n pagos por importe (numero de periodos)
p = 10;     % importe (cuota)

actFix = pvfix(t, n, p);  % fvfix(0.04/12,5*12,10) 5 años: 60 meses
capFix = fvfix(t, n, p);


%% Valor actualizado y descontado de p pagos en las fechas respectivas f descontado con el tipo t
% Parámetros
p = 10*ones(1,20);          %20 pagos de 10 euros
settle = '1-Jun-2025';      % fecha de adquisición
maturity = '31-Dec-2029';   % fecha de pago

fechas = cfdates(settle, maturity);
f = datestr(fechas);
t = 0.04;       % rate (si son 2 veces al año--> 0.04/2)

actVar = fvvar(p,t,f);
capVar = pvvar(p, t, f);