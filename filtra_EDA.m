%% Abrir
%% Abrir EDA
CSVtoMAT ('EDA.csv');
load('x.mat');
%% Abrir tags
exporttags('tags.csv')
load ('tag.mat')

tags=tagsraw-hour;%% Unir tags

ntags=length(tags);
axisy= [2*ones(ntags,1)];%% Arrumar as tags

%% O sinal propriamente dito
T = 1/fs;             % Sampling period       
L = length(signal);         % Length of signal
t = (0:L-1)*T;        % Time vector
plot(t,signal)
hold on
stem(tags,axisy)
hold off
title('Sinal no tempo')
xlabel('Tempo (s)')
ylabel('Amplitude')
%% Análise espectral
%Tamanho do sinal
f = fs*(0:(L/2))/L;
Namostras= length(signal);

%Magnitude
Y = fft(signal);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

figure
plot(f,P1) 
title('Espectro de Magnitude do EDA Antes')
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
title('Espectro de Fase do EDA Antes')
xlabel('F (Hz)')
ylabel('Fase (graus)')
%% Filtro Gaussiano
L=300; %numero de pontos 
N=1.5; % sigma da distribuição normal 0-3
gaussFilter = gausswin(L,N);
gaussFilter = gaussFilter / sum(gaussFilter);% Normalizando
SCL=conv(signal, gaussFilter, 'same');
plot(gaussFilter)
%% Filtragem passa baixas (para remoção de ruído) (via butterworth, dizem que gaussiano funciona melhor)
fc = 5;
[b,a] = butter(10,fc/fs/2,'low');
fvtool(b,a)
filtsignal = filtfilt(b,a,signal);
%% Plotar EDA filtrado
figure
plot(t,filtsignal)
hold on
stem(tags,axisy)
hold off
title('filtered data')
xlabel('Tempo (s)')
%% Mediana Móvel
window=8; %seconds
size= fs*window;
signalmed=medfilt1(filtsignal,size);
%% Plotar SCL
figure
plot(t,signalmed)
hold on
stem(tags,axisy)
hold off
title('Skin Conductance Level')
xlabel('Tempo (s)')
%% SCR
SCR=signal-SCL;
%% Plotar SCR
figure
plot(t,SCR)
hold on
stem(tags,axisy)
hold off
title('Skin Conductance Response')
xlabel('Tempo (s)')
%% Identificar onsets e offsets
% Onset
%for i=1:size(moment,1)