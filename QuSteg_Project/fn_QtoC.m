function [Im, v] = fn_QtoC(Qim)
    [m, ~] = size(Qim);
    m = sqrt(m / 256);
    si = find(Qim);
    v = floor((si - 1) / nnz(Qim));
    li = si - (m*m*v);
    sz = [m, m]';
    [c, r] = ind2sub(sz, li);
    Im = full(sparse(r, c, v));
end

