%% Questão 1

close all
clear
clc

Fs = 256;             % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1 * Fs;         % Length of signal
t = (0:L-1)*T;        % Time vector
F = 5;
S = 0.7*sin(2*pi*F*t);
plot(t,S)
title('Sinal no tempo')
xlabel('Tempo (s)')
ylabel('Amplitude')

%Magnitude
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
axis ( [0 20 0 1] )

%Fase
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

%% Questão 2

close all
clear
clc

Fs = 512;             % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1 * Fs;         % Length of signal
t = (0:L-1)*T;        % Time vector
F = 5;
S = 0.7*sin(2*pi*F*t);
plot(t,S)
title('Sinal no tempo')
xlabel('Tempo (s)')
ylabel('Amplitude')

%Magnitude
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
axis ( [0 20 0 1] )

%Fase
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
%% Questão 3

close all
clear
clc

Fs = 256;             % Sampling frequency                    
Tempo = 1/Fs;             % Sampling period       
Len = Fs;         % Length of signal
t = (0:Len-1)*Tempo;        % Time vector
F = 5;
se = 0.7*sin(2*pi*F*t);%Função

z= zeros ([1 256]);%256 zeros

S= [se z]; %Junção

L = 2*Fs; %Dobrando o tempo para plotar S         
T = (0:L-1)*Tempo;

plot(T,S)
title('Sinal no tempo')
xlabel('Tempo (s)')
ylabel('Amplitude')

%Magnitude
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
axis ( [0 20 0 1] )

%Fase
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

%% Questão 4

close all
clear
clc

Fs = 256;             % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1 * Fs;         % Length of signal
t = (0:L-1)*T;        % Time vector
F = 1.25;             
S = 0.7*sin(2*pi*F*t);
plot(t,S)
title('Sinal no tempo')
xlabel('Tempo (s)')
ylabel('Amplitude')

%Magnitude
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
axis ( [0 20 0 1] )

%Fase
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

%% Questão 5

close all
clear
clc

Fs = 200;             % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 2 * Fs;         % Length of signal
t = (0:L-1)*T;        % Time vector

F1= 2*sin(2*pi*5*t)
F2= 2*sin(2*pi*6*t)
F3= 1*sin(2*pi*60*t)

S = F1 + F2 + F3;
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

%% Questão 6

close all
clear
clc

Fs = 512;             % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1 * Fs;         % Length of signal
Amp = 10; %amplitude
F= 5; %Frequência 
pulso = [zeros([1 L/4]) Amp*ones([1 L/2]) zeros([1 L/4])];
tempo= (-0.5:T:0.5-T); %
plot(tempo, pulso)
S=[pulso pulso pulso pulso pulso];
t= -2.5:T:(2.5-T);% Tempo correção
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
%% Questão 7: ECG Analise

close all
clear
clc

%Abrir
load('ECG_10min.mat')

numbat=20; %Numero de batimentos
a=anot(1:numbat+1,2);
S= s1(a(1):a(end));

T = 1/fs;             % Sampling period       
L = length(S);         % Length of signal
t = (0:L-1)*T;        % Time vector

plot(t,S)
title('batimentos')

f = fs*(0:(L/2))/L;
Namostras= length(S);

%% Magnitude
Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

figure
plot(f,P1) 
title('Espectro de Magnitude do ECG 20 batimentos')
xlabel('F (Hz)')
ylabel('|P1(f)|')
axis ([ 0 15 0 0.07])

%Fase
Y2=Y/L;
threshold = max(abs(Y/L))/1000000;
Y2(abs(Y/L)<threshold) = 0;
P2 = angle(Y2)*180/pi;
P1 = P2(1:L/2+1);
P1(2:end-1) = P1(2:end-1);
figure
stem(f,P1);
title('Espectro de Fase do ECG 20 batimentos')
xlabel('F (Hz)')
ylabel('Fase (graus)')

%% cont.
load('ECG_10min.mat')
numbat=180; %Numero de batimentos
a=anot(1:numbat+1,2);
S= s1(a(1):a(end));

T = 1/fs;             % Sampling period       
L = length(S);         % Length of signal
t = (0:L-1)*T;        % Time vector

plot(t,S)
title('Sinal antes')

f = fs*(0:(L/2))/L;
Namostras= length(S);

janela = 0.5 * fs;
ovl = 0.5 * janela;
[pxx,f] = pwelch(S,hanning(janela),ovl,janela,fs);

figure
plot(f,10*log10(pxx))
title('PSD de Welch com janela hanning antes')
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')

%% Questão 8: ECG Filtrar
%%Antes
load('ECG_10min.mat')
numbat=180; %Numero de batimentos
a=anot(1:numbat+1,2);
S= s1(a(1):a(end));

T = 1/fs;             % Sampling period       
L = length(S);         % Length of signal
t = (0:L-1)*T;        % Time vector

plot(t,S)
title('Sinal antes')

f = fs*(0:(L/2))/L;
Namostras= length(S);

janela = 0.5 * fs;
ovl = 0.5 * janela;
[pxx,f] = pwelch(S,hanning(janela),ovl,janela,fs);

