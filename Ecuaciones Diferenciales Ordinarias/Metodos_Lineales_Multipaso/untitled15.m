tol = 1e-10;
debug = 0;
logicalStr = {'false', 'true'};

fprintf('\n')
fprintf('Adams-Bashforth de 2 pasos: %s.\n', logicalStr{ isequal ( [ 5 1 2 ], mlmChecker ( [ 1 -1 0 ], [ 0 3/2 -1/2 ], tol, debug ) ) + 1 } )
fprintf('Adams-Bashforth de 3 pasos: %s.\n', logicalStr{ isequal ( [ 5 1 3 ], mlmChecker ( [ 1 -1 0 0 ], [ 0 23/12 -16/12 5/12 ], tol, debug ) ) + 1 } )
fprintf('Adams-Bashforth de 4 pasos: %s.\n', logicalStr{ isequal ( [ 5 1 4 ], mlmChecker ( [ 1 -1 0 0 0 ], [ 0 55/24 -59/24 37/24 -9/24 ], tol, debug ) ) + 1 } )
fprintf('\n')
fprintf('Adams-Moulton de 2 pasos: %s.\n', logicalStr{ isequal ( [ 5 2 3 ], mlmChecker ( [ 1 -1 0 ], [ 5/12 8/12 -1/12 ], tol, debug ) ) + 1 } )
fprintf('Adams-Moulton de 3 pasos: %s.\n', logicalStr{ isequal ( [ 5 2 4 ], mlmChecker ( [ 1 -1 0 0 ], [ 9/24 19/24 -5/24 1/24 ], tol, debug ) ) + 1 } )
fprintf('Adams-Moulton de 4 pasos: %s.\n', logicalStr{ isequal ( [ 5 2 5 ], mlmChecker ( [ 1 -1 0 0 0 ], [ 251/720 646/720 -264/720 106/720 -19/720 ], tol, debug ) ) + 1 } )
fprintf('\n'
fprintf('Nyström de 3 pasos: %s.\n', logicalStr{ isequal ( [ 5 1 3 ], mlmChecker ( [ 1 0 -1 0 ], [ 0 7/3 -2/3 1/3 ], tol, debug ) ) + 1 } )
fprintf('Nyström de 4 pasos: %s.\n', logicalStr{ isequal ( [ 5 1 4 ], mlmChecker ( [ 1 0 -1 0 0 ], [ 0 8/3 -5/3 4/3 -1/3 ], tol, debug ) ) + 1 } )
fprintf('\n')
fprintf('Milne-Simpson de 2 pasos: %s.\n', logicalStr{ isequal ( [ 5 2 4 ], mlmChecker ( [ 1 0 -1 ], [ 1/3 4/3 1/3 ], tol, debug ) ) + 1 } )
fprintf('Milne-Simpson de 4 pasos: %s.\n', logicalStr{ isequal ( [ 5 2 5 ], mlmChecker ( [ 1 0 -1 0 0 ], [ 29/90 124/90 24/90 4/90 -1/90 ], tol, debug ) ) + 1 } )
fprintf('\n')
fprintf('BDF de 2 pasos: %s.\n', logicalStr{ isequal ( [ 5 2 2 ], mlmChecker ( [ 3 -4 1 ], [ 2 0 0 ], tol, debug ) ) + 1 } )
fprintf('BDF de 3 pasos: %s.\n', logicalStr{ isequal ( [ 5 2 3 ], mlmChecker ( [ 11 -18 9 -2 ], [ 6 0 0 0 ], tol, debug ) ) + 1 } )
fprintf('BDF de 4 pasos: %s.\n', logicalStr{ isequal ( [ 5 2 4 ], mlmChecker ( [ 25 -48 36 -16 3 ], [ 12 0 0 0 0 ], tol, debug ) ) + 1 } )
fprintf('\n')
fprintf('No estable, ρ(r) con raíz doble de módulo 1: %s.\n', logicalStr{ isequal ( [ 4 -1 -1 ], mlmChecker ( [ 1 -2 1 ], [ 0 1 -1 ], tol, debug ) ) + 1 } )
fprintf('No estable, ρ(r) con raíz de módulo > 1: %s.\n', logicalStr{ isequal ( [ 3 -1 -1 ], mlmChecker ( [ 1 -5 12 -16 12 -4 ], [ 0 0 0 0 1 0 ], tol, debug ) ) + 1 } )
fprintf('No consistente, ρ(1) != 0: %s.\n', logicalStr{ isequal ( [ 1 -1 -1 ], mlmChecker ( [ 2 1 ], [ 1 1 ], tol, debug ) ) + 1 } )
fprintf("No consistente, ρ'(1) != σ(1): %s.\n", logicalStr{ isequal ( [ 2 -1 -1 ], mlmChecker ( [ 1 -1 ], [ 1 1 ], tol, debug ) ) + 1 } )
fprintf('\n')