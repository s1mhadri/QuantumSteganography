%{
Function to expand the image into double the size and reduce the number
of bits required to represent each intensity or gray scale value.
Size of input image is 2^n-1 x 2^n-1 (N/2 x N/2) with gray scale bits 8.
Size of output image is 2^n x 2^n (N x N) with gray scale bits 2.
Input:
I - the image that is needed to be expanded
output:
newIm - expanded image with double size and 2 bits for each intensity
        range or intensity is [0-3] in decimals
%}

function [newIm] = fn_expand(I)
    I = double(I);
    [m1, n1] = size(I);

    % initialise an array of matrix or 3D matrix to store bit planes
    planes(:,:,4) = zeros(m1, n1);

    % initialise a new matrix to store expanded image
    newIm = zeros(2*m1, 2*n1);
    [m2, n2] = size(newIm);

    % store each bit plane as each quadrants of the new image double size
    k = 1;
    for i = 1:m1:m2
        for j = 1:n1:n2
            % To get bit planes with 2bits for each pixel (0-3)
            planes(:,:,k) = mod(floor(I / (4^(k-1))), 4);
            newIm(i:i+m1-1, j:j+n1-1) = planes(:,:,k);
            k = k + 1;
        end
    end
end

