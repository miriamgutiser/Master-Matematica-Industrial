function y_n = newton(th, h, x_o, x_n, y_o, maxit, epsi, delta, m)
    % NEWTON - Implements Newton's method for solving implicit equations in the 
    % Theta-method for ordinary differential equations (ODEs). This method is 
    % specifically designed for solving nonlinear equations within the Theta-method 
    % by dynamically adjusting to the output dimension of f(x, y) based on its result.
    %
    % The function iteratively computes an approximation for y(x_n) that satisfies
    % the implicit Theta-method equation:
    %       y_n = y_o + h * ( th * f(x_o, y_o) + (1 - th) * f(x_n, y_n) )
    %
    % Newton's method is used here to iteratively improve the approximation for `y_n`,
    % by calculating a Jacobian matrix for f(x, y) numerically and refining `y_n` until
    % convergence criteria are met.
    %
    % INPUTS:
    %   th      - Theta parameter of the Theta-method.
    %   h       - Step size.
    %   x_o     - Current node in the mesh.
    %   x_n     - Next node in the mesh.
    %   y_o     - Initial approximation of y at x(i).
    %   maxit   - Maximum number of iterations allowed for convergence.
    %   epsi    - Tolerance for convergence based on relative change in y_n.
    %   delta   - Perturbation size used for numerical approximation of the Jacobian.
    %   m       - Dimension of the system (determined by the length of y_o).
    %
    % OUTPUT:
    %   y_n     - Approximated solution at the next node, x(i+1).
    %
    % In each iteration, Newton's method is applied to solve the nonlinear system by
    % first calculating the residual `F_y` and the Jacobian matrix `dFdy`. The iteration 
    % updates `y_n` using the inverse of `dFdy` to correct `F_y`. The loop stops when the 
    % difference between successive approximations is below `epsi`, and the residual 
    % norm is less than `delta`, ensuring both the solution's stability and accuracy.
    % If the solution does not converge within the specified number of iterations, 
    % a warning message is displayed.
    %
    % Note: The function `f ( x, y )` must be defined separately in the environment
    % where `newton` is called, as it is problem-specific.

    y_n = y_o;

    for iter = 1 : maxit

        y_nm1 = y_n;
        
        F_y = y_n - y_o - h * ( th * f ( x_o, y_o  ) + ( 1.0 - th ) * f ( x_n, y_n ) );
        dFdy = eye ( m ) - h * ( 1.0 - th ) * jacf ( x_n, y_n );

        y_n = y_n - ( dFdy \ F_y' )';

        diff = norm ( y_n - y_nm1 );

        if diff < epsi && norm ( F_y ) < delta
            fprintf ( 'Converged after %d iterations with diff = %.5e\n', iter, diff );
            return;
        end
    end

    fprintf ( 'Warning: Maximum iterations (%d) reached without convergence.\n', maxit );
end