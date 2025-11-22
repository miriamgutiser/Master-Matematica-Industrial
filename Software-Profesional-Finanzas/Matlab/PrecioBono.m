%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Valoración de instrumentos de renta fija (Bonos)
% bndprice,bndyield, bnddury, bndconvy
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parámetros

yield = 0.04;               % tir: tasa compuesta de descuento
couponRate = 0.02;          % Tasa de cupón  Nota: cupoenes semestrales del 5%--> 0.05/2
settle = '12-Jun-2025';     % fecha de adquisición (se emite el bono)
maturity = '31-Dec-2033';   % Fecha de pago
period = 4;                 % Numeros de cupones anuales:
% (0: no pago, n = 1,2, 3, 4(trimestral), 6,12(mensual)
basis = 1;                  % base números de días / 365
endMonthRule = 1;           % Convención días-años (0: siempre ese dia del mes,1: Fin de mes)

IssueDate = '01-Jan-2024';          % Cuando se emite el bono
FirstCouponDate = '31-May-2024';    % Cuando paga cupon
LastCouponDate = '31-Dec-2033';     % No hace falta creo

%% Precio bono con principal 100, con única tasa compuesta de
% descuento (tir o yield)
[pl, cc] = bndprice(yield, couponRate, settle, maturity, period);
[pl1, cc1] = bndprice(yield, couponRate, settle, maturity, period, basis, ...
    endMonthRule, IssueDate, FirstCouponDate, LastCouponDate);

p_totoal = pl + cc;


%% bnddury -Duración (modificada, anual y peródica) de un bono en años
[moddur1, yeardur1, perdur1] = bnddury(yield, couponRate, settle, maturity, ...
    period, basis, endMonthRule, IssueDate, FirstCouponDate, LastCouponDate );

    % moddur: duración modificada del bono (usada para medir la
    % sensibilidad del tipo de interés)
    % yeardur: duración en años, 
    % perdur: duración en periodos de cupón

%% bndconvy - Convexidad (anual y periodica) de un bono, basada en su rendmiento al vencimiento

[ yeardconv, perconv] = bndconvy(yield, couponRate, settle, maturity, period);

[ yeardconv1, perconv1] = bndconvy(yield, couponRate, settle, maturity, ...
    period, basis, endMonthRule, IssueDate, FirstCouponDate, LastCouponDate );

%% bndyield - Calcula la tir (tasa interna de retorno) de de un bono a partir de un precio
% Parámetros
price = 100;                % Por defecto es 100
yield = 0.04;               % tir: tasa compuesta de descuento/ interes
couponRate = 0.02;          % Tasa de cupón  
settle = '12-Jun-2025';     % fecha de adquisición-compra o cuando queremos valorar
maturity = '31-Dec-2033';   % Fecha de pago, vencimiento
period = 4;                 % Numeros de cupones anuales:
% (0: no pago, n = 1,2, 3, 4(trimestral), 6,12(mensual)
basis = 1;                  % base números de días / 365
endMonthRule = 1;           % Convención días-años (0: siempre ese dia del mes,1: Fin de mes)

IssueDate = '01-Jan-2024';          % Cuando se emite el bono
FirstCouponDate = '31-May-2024';    % Cuando paga cupon
LastCouponDate = '31-Dec-2033';     % No hace falta creo

tasaInterna = bndyield(price, couponRate, settle, maturity, period);
tasaInterna1 = bndyield(price, couponRate, settle, maturity, period, ...
    basis, endMonthRule, IssueDate, FirstCouponDate, LastCouponDate);