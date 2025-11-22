% The results are plotted only for the first node, the last node, and
% when the node number is a multiple of plfreq.
indexes = 1:N;  % Create an array of node indices from 1 to N
idx = find(indexes == 1 | mod(indexes, plfreq) == 0 | indexes == N);  % Identify indices to plot
xpl = x(idx);  % Select x values corresponding to the indices to plot
yhpl = yh(idx, :);  % Select approximate solution values corresponding to the indices

% If the exact solution is known, calculate it at the selected nodes
if (ex == 1)
    exapl = exact(xpl.');  % Calculate exact values at xpl
end

% Loop through each component of the solution
for k = 1:m
    figure  % Create a new figure for each component
    hold on  % Hold on to plot multiple elements in the same figure
    plot(xpl, yhpl(:, k), '*r')  % Plot the approximate solution for component k
    str = sprintf('APPROXIMATE SOLUTION (explicit Euler), component %i', k);  % Create legend string
    legend(str)  % Add legend for approximate solution

    % If the exact solution is known, plot it as well
    if (ex == 1)
        plot(xpl, exapl(:, k), 'ob')  % Plot exact solution for component k
        str1 = sprintf('APPROXIMATE SOLUTION (explicit Euler), component %i', k);  % Legend for approx solution
        str2 = sprintf('EXACT SOLUTION, component %i', k);  % Legend for exact solution
        legend(str1, str2)  % Add legend for both solutions
    end
end