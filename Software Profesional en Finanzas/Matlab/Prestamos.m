%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Préstamos
% annurate, amortize
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% annurate - Tipo mensual asociado a pagos mensuales pm durante n anualidades sobre un prestamo p.

% Parámetros
pm = 190;       % pagos mensuales (cuota mensual)
n = 3;          % n anualidades
p = 6000;       % importe préstamo
tipo = annurate(n*12, pm, p, 0,0);
tipo_anual = tipo *12;
pvfix(tipo, 3*12, 190); %=6000



%% amortize - ca: capital amortizado, ip: interés pagado, cp: capital pendiente, cm:cuota mensual 
% Parámetros
t = 0.05/12;    % Tipo mensual (tasa)
n = 3*12;       % Número de pagos
p = 15000;      % Importe del préstamo

[ca, ip, cp, cm] = amortize(t, n, p, 0, 0);