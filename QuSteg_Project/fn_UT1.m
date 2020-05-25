function [NQim, U1] = fn_UT1(Qim, i, n)
    X = [0 1;1 0];
    I = speye(2);
    q = 8;
    Iq1 = speye(2^(q-2));
    t1 = kron(Iq1, X);
    t2 = kron(t1, I);
    i1 = sparse(2^(2*n), 2^(2*n));
    i1(i+1, i+1) = 1;
    u1 = kron(t2, i1);
    Iq = speye(2^q);
    j1 = speye(2^(2*n));
    j1(i+1, i+1) = 0;
    u2 = kron(Iq, j1);
    U1 = u1 + u2;
    NQim = U1*Qim;
end