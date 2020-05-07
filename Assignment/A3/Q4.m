close all 
clear all

f = logspace(7,10,30);
s = -1j*2*pi*f;
Q = 8;
G = 0.8;
f0 = 180*10^6;
w0 = 2*pi*f0;
k1 = G*w0/Q;
fs = 10*10^9; % 10 GHz sampling frequency

%H_s = tf([a1],[1 w0/Q w0^2]);
H_s = k1.*s./(s.^2+s.*w0./Q+w0.^2);

figure(1)
loglog(f,abs(H_s),'-rs')
grid on

syms z
n = k1*(2*fs*(z-1)/(z+1));
d = (2*fs*(z-1)/(z+1))^2 + (2*fs*(z-1)/(z+1))*w0/Q + w0^2;
vpa(partfrac(n/d, z))

a2 = 2*fs*k1/(4*fs^2+2*fs*w0/Q);
a0 = -2*fs*k1/(4*fs^2+2*fs*w0/Q);
b1 = (2*w0^2-8*fs^2)/(4*fs^2+2*fs*w0/Q);
b0 = (4*fs^2-2*fs*w0/Q+w0^2)/(4*fs^2+2*fs*w0/Q);

n = [a2 0 a0];
d = [1 b1 b0];

figure(2)
[h,w] = freqz(n,d,'whole',1001);
plot(w/pi,20*log10(abs(h)))
ax = gca;
ax.YLim = [-100 20];
ax.XTick = 0:.5:2;
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')

figure(3)
[hz,hp,ht] = zplane(n,d);

%% Hypothesis to see how sampling frequency affect b1 and b0
fs = 10*10^9:1*10^9:100*10^9;

b1 = (2.*w0.^2-8.*fs.^2)./(4.*fs.^2+2.*fs.*w0./Q);
b0 = (4.*fs.^2-2.*fs*w0/Q+w0^2)./(4.*fs.^2+2.*fs.*w0./Q);

figure(4)
plot(fs,-1/2*b1);
hold on
plot(fs,b0);

n = [0 0.0056];
d = [1 -1];

figure(5)
[h,w] = freqz(n,d,'whole',1001);
plot(w/pi,20*log10(abs(h)))
ax = gca;
ax.YLim = [-100 20];
ax.XTick = 0:.5:2;
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')
