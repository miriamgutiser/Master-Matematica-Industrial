function y_n = fixedpoint ( th, h, x_o, x_n, y_o, maxit, epsi )
    % FIXEDPOINT Fixed-point iteration for solving implicit Theta-method step.
    %
    % This function implements the fixed-point iteration to compute an approximation
    % of the solution y(x_n) for the implicit Theta-method in solving ordinary differential
    % equations (ODEs) of the form:
    %       y' = f ( x, y ), with initial condition y(a) = eta.
    % 
    % In the Theta-method, the approximation at each step can be expressed as:
    %       y_n = y_o + h * ( th * f ( x_o, y_o ) + ( 1 - th ) * f ( x_n, y_n ) )
    %
    % INPUTS:
    %   th    - Theta parameter of the Theta-method.
    %   h     - Step size.
    %   x_o   - Initial node of the step, x(i).
    %   x_n   - Next node of the step, x(i+1).
    %   y_o   - Initial approximation of y at x(i).
    %   maxit - Maximum number of fixed-point iterations allowed.
    %   epsi  - Convergence tolerance for weak stopping criterion.
    %
    % OUTPUT:
    %   y_n   - Approximation of y at the next node, x(i+1).
    %
    % The function performs fixed-point iteration to solve the implicit equation
    % for `y_n`. In each iteration, it computes a new approximation based on the
    % previous iteration value and checks if the difference between successive
    % approximations is within the specified tolerance, `epsi`. If the difference
    % is smaller than `epsi`, the function stops and returns the converged value.
    % If the iteration limit `maxit` is reached without convergence, a warning
    % message is displayed.
    %
    % Note: The function `f ( x, y )` must be defined separately in the environment
    % where `fixedpoint` is called, as it is problem-specific.

    y_n = y_o;

    for iter = 1 : maxit

        y_nm1 = y_n;

        y_n = y_o + h * ( th * f ( x_o, y_o  ) + ( 1.0 - th ) * f ( x_n, y_n ) );

        diff = norm ( y_n - y_nm1 );

        if diff < epsi
            fprintf ( 'Converged after %d iterations with diff = %.5e\n', iter, diff );
            return;
        end
    end
    
    fprintf ( 'Warning: Maximum iterations (%d) reached without convergence.\n', maxit );
end