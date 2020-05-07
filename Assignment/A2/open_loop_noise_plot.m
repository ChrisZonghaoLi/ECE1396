close all 
clear all

f = logspace(3,8);

%% 3rd order PLL characterizations %%
% some specs:
N = 49.1; % dB, divider
K_vco = 300e6; % Hz/V
C1 = 5*10^-12;
C2 = 1/10 * C1;
R = 306e3;
s = 1j*2*pi*f;
w_pll = 0.8*pi*(5.2*10^5);
w_z = 0.5 * w_pll;
w_p = (1+C1/C2)*w_z;

% Reference and VCO noise model:
L_ref = 10^-6./f.^2 + 10^-16;
L_ref_out = 10^(N/10)*(10^-6./f.^2 + 10^-16);
L_vco = 10^6./f.^3 + 10^-14;

% uncomment below to plot Bode plot of PLL loop gain
L_s = tf([w_pll^2/w_z w_pll^2],[1/w_p 1 0 0]);
figure('Name','PLL loop gain Bode plot')
bode(L_s)
grid on
title('PLL loop gain Bode plot')

% PLL loop gain
L_s = (w_pll^2./s.^2) .* (s./w_z + 1)./(s/((1+C1/C2)*w_z)+1); 
% PLL closed-loop response
H_s = (1+s./w_z)*10^(N/10)./(1+s./w_z+s.^2./w_pll.^2+s.^3./(w_p*w_pll.^2));

% Reference oscillator closed-loop transfer function
H_ref = H_s;

% VCO closed loop transfer function
H_vco = 1./(1+L_s); 

% loop filter closed loop transfer function
H_lp = K_vco./s./(1+L_s); 
% loop filter open loop transfer function
L_lp = 1/(R*C1*C2) .* (s./w_z + 1)./(s.^2+s.*w_z.*(1+C1/C2)); 

% Charge pump closed-loop response
H_cp = L_lp.*K_vco./s./(1+L_s);

% Total output noise in total from ref and VCO
L_out = L_ref.*(H_ref).^2 + L_vco.*(H_vco).^2; 

% Noise frequency response from various nodes from PLL
figure('Name','Noise frequency response from various nodes from PLL')
loglog(f,10*log10(L_ref),'-rs')
hold on
loglog(f,10*log10(L_ref_out),'-bs')
hold on
loglog(f,10*log10(L_vco),'-gs')
hold on
loglog(f,10*log10(L_out),'-ks')
grid on
legend('L_{n,ref}','N^{2}*L_{n,ref}','L_{n,vco}', 'L_{out, total}')
xlabel('f (Hz) log scale')
ylabel('L (dBc/Hz)')
hold off

% loop filter frequency response (open loop)
figure('Name','Loop filter open-loop and closed-loop (noise) frequency response')
subplot(2,1,1)
loglog(f,10*log10(abs(L_lp)),'-rs')
grid on
legend('Loop filter open-loop')
xlabel('f (Hz) log scale')
ylabel('L (dBc/Hz)')
hold off
subplot(2,1,2)
loglog(f,10*log10(abs(H_lp)),'-bs')
grid on
legend('Loop filter closed-loop')
xlabel('f (Hz) log scale')
ylabel('L (dBc/Hz)')
hold off

% VCO closed-loop frequency response 
figure('Name','VCO open-loop and closed-loop (noise) frequency response')
loglog(f,abs(H_vco),'-bs')
grid on
legend('VCO closed-loop')
xlabel('f (Hz) log scale')
ylabel('L (dBc/Hz)')
hold off

% Charge pump closed-loop frequency response 
figure('Name','Charge pump closed-loop frequency response (noise) frequency response')
loglog(f,abs(H_cp),'-bs')
grid on
legend('Charge pump closed-loop')
xlabel('f (Hz) log scale')
ylabel('L (dBc/Hz)')
hold off

% PLL closed loop frequency response 
figure('Name','PLL closed loop frequency response')
loglog(f,abs(H_s),'-rs')
legend('PLL close-loop transfer function')
xlabel('f (Hz) log scale')
ylabel('|H(s)|')
grid on

% PLL closed loop step response
figure('Name','PLL closed loop step response')
H = tf([10^(N/10)/w_z 10^(N/10)],[1/(w_p*w_pll^2) 1/(w_pll^2) 1/w_z 1]);
step(H)
grid on