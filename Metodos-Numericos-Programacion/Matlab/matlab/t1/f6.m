function y = f6(x, varargin)
switch nargin
    case 1
        y = x;
    case 2
        y = x + varargin{1}(x);
    case 3
        y = x + varargin{1}(x) + varargin{2}(x);
    otherwise
        error('Solo se permiten a lo sumo dos argumentos opcionales.')
end
end
