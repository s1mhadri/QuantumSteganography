function [Qim] = fn_QuImg(I, q)
    [m, n] = size(I);
    %q = 8;
    q1 = 2^q;
    n1 = floor(log2(m*n-1) + 1);
    w=0;
    Qim = sparse(m*n*q1, 1);
    for i=1:m
        for j=1:n
            Qim = Qim + kron(fn_qureg(I(i, j), q), fn_qureg(w, n1));
            w = w+1;
        end
    end
    Qim = fn_ket(Qim);
end

