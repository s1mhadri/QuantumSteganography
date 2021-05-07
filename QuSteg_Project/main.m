clc; clearvars; close all;

sec_img = imread('16T.png');
cov_img = double(imread('32Lena.png'));

subplot(2, 2, 1); imshow(uint8(sec_img)); title('Secret image');
subplot(2, 2, 3); imshow(uint8(cov_img)); title('Cover image');

ex_sec_img = fn_expand(sec_img);

% quantum image conversion
% this give conversion from classical image to quantum image
qsec_img = fn_QuImg(ex_sec_img, 8);
qcov_img = fn_QuImg(cov_img, 8);

qarn_img = fn_arnscr(qsec_img);
qfib_img = fn_fibscr(qarn_img);

sb0 = fn_LSBext(qfib_img, 0, 8);
sb1 = fn_LSBext(qfib_img, 1, 8);
cb0 = fn_LSBext(qcov_img, 0, 8);
cb1 = fn_LSBext(qcov_img, 1, 8);

% image size = 2^n1 x 2^n1
% n = n1 + n1 or 2*n1
n = log2(length(cov_img));

% combine UT1 and UT0 into single function with an extra arg
for i = 0:length(cb0)-1
    if sb0(i+1) ~= cb0(i+1)
        qcov_img = fn_UT0(qcov_img, i, n);
    end
    if sb1(i+1) ~= cb1(i+1)
        qcov_img = fn_UT1(qcov_img, i, n);
    end
end

stego_img = fn_QtoC(qcov_img);
subplot(2, 2, 4); imshow(uint8(stego_img)); title('Stego image');
%imwrite(uint8(stego_img), 'St_128Lena_Cam.png');

ext_qsec_img = fn_LSQbext(qcov_img, 0:1, 8);

invfib_sec_img = fn_invfib(ext_qsec_img);
invarn_sec_img = fn_invarn(invfib_sec_img);

ext_sec_img = fn_QtoC(invarn_sec_img);

fin_sec_img = fn_shrink(ext_sec_img);
subplot(2, 2, 2);imshow(uint8(fin_sec_img)); title('Extracted image');

% profsave(profile('info'),'myprofile_results');
