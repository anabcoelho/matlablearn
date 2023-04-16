clear
close all
clc

%% Teste da funcao de convolucao
x = [1 2 3 2 5]
h = [2 1]

y = convolucao(x,h)

f = conv(x,h)

%% Filtragem usando convolucao
fs = 10000;
F = 10;
amplitude = 10;
pulso = zeros(1,fs);
pulso(0.2*fs:0.65*fs-1) = ones(1,0.45*fs);
a = 0:1/fs:(1-1/fs);
x = amplitude * sin(2 * pi * F * a);
plot(x)
title('Sinal senoide')
ylim([-20 20])

ampRampa = 50;
dr = fs/ampRampa;
r = 0:1/dr:(ampRampa - 1/dr);
figure
plot(r)
title('Sinal rampa')
xlim([0 10000])

figure
plot(pulso)
title('Sinal pulso')
ylim([-2 2])

x = x + r;
x = x .* pulso;
figure
plot(x)
title('Sinal (rampa + senoide) * pulso')
ylim([-10 45])

%% Filtragem passa-baixas
fc = 2;
[b,a] = butter(2,fc*2/fs,'low');
[h,t] = impz(b,a);

figure
plot(h)
title('Filtro passa-baixas')

y = convolucao(x,h);
figure
plot(y)
title('Sinal filtrado em passa-baixas')
ylim([-10 45])

%% Filtragem passa-altas
fc = 2;
[b,a] = butter(2,fc*2/fs,'high');
[h,t] = impz(b,a);

figure
plot(h)
title('Filtra passa-altas')

y = convolucao(x,h);
figure
plot(y)
title('Sinal filtrado em passa-altas')
ylim([-40 40])