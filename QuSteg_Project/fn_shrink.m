%{
Function to shrink the image into original size and original intensity or 
gray scale value. Size of input image is 2^n x 2^n (N x N) with gray scale
bits 2. Size of output image is 2^n-1 x 2^n-1 (N/2 x N/2) with gray scale 
bits 8.

Input:
ExIm - expanded image with reduced gray scale values
output:
Im - original image with original size and 8 bits for each intensity
     range or intensity is [0-255] in decimals
%}

function Im = fn_shrink(ExIm)
    [m1, n1] = size(ExIm);
    % reduce the rows and cols by half
    m = m1/2;
    n = n1/2;
    Im = zeros(m, n);
    % a 3-D matrix to hold each plane from the expanded image
    planes(:,:,4) = zeros(m, n);
    k = 1;
    for i = 1:m:m1
        for j = 1:n:n1
            % assign each plane from LSB to MSB plane
            planes(:,:,k) = ExIm(i:i+m-1, j:j+n-1);
            % multiply each plane with respective powers of 4 to get
            % original intensity values and add the planes
            Im = Im + planes(:,:,k)*(4^(k-1));
            k = k + 1;
        end
    end
end

