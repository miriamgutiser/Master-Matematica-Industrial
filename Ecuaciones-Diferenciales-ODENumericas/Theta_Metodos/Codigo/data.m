% INITIAL (LEFT) EXTREMUM:
% Define the starting point of the interval, a, and output it to the file
fprintf(ofi, '***** DATA *****');
a = 0;
fprintf(ofi, '\n* Initial (left) extremum: \na = %-.5E.', a);

% FINAL (RIGHT) EXTREMUM:
% Define the endpoint of the interval, b, and output it to the file
b = 5;
fprintf(ofi, '\n\n* Final (right) extremum: \nb = %-.5E.', b);

% INITIAL CONDITION (VALUE OF THE SOLUTION y(x)=[y_1(x) ... y_m(x)] AT x = a):
% Define the initial condition (eta) as the value of y at x = a
% eta could be a vector (e.g., [1,1,1,1]) or a scalar; adjust as needed
%eta = [exp(-1), 0];
 eta = 1;
%eta = [1, 1, 1, 1];
fprintf(ofi, '\n\n* Initial condition: \neta = ');
fprintf(ofi, '%-.5E ', eta);

% NUMBER OF POINTS (or NODES) OF THE MESH (= NUMBER OF SUBINTERVALS + 1):
% Define the number of nodes for the mesh grid, N, and output it to the file
% N also represents the number of solution points along [a, b]
N = 100;
fprintf(ofi, '\n\n* Number of nodes of the mesh: \nN = %-i. ', N);

% DISPLAY FREQUENCY:
% Specify the display frequency, dfreq, to control how often results are printed
% Results are shown for the first node, the last node, and when node number is a multiple of dfreq
dfreq = max(1, round(N / 10));
fprintf(ofi, '\n\n* Display frequency: \ndfreq = %-i ', dfreq);
fprintf(ofi, '(to avoid displaying too many lines, results are shown only for');
fprintf(ofi, '\nthe first node, the last node, and when node number is a multiple of dfreq).');

% PLOT FREQUENCY:
% Specify the plot frequency, plfreq, to control how often points are plotted
% Points are plotted for the first node, the last node, and when node number is a multiple of plfreq
plfreq = max(1, round(N / 50));
fprintf(ofi, '\n\n* Plot frequency: \nplfreq = %-i ', plfreq);
fprintf(ofi, '(to avoid plotting too many points, results are plotted only for');
fprintf(ofi, '\nthe first node, the last node, and when node number is a multiple of plfreq).');

% EXACT SOLUTION KNOWN (ex = 1) OR UNKNOWN (ex != 1):
% Specify whether the exact solution is known (ex = 1) or unknown (ex != 1)
ex = 1;
fprintf(ofi, '\n\n* Option for exact solution: \nex = %-i', ex);
if (ex == 1)
    fprintf(ofi, ' (the exact solution is known).');
else
    fprintf(ofi, ' (the exact solution is not known).');
end

% THETA VALUE
th = 0.5;
fprintf(ofi, '>>> Theta Value:\n');
fprintf(ofi, '    th = %-1.1f\n\n', th);

% METHOD OPTION (1: fixed-point, 2: Newton)
option = 2;
fprintf(ofi, '>>> Convergence Method Option:\n');
fprintf(ofi, '    option = %-i', option);
switch option
    case 1
        fprintf(ofi, ' (Fixed-Point Method)\n\n');
    case 2
        fprintf(ofi, ' (Newton Method)\n\n');
    otherwise
        fprintf(ofi, ' (Unknown Option)\n\n');
end

% MAXIMUM ITERATIONS
maxit = 20;
fprintf(ofi, '>>> Maximum Iterations:\n');
fprintf(ofi, '    maxit = %-i\n\n', maxit);

% EPSILON VALUE FOR STOPPING CRITERIA
epsi = 1e-14;
fprintf(ofi, '>>> Epsilon Value for Stopping Criteria:\n');
fprintf(ofi, '    epsi = %-.2E\n\n', epsi);

% DELTA VALUE FOR STOPPING CRITERIA (Only for Newton Method)
delta = epsi;
fprintf(ofi, '>>> Delta Value for Stopping Criteria:\n');
fprintf(ofi, '    delta = %-.2E\n\n', delta);

fprintf(ofi, '===========================\n');
fprintf(ofi, '       END OF DATA\n');
fprintf(ofi, '===========================\n');