close all 
clear all

% output = readtable('vout_ramp_bin_dac_mc.csv');
% output = table2array(output(:,2:end));
% output_mean = mean(output,2);
% output_norm = output_mean/max(output_mean);


output = readtable('vout_ramp_seg_dac_mc.csv');
output = table2array(output(:,2));
output_mean = mean(output,2);
output_norm = output_mean/max(output_mean);
[counts,centres] = hist(output_norm,2^6);

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

