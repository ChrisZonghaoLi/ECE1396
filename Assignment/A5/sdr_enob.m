close all 
clear all

%% Binary weigthed DAC %%
% bin SDR and ENOB
fin = [0.1 1.1 2.1 4.9];
SDR_10 = [13.31 13.67 9.03 6.82];
SDR_15 = [13.24 12.06 9.08 3.69];

figure(1)
plot(fin, SDR_10,'-o')
xlabel('frequency (GHz)')
ylabel('SDR')
hold on
plot(fin, SDR_15,'-o')
legend('fsamp = 10Gs/s','fsamp = 15Gs/s')
grid on
hold off

% bin SDR and ENOB
ENOB_10 = (SDR_10 - 1.76)./6.02;
ENOB_15 = (SDR_15 - 1.76)./6.02;

figure(2)
plot(fin, ENOB_10,'-o')
xlabel('frequency (GHz)')
ylabel('ENOB')
hold on
plot(fin, ENOB_15,'-o')
legend('fsamp = 10Gs/s','fsamp = 15Gs/s')
grid on

%% Segmented weigthed DAC %%
fin = [0.1 1.1 2.1 3.1 6.1 9.1];
SDR_18 = [46.96 42.37 39.27 38.17 40 35.76];
ENOB_18 = (SDR_18 - 1.76)./6.02;

figure(3)
plot(fin, SDR_18,'-o')
xlabel('frequency (GHz)')
ylabel('SDR')
legend('fsamp = 18Gs/s')
grid on

figure(4)
plot(fin, ENOB_18,'-o')
xlabel('frequency (GHz)')
ylabel('ENOB')
legend('fsamp = 18Gs/s')
grid on
