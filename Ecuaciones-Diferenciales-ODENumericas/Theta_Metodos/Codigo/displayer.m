% dfreq: display frequency. To prevent excessive output, results are displayed
% only for the first node, the last node, and when the node number is a multiple of dfreq.
%
% ex: indicates whether the exact solution is known (ex = 1) or not (ex != 1).
%
% ofi: file identifier for the output file.

% Define indexes for nodes based on the display frequency
indexes = 1:N;
idx = find(indexes == 1 | mod(indexes, dfreq) == 0 | indexes == N);  % Nodes to display
xdisp = x(idx);  % x-coordinates of nodes to display
yhdisp = yh(idx, :);  % Approximate solution values at display nodes
Ndisp = length(idx);  % Total number of nodes to display

% Loop through display nodes and output results based on whether the exact solution is known
if (ex == 1)  % Case where exact solution is known
    for i = 1:Ndisp
        % Print header for each step
        fprintf(ofi, '\n\nStep \t\t Node \t\t\t Approximate solution \t\t Exact solution \t\t Error (2-norm)\n');
        
        % Calculate exact solution and error at each node
        exa = exact(xdisp(i));
        error = norm(exa - yhdisp(i, :));  % 2-norm of the error
        
        % Output node details: step, x value, approximate and exact solutions, error
        fprintf(ofi, '%-i \t\t %-.4E \t\t %-.6E \t\t %-.6E \t\t %-.6E', ...
                idx(i), xdisp(i), yhdisp(i, 1), exa(1), error);
        
        % Print additional dimensions (if m > 1)
        for j = 2:m
            fprintf(ofi, '\n \t\t\t\t\t\t %-.6E \t\t %-.6E', yhdisp(i, j), exa(j));
        end
    end
else  % Case where exact solution is unknown
    for i = 1:Ndisp
        % Print header for each step
        fprintf(ofi, '\n\nStep \t\t Node \t\t\t Approximate solution\n');
        
        % Output node details: step, x value, and approximate solution
        fprintf(ofi, '%-i \t\t %-.4E \t\t %-.6E', idx(i), xdisp(i), yhdisp(i, 1));
        
        % Print additional dimensions (if m > 1)
        for j = 2:m
            fprintf(ofi, '\n \t\t\t\t\t\t %-.6E', yhdisp(i, j));
        end
    end
end