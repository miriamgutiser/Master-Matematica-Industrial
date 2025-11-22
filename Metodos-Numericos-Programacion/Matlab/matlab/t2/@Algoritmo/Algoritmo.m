%Programacion orientada a objetos
classdef Algoritmo
    properties
        x0
        tol
        maxIter
    end
    methods
        function obj = Algoritmo(x0, tol, maxIter)
            obj.x0 = x0;
            obj.tol = tol;
            obj.maxIter = maxIter;
        end
    end
    methods (Abstract)
        [raiz, iter] = ejecutar(obj, func)
    end
end
