%{
Function to represent decimal value as a qubit register
Input:
N - The decimal value to be represented in quantum register form
q - number of bits needed to represent the decimal value
Output:
qr - quantum register of q bits
%}

function [qr] = fn_qureg(N, q)
    qr = sparse(N+1, 1, 1, 2^q, 1);
end