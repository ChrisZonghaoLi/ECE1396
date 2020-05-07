close all 
clear all

% amp = 20*log10([2.5e-3, 57.25e-3, 112e-3, 166.8e-3, 221.5e-3, 276.2e-3, 331e-3, 385.7e-3, 440.5e-3, 495.3e-3, 550e-3]);
% snr = [7.25, 42.16, 41.66, 47.37, 59.03, 59.03, 59.02, 59.02, 53.86, 59.23, 61.55];
% enob = (snr - 1.76)/6.02;
% figure(3)
% plot(amp, snr, '-o', 'linewidth', 3)
% xlabel('amplitude (dB)')
% ylabel('SDR (dB)')
% grid on
% 
% figure(4)
% plot(amp, enob, '-o', 'linewidth', 3)
% xlabel('amplitude (dB)')
% ylabel('ENOB')
% grid on

fin = [0.1, 1.1, 2.1, 3.1, 4.1, 5.1, 6.1];
% snr = [61.55, 59.59  57.14  54.7  55.61  56.869 60.27]; %single ADC
snr = [64, 61.75  55.72  62.59  54.702  55.327 46.54]; %2* time-interleaved ADC
enob = (snr - 1.76)/6.02;


figure(3)
plot(fin, snr, '-o', 'linewidth', 3)
xlabel('frequency (GHz)')
ylabel('SDR (dB)')
grid on

figure(4)
plot(fin, enob, '-o', 'linewidth', 3)
xlabel('frequency (dB)')
ylabel('ENOB')
grid on
