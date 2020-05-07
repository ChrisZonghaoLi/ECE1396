close all 
clear all

%% testbench for DNL/INL by using ramp voltage input to ADC %%
fs = 7*10^9;
V = 1.1;
N = 8;
Vlsb = V/2^N;
res = 0.1; % resolution of lsb
Tramp_per_code = (1/res) * (1/fs);
ramp_slope = Vlsb/Tramp_per_code;
Tramp = V/ramp_slope/10^-9; % in nsecond


%%
output = readtable('ti_output_ramp_mismatch=1.csv');
output = table2array(output(:,2:end));

output_mean = mean(output,2);
output_norm = output_mean/max(output_mean);

[counts,centres] = hist(output_norm,2^N);

% calculate DNL
DNL = counts/mean(counts) - 1;
figure(1)
stem(DNL,'o');
xlabel('code word')
ylabel('DNL')
grid on

% calculate INL, which is the accumulative sum of DNL
INL = cumsum(DNL);
figure(2)
stem(INL,'o');
xlabel('code word')
ylabel('INL')
grid on

