close all
clear
clc

%% Calculo da Magnitude e fase de um sinal por meio da fft
Fs = 200;             % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1.5 * Fs;         % Length of signal
t = (0:L-1)*T;        % Time vector
F = 10;
S = 0.7*cos(2*pi*F*t + pi/3) + 0.5*cos(2*pi*2*F*t + pi/3);
plot(t,S)
title('Sinal no tempo')
xlabel('Tempo (s)')
ylabel('Amplitude')

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

%% Periodograma do sinal somado a um ruido branco
S = S + 0.35*randn(size(t));
figure
plot(t,S)
title('Sinal com ruido no tempo')
xlabel('Tempo (s)')
ylabel('Amplitude')
%%

janela = 0.5 * Fs;
ovl = 0.5 * janela;
[pxx,f] = pwelch(S,hanning(janela),ovl,janela,Fs);

figure
plot(f,10*log10(pxx))
title('PSD de Welch com janela hanning')
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')


janela = 0.5 * Fs;
ovl = 0.5 * janela;
[pxx,f] = pwelch(S,janela,ovl,janela,Fs);

figure
plot(f,10*log10(pxx))
title('PSD de Welch com janela retangular')
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')


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