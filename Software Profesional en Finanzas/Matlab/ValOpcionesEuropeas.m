%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Valoración de opciones europeas con Black-Scholes
% blsprice, blsdelta, blsgamma, blsvega, blslambda, blsimpv
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parámetros

asset = 17;                 % Precio actual del activo subyacente S
strike = 14;                % Precio de ejercicio K
rate = 0.03;                % Tasa interés libre de riesgo anual
settle = '26-Jun-2025'; vencimiento = '31-Dec-2025'; 
timetomaturity =  daysact(settle, vencimiento) / 365;
%timetomaturity = 0.5;      % Tiempo hasta el vencimiento en años (0.5 es 6 meses)
volatility = 0.5;           % Volatilidad anual del subyacente - sigma
dividendy = 0;              % Tasa de dividendos q


%% blsprice - Precio de una opción
[c,p] = blsprice(asset, strike, rate, timetomaturity, volatility, dividendy);

%% blsdelta, blsgamma, blsvega  - Delta, Gamma, Vega de la opción
[delta_c, delta_p] =  blsdelta(asset, strike, rate, timetomaturity, volatility, dividendy);
gamma =  blsgamma(asset, strike, rate, timetomaturity, volatility, dividendy);
vega =   blsvega(asset, strike, rate, timetomaturity, volatility, dividendy);

%% blslambda -  la lambda de la opcion o variacion de su precio cuando el activo varia un uno por ciento
lambda = blslambda(asset, strike, rate, timetomaturity, volatility, dividendy);
[lambdac, lambdap] = blslambda(asset, strike, rate, timetomaturity, volatility, dividendy);

%% blsimpv - Dado el precio de la opción calcula volatilidad implicita en el precio de una opción a partir de la formula B-S
optprice = 2.3281;          % Precio de mercado de la opción (call o put)
volimpl = blsimpv(asset, strike, rate, timetomaturity, optprice);