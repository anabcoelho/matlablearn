clear
close all
clc

%% Exponencial
dt = 0.00005;
t = -0.005:dt:0.005;
x = exp(-1000*abs(t));
plot(t,x)
title('Fun��o exponencial')
xlabel('Tempo (s)')

%% Tranformada de Fourier de tempo cont�nuo
[W,X] = ctft(t,x,dt);
figure
plot(W,X)
title('Tranformada de Fourier da fun��o exponencial')
xlabel('Frequ�ncia (Hz)')

%% Fun��o porta
dt = 0.005;
t = -1:dt:1;
x = 5 * ones(1,length(t));
figure
plot(t,x)
title('Fun��o porta')
xlabel('Tempo (s)')

%% Tranformada de Fourier de tempo cont�nuo
[W,X] = ctft(t,x,dt);
figure
plot(W,X)
title('Tranformada de Fourier da fun��o porta')
xlabel('Frequ�ncia (Hz)')
