function [NQim, U0] = fn_UT0(Qim, i, n)
    X = [0 1;1 0];
    q = 8;
    Iq0 = speye(2^(q-1));
    t1 = kron(Iq0, X);
    i1 = sparse(2^(2*n), 2^(2*n));
    i1(i+1, i+1) = 1;
    u1 = kron(t1, i1);
    Iq = speye(2^q);
    j1 = speye(2^(2*n));
    j1(i+1, i+1) = 0;
    u2 = kron(Iq, j1);
    U0 = u1 + u2;
    NQim = U0*Qim;
end