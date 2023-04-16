Fs = 4000000;             % Sampling frequency  (microhz)                  
T = 1/Fs;             % Sampling period       
L = length(EDA)   % Length of signal
t = (0:L-1)*T;        % Time vector
S = EDA;
plot(t,S)
title('Sinal no tempo')
xlabel('Tempo (s)')
ylabel('Amplitude')
%% 
f = Fs*(0:(L/2))/L;
Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

figure
plot(f,P1) 
title('Espectro de Magnitude de S(t)')
xlabel('F (Hz)')
ylabel('|P1(f)|')


Y2=Y/L;
threshold = max(abs(Y/L))/1000000;
Y2(abs(Y/L)<threshold) = 0;
P2 = angle(Y2)*180/pi;
P1 = P2(1:L/2+1);
P1(2:end-1) = P1(2:end-1);
figure
stem(f,P1);
title('Espectro de Fase de S(t)')
xlabel('F (Hz)')
ylabel('Fase (graus)')
 %%
    
fc = 400;
[b,a] = butter(1,fc*2/Fs,'high');
fvtool(b,a)
S = filtfilt(b,a,S);
figure
plot(t,S)
title('Sinal filtrado em passa-altas')
xlabel('Tempo (s)')
