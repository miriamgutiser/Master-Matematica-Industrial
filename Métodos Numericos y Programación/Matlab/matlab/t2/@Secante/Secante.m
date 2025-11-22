classdef Secante < Algoritmo
    methods
        function [raiz, iter] = ejecutar(obj, func)
            x0 = obj.x0(1);
            x1 = obj.x0(2);
            for iter = 1:obj.maxIter
                fx0 = func(x0);
                fx1 = func(x1);
                if abs(fx1) < obj.tol
                    break;
                end
                x2 = x1 - fx1 * (x1 - x0) / (fx1 - fx0);
                x0 = x1;
                x1 = x2;
            end
            raiz = x1;
        end
    end
end