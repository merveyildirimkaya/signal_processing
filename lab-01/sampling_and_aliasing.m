clc;
clear;
close all;

% Signal parameters
f = 12;          % input signal frequency (Hz)
fs = 15;         % sampling frequency (samples/second)

% Sampling period
Ts = 1/fs;       % time between two samples (seconds)

% Continuous-time signal for visualization
t = 0:0.001:1;
x_cont = cos(2*pi*f*t);

% Sampling instants
ts = 0:Ts:1;

% Samples of the 12 Hz signal
x_samp = cos(2*pi*f*ts);

% Aliased frequency for this specific example
f_alias = 3;

% 3 Hz signal
x_alias = cos(2*pi*f_alias*t);


figure

% Original 12 Hz signal and its samples
subplot(2,1,1)

plot(t, x_cont, 'LineWidth', 1.2)
hold on
stem(ts, x_samp, 'filled')

grid on
xlabel('Time (s)')
ylabel('Amplitude')
title('12 Hz Signal Sampled at 15 Hz')
legend('12 Hz continuous signal', 'Samples')


% 3 Hz signal and the SAME samples
subplot(2,1,2)

plot(t, x_alias, 'LineWidth', 1.2)
hold on
stem(ts, x_samp, 'filled')

grid on
xlabel('Time (s)')
ylabel('Amplitude')
title('Same Samples Correspond to a 3 Hz Signal')
legend('3 Hz signal', 'Same samples')