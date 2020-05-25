% ket  Transforms a vector into normalized column vector.

function [w] = fn_ket(v)
   % normalisation
   w = v / sqrt(v'*v);
end