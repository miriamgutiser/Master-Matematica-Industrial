function dFdy = jacf ( x, y )
    % JACF - Calculates the Jacobian matrix of the function f at the point (x, y)
    % using finite differences. The Jacobian matrix is essential for Newton's method
    % in solving nonlinear equations, as it provides the partial derivatives of f
    % with respect to each variable in y.
    %
    % The function perturbs each component of y by a small value, `perturbation`, 
    % to estimate the derivatives numerically. This creates a small change in one
    % component of y at a time, and each resulting change in f is recorded. The 
    % difference between the values of f at the original y and the perturbed y gives 
    % an approximation of each partial derivative. The matrix `dFdy` is filled 
    % column by column, where each column corresponds to the effect on f of 
    % perturbing one specific component of y.
    %
    % INPUTS:
    %   x - Point at which to evaluate f
    %   y - Vector of the current condition in the dependent variable
    %
    % OUTPUT:
    %   dFdy - Jacobian matrix

    perturbation = 1e-8;
    m = length ( y );
    dFdy = zeros ( m );
    f0 = f ( x, y );

    for j = 1 : m

        y_perturbed = y;
        y_perturbed(j) = y_perturbed(j) + perturbation;

        f_perturbed = f ( x, y_perturbed );

        dFdy(:, j) = ( f_perturbed - f0 ) / perturbation;
        
    end
end