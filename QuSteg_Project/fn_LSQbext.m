function [lsqb] = fn_LSQbext(Qim, z, q)
    m = 2^q;
    X = (reshape(Qim, [], m))';
    [v, ~] = find(X);
    b = sparse(de2bi(v-1, q));
    lsb = bi2de(b(:, z+1));
    lsqb = fn_QuImg(lsb, q);
end

