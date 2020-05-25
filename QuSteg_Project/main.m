clc; clearvars; close all;

I1 = imread('64Cameraman.png');
I2 = double(imread('128Lena.png'));

subplot(2, 2, 1); imshow(uint8(I1)); title('Secret image');
subplot(2, 2, 3); imshow(uint8(I2)); title('Cover image');

exi = fn_expand(I1);

% quantum image conversion
% this give conversion from classical image to quantum image
qim1 = fn_QuImg(exi, 8);
qim2 = fn_QuImg(I2, 8);

qimarn = fn_arnscr(qim1);
qimfib = fn_fibscr(qimarn);

sb0 = fn_LSBext(qimfib, 0, 8);
sb1 = fn_LSBext(qimfib, 1, 8);
cb0 = fn_LSBext(qim2, 0, 8);
cb1 = fn_LSBext(qim2, 1, 8);

% image size = 2^n1 x 2^n1
% n = n1 + n1 or 2*n1
n = log2(length(I2));

% combine UT1 and UT0 into single function with an extra arg
for i = 0:length(cb0)-1
    if sb0(i+1) ~= cb0(i+1)
        qim2 = fn_UT0(qim2, i, n);
    end
    if sb1(i+1) ~= cb1(i+1)
        qim2 = fn_UT1(qim2, i, n);
    end
end

stim = fn_QtoC(qim2);
subplot(2, 2, 4); imshow(uint8(stim)); title('Stego image');
imwrite(uint8(stim), 'St_128Lena_Cam.png');

ex1 = fn_LSQbext(qim2, 0:1, 8);

ex2 = fn_invfib(ex1);
ex3 = fn_invarn(ex2);

ex4 = fn_QtoC(ex3);

fi = fn_shrink(ex4);
subplot(2, 2, 2);imshow(uint8(fi)); title('Extracted image');
