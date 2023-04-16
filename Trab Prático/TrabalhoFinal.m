close all
clear
clc
%% Questão 1

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
Fs = 512;             % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1 * Fs;         % Length of signal
Amp = 10; %amplitude
F= 5; %Frequência 
pulso = [zeros([1 L/4]) Amp*ones([1 L/2]) zeros([1 L/4])];
tempo= (-0.5:T:0.5-T);
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
%Abrir
load('ECG_10min.mat')

%%
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

%% Questão 8: ECG Filtrar

%% Questão 9: EMG
%Abrir
load('EMG_FSD_100.mat')
S=sinal;
plot(S)
title('Sinal no tempo')
xlabel('Tempo (s)')
ylabel('Amplitude')

% Análise espectral antes

T = 1/fs;
L = 1 * fs; %Tamanho do sinal
f = fs*(0:(L/2))/L;
Namostras= length(S)

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
title('Espectro de Fase do EMG Antes')
xlabel('F (Hz)')
ylabel('Fase (graus)')


%Filtragem
%6 Butterworth rejeita faixa de 2 ordem nas frequências de rede
    
w1 = 59*2/fs;
w2 = 61*2/fs;  
[b,a] = butter(2,[w1 w2],'stop');
S(1,:) = filtfilt(b,a,S(1,:));
       
w1 = 119*2/fs;
w2 = 121*2/fs;  
[b,a] = butter(2,[w1 w2],'stop');
S(1,:) = filtfilt(b,a,S(1,:));

w1 = 179*2/fs;
w2 = 181*2/fs;  
[b,a] = butter(2,[w1 w2],'stop');
S(1,:) = filtfilt(b,a,S(1,:));
    
w1 = 239*2/fs;
w2 = 241*2/fs;  
[b,a] = butter(2,[w1 w2],'stop');
S(1,:) = filtfilt(b,a,S(1,:));
    
w1 = 299*2/fs;
w2 = 301*2/fs;  
[b,a] = butter(2,[w1 w2],'stop');
S(1,:) = f1ltfilt(b,a,S(1,:));
    
w1 = 359*2/fs;
w2 = 361*2/fs;  
[b,a] = butter(2,[w1 w2],'stop');
S(1,:) = filtfilt(b,a,S(1,:));

plot(S)
title('EMG filtrado em frequencias de rede')

%%2 Butterworth de 8 ordem com corte em 10-400Hz
    
[b,a] = butter(8,10*2/fs,'high');
S(1,:) = filtfilt(b,a,S(1,:))
    
[b,a] = butter(8,400*2/fs,'low');
S(1,:) = filtfilt(b,a,S(1,:));

t = 0:1/fs:(Namostras - 1)/fs;
plot(t,S)
title('EMG filtrado')



%Análise espectral depois

