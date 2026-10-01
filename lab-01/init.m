xx = [ones(1,10) zeros(1,5)];

bb = 1/3 * ones(1,3);

yy = conv(xx,bb);

subplot(2,1,1)
stem(xx,'filled')
title('Input x[n]')
xlabel('n')
ylabel('x[n]')

subplot(2,1,2)
stem(yy,'filled')
title('Output y[n]')
xlabel('n')
ylabel('y[n]')