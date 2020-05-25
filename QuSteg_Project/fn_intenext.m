%{
Function to extract intensity values or pixel values from
Quantum image
Input:
Qim - quantum image in NEQR
Output:
v - grayscale values or intensity values of all positions
%}

function [v] = fn_intenext(Qim)
    m = 256; % total intensity values available (2^8)
    % rearrange 1-D vector into N column vector
    % where N is total positions in the image
    % to create a 256 x N array where each column is intensity vector
    X = (reshape(Qim, [], m))';
    [v, ~] = find(X);
    v = v-1;
end

