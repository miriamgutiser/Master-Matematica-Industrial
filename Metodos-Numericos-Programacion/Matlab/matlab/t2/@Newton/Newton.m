classdef Newton < Algoritmo
    methods
        function [raiz, iter] = ejecutar(obj, func, dfunc)
            x = obj.x0;
            for iter = 1:obj.maxIter
                fx = func(x);
                dfx = dfunc(x);
                if abs(fx) < obj.tol
                    break;
                end
                x = x - fx / dfx;
            end
            raiz = x;
        end
    end
end