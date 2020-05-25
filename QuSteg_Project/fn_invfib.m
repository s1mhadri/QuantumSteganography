function [InF] = fn_invfib(qim)
    l = length(qim);
    N = sqrt(l/256);
    n = floor(log2(N-1)+1);
    v = intenext(qim);
    InF = sparse(l, 1);
    it = 1;
    for i = 0:N-1
        for j = 0:N-1
            ketx = fn_qureg(mod(j, N), n);
            kety = fn_qureg(mod(i - j, N), n);
            xy = kron(ketx, kety);
            InF = InF + kron(fn_qureg(v(it), 8), xy);
            it = it+1;
        end
    end
    InF = fn_ket(InF);
end
