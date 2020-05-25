clc; clearvars; close all;

%{
Cov = imread('32Einstein.png');
Steg = imread('St_32Einstein_T.png');
disp('PSNR of Stego image');
peaksnr1 = psnr(Steg, Cov)
%}

subplot(2, 2, 1); imshow('128Cameraman.png');
title('Cover Image (128x128)');
subplot(2, 2, 2); imshow('128Cameraman.png');
title('Cover Image (128x128)');
subplot(2, 2, 2); imshow('128Cameraman.png');
title('Cover Image (128x128)');
subplot(2, 2, 2); imshow('128Cameraman.png');
title('Cover Image (128x128)');


