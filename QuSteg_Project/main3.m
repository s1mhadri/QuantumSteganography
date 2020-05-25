clc; clearvars; close all;

sz = 32;
I1 = randi(255, sz/2);
I2 = randi(255, sz);

exi = fn_expand(I1);

qim1 = fn_QuImg(exi);
qim2 = fn_QuImg(I2);

qimarn = fn_arnscr(qim1);
qimfib = fn_fibscr(qimarn);

sb0 = fn_LSBext(qimfib, 0);
sb1 = fn_LSBext(qimfib, 1);
cb0 = fn_LSBext(qim2, 0);
cb1 = fn_LSBext(qim2, 1);

n = log2(length(I2));

for i = 0:length(cb0)-1
    if sb0(i+1) ~= cb0(i+1)
        qim2 = fn_UT0(qim2, i, n);
    end
    if sb1(i+1) ~= cb1(i+1)
        qim2 = fn_UT1(qim2, i, n);
    end
end    

stim = fn_QtoC(qim2);

ex1 = fn_LSQbext(qim2, 0:1);
ex1 = fn_invfib(ex1);
ex1 = fn_invarn(ex1);
ex2 = fn_QtoC(ex1);
fi = fn_shrink(ex2);


