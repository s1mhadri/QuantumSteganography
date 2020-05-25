%clc; clearvars; close all;

% SECURE DATA TRANSMISSION USING QUANTUM IMAGE STEGANOGRAPHY

%I2 = double(imread('32Lena.png')); % cover image
%I1 = randi(255, 8);
I2 = randi(255, 16);
subplot(1, 2, 1); imshow(uint8(I1)); title('Secret image');
subplot(1, 2, 2); imshow(uint8(I2)); title('Cover image');

%% Image Expansion
exi = expand(I1);
imshow(mat2gray(exi)); title('expanded secret image');

%% Quantum image representation using NEQR
qim1 = fn_QuImg(exi, 8);
qim2 = fn_QuImg(I2, 8);

%% Scrambling secret image using arnold and fibonacci scrambling
qimarn = fn_arnscr(qim1);
qimfib = fn_fibscr(qimarn);
imshow(mat2gray(QtoC(qimfib))); title('Scrambled image');

%% Extract LSQb of secret and cover image for comparison
sb0 = fn_LSBext(qimfib, 0, 8);
sb1 = fn_LSBext(qimfib, 1, 8);
cb0 = fn_LSBext(qim2, 0, 8);
cb1 = fn_LSBext(qim2, 1, 8);

%% Embedding secret image data into LSQb of cover image
% Unitary operator UT1 and UT0 are used for LSB1 and LSB0
n = log2(length(I2));
for i = 0:length(cb0)-1
    if sb0(i+1) ~= cb0(i+1)
        qim2 = fn_UT0(qim2, i, n);
    end
    if sb1(i+1) ~= cb1(i+1)
        qim2 = fn_UT1(qim2, i, n);
    end
end

%% Stego image obtained after embedding
stim = fn_QtoC(qim2);
subplot(1, 2, 1); imshow(uint8(I2)); title('Cover image');
subplot(1, 2, 2); imshow(uint8(stim)); title('Stego image');

%% LSBQb extraction of secret image from stego image
ex1 = fn_LSQbext(qim2, 0:1, 8);

%% Inverse Fibonacci and Arnold scrambling
ex2 = fn_invfib(ex1);
ex3 = fn_invarn(ex2);

%% Converting descrambled quantum secret image to classical image
ex4 = fn_QtoC(ex3);

%% Resizing extracted image back to its original size
fi = fn_shrink(ex4);
subplot(1, 2, 1); imshow(uint8(I1)); title('Secret image');
subplot(1, 2, 2);imshow(uint8(fi)); title('Extracted image');
