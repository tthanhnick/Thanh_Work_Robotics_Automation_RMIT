% Sources code from https://www.mathworks.com/help/matlab/ref/fft.html 
clc; clear; close all; format compact; format shortG
data=xlsread('Book1.xlsx');
x_axis=data(:,3);
%y_axis=data(:,2);
time_axis=data(:,4);
% Plot acceleration vs time domain
figure(1);
plot(time_axis, x_axis);
grid on;
title("acceleration of x axis over time");
xlabel("t (seconds)");
ylabel("a(x) m/s^2");
%% Vibration analysis
x=x_axis;
N=length(time_axis); % Time length
K=time_axis;
% Compute the Fourier transform of the signal
X_K=fft(x,N); % Fast fourier transform
L = time_axis(end);
% Compute the two-sided spectrum P2. 
% Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L.
P2 = abs(X_K/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

Fs = 100; %100 Hz sampling frequency
f = Fs*(0:(L/2))/L;
figure(2);
plot(f,P1)
grid on;
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")