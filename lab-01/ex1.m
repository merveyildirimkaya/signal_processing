nn = 0:99;                    % Time indices
xx = cos((2/3*pi)*nn);         % Input signal
bb = [1/3 1/3 1/3];           % FIR filter coefficients

yy = firfilt(bb,xx);              % Filtering = convolution


figure

subplot(2,1,1)
stem(nn,xx,'filled')
xlabel('n')
ylabel('x[n]')
title('Input Signal')

subplot(2,1,2)
stem(0:length(yy)-1,yy,'filled')
xlabel('n')
ylabel('y[n]')
title('Output of 3-Point Averaging FIR Filter')