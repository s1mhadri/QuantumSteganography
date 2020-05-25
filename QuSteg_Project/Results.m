clc; clearvars; close all;


Cov = imread('32Einstein.png');
Steg = imread('St_32Einstein_T.png');
disp('PSNR of Stego image');
peaksnr1 = psnr(Steg, Cov)
