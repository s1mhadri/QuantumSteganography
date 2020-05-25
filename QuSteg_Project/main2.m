clc; clearvars; close all;

load('Cam128Lena64.mat');


subplot(2, 2, 1); imshow(uint8(I1)); title('Secret image');
subplot(2, 2, 3); imshow(uint8(I2)); title('Cover image');

subplot(2, 2, 4); imshow(uint8(stim)); title('Stego image');
subplot(2, 2, 2);imshow(uint8(fi)); title('Extracted image');
