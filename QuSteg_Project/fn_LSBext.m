function [lsb] = fn_LSBext(Qim, z, q)
    m = 2^q;
    X = (reshape(Qim, [], m))';
    [v, ~] = find(X);
    b = sparse(de2bi(v-1, q));
    lsb = bi2de(b(:, z+1));
end

