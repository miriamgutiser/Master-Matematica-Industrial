function vardis = vadiscreta(n)
    A = rand(n, 1);
    X = zeros(n, 1); 
    pa(1) = 0.1; pa(2) = 0.35; pa(3) = 0.8; pa(4) = 1;
    v(1) = 2; v(2) = 4; v(3) = 6; v(4) = 8;

    for i = 1:n
        if (A(i) < pa(1))
            X(i) = v(1);
        elseif (A(i) < pa(2))
            X(i) = v(2);
        elseif (A(i) < pa(3))
            X(i) = v(3);
        else
            X(i) = v(4);
        end
    end

    vardis = X;
end
