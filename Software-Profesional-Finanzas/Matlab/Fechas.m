%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Valoración de instrumentos de renta fija
% cfdates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parámetros
settle = '1-Jun-2025';      % fecha de adquisición
maturity = '31-Dec-2029';   % fecha de pago
period = 1;                 % Numeros de cupones anuales (0: no pago, n = 1,2,3,4,6,12) Defecto : 2 (semestrales)
basis = 1;                  % base números de días / 365
endMonthRule = 0;           % Convención días-años (0: siempre ese dia del mes,1: Fin de mes)
% Por defecto 
issueDate = NaN;  
firstCouponDate = NaN;
lastCouponDate = NaN;

%% cfdates - Flujos asociados a un instrumentos de renta fija
fechas = cfdates(settle, maturity, period, basis, endMonthRule);
