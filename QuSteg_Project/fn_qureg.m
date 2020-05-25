function [kp] = fn_qureg(N, q)
    kp = sparse(N+1, 1, 1, 2^q, 1);
end

