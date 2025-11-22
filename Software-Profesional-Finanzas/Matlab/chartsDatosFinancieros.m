%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% charts de datos financieros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('ibm.dat');
[fi, co] = size(ibm);

figure;
highlow(ibm(-50: ,2),ibm(-50: ,3),ibm(-50: ,4),[],b);
xlabel(''); ylabel('Precio()'); title('IBM');
axis([0 50 -inf inf]);
dateaxis('x', 6, '31-Dec-1994');