figure
plot(f,10*log10(pxx))
title('PSD de Welch com janela hanning antes')
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')
%% Passa banda (ordem 4, 10-20hz)
f1 = 10;
f2 = 20;
[b,a] = butter(4,[f1 f2]*2/fs);
fvtool(b,a)
S = filtfilt(b,a,S);
figure
plot(t,S)
title('Sinal filtrado em passa-banda')
xlabel('Tempo (s)')

%% 
janela = 0.5 * fs;
ovl = 0.5 * janela;
[pxx,f] = pwelch(S,hanning(janela),ovl,janela,fs);

figure
plot(f,10*log10(pxx))
title('PSD de Welch com janela hanning depois')
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')
%% Questão 9: EMG

close all
clear
clc

%% Abrir
load('EMG_FSD_100.mat')
S=sinal;

%% O sinal
T = 1/fs;             % Sampling period       
L = length(S);         % Length of signal
t = (0:L-1)*T;        % Time vector
plot(t,S)
title('Sinal no tempo antes')
xlabel('Tempo (s)')
ylabel('Amplitude')
%%
% Análise espectral antes
%Tamanho do sinal

f = fs*(0:(L/2))/L;
Namostras= length(S);

%Magnitude
Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

figure
plot(f,P1) 
title('Espectro de Magnitude do EMG Antes')
xlabel('F (Hz)')
ylabel('|P1(f)|')

%Fase
Y2=Y/L;
threshold = max(abs(Y/L))/1000000;
Y2(abs(Y/L)<threshold) = 0;
P2 = angle(Y2)*180/pi;
P1 = P2(1:L/2+1);
P1(2:end-1) = P1(2:end-1);
figure
stem(f,P1);
title('Espectro de Fase do EMG Antes')
xlabel('F (Hz)')
ylabel('Fase (graus)')

%% PSD

janela = 0.5 * fs;
ovl = 0.5 * janela;
[pxx,f] = pwelch(S,hanning(janela),ovl,janela,fs);

figure
plot(f,10*log10(pxx))
title('PSD de Welch com janela hanning Antes')
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')

%% Filtragem
%6 Butterworth rejeita faixa de 2 ordem nas frequências de rede
    
w1 = 59*2/fs;
w2 = 61*2/fs;  
[b,a] = butter(2,[w1 w2],'stop');
fvtool(b,a)
S = filtfilt(b,a,S);
       
w1 = 119*2/fs;
w2 = 121*2/fs;  
[b,a] = butter(2,[w1 w2],'stop');
fvtool(b,a)
S = filtfilt(b,a,S);

w1 = 179*2/fs;
w2 = 181*2/fs;  
[b,a] = butter(2,[w1 w2],'stop');
fvtool(b,a)
S = filtfilt(b,a,S);
    
w1 = 239*2/fs;
w2 = 241*2/fs;  
[b,a] = butter(2,[w1 w2],'stop');
fvtool(b,a)
S = filtfilt(b,a,S);
    
w1 = 299*2/fs;
w2 = 301*2/fs;  
[b,a] = butter(2,[w1 w2],'stop');
fvtool(b,a)
S = filtfilt(b,a,S);
    
w1 = 359*2/fs;
w2 = 361*2/fs;  
[b,a] = butter(2,[w1 w2],'stop');
fvtool(b,a)
S = filtfilt(b,a,S);
plot(S)
title('EMG filtrado em frequencias de rede')

%% 2 Butterworth de 8 ordem com corte em 10-400Hz
fc = 400;
[b,a] = butter(8,fc*2/fs,'low');
fvtool(b,a)
S = filtfilt(b,a,S);
figure
plot(t,S)
title('Sinal filtrado em passa-baixas')
xlabel('Tempo (s)')

%%
fc = 10;
[b,a] = butter(8,fc*2/fs,'high');
fvtool(b,a)
S = filtfilt(b,a,S);
figure
plot(t,S)
title('Sinal filtrado em passa-altas')
xlabel('Tempo (s)')


%% Análise espectral depois

T = 1/fs;
L = 1 * fs; %Tamanho do sinal
f = fs*(0:(L/2))/L;
Namostras= length(S);

%Magnitude
Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

figure
plot(f,P1) 
title('Espectro de Magnitude do EMG Depois')
xlabel('F (Hz)')
ylabel('|P1(f)|')

%Fase
Y2=Y/L;
threshold = max(abs(Y/L))/1000000;
Y2(abs(Y/L)<threshold) = 0;
P2 = angle(Y2)*180/pi;
P1 = P2(1:L/2+1);
P1(2:end-1) = P1(2:end-1);
figure
stem(f,P1);
title('Espectro de Fase do EMG ')
xlabel('F (Hz)')
ylabel('Fase (graus)')

%% PSD

janela = 0.5 * fs;
ovl = 0.5 * janela;
[pxx,f] = pwelch(S,hanning(janela),ovl,janela,fs);

figure
plot(f,10*log10(pxx))
title('PSD de Welch com janela hanning depois')
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')

%% Sinal final
plot(t,S)
title('Sinal filtrado')
xlabel('Tempo (s)')
%% Retificando 
x=abs(S);
plot(t,x)
title('Sinal retificado')
xlabel('Tempo (s)')
