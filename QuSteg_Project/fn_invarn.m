function [InA] = fn_invarn(qim)
    l = length(qim);
    N = sqrt(l/256);
    n = floor(log2(N-1)+1);
    v = intenext(qim);
    InA = sparse(l, 1);
    it = 1;
    for i = 0:N-1
        for j = 0:N-1
            ketx = fn_qureg(mod(2*i - j, N), n);
            kety = fn_qureg(mod(j - i, N), n);
            xy = kron(ketx, kety);
            InA = InA + kron(fn_qureg(v(it), 8), xy);
            it = it+1;
        end
    end
    InA = fn_ket(InA);
end

