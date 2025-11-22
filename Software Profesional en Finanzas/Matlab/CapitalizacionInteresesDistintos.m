f = datetime({'15-May-2025', '15-Mar-2026', '15-Jul-2026', '15-Oct-2026', '30-Dec-2026'});
cf = [-10000, 3000, 3000, 3500, 2000];
r = [0.018, 0.020, 0.022, 0.025];  % Solo 3 tasas para 3 tramos

fecha_final = f(end);
fv = 0;

for i = 2:5  % hasta el penúltimo flujo
    t = years(fecha_final - f(i));
    fv = fv + cf(i) * (1 + r(i-1))^t;
end

fv_total = fv + cf(end);  % el último flujo no se capitaliza
fv_inicial = cf(1) * (1 + r(1))^years(fecha_final - f(1));  % si deseas añadir la inversión inicial capitalizada

fv_total_con_inversion = fv_total + fv_inicial;

fprintf('Valor capitalizado sin inversión inicial: %.2f €\n', fv_total)
fprintf('Valor capitalizado con inversión inicial: %.2f €\n', fv_total_con_inversion)
