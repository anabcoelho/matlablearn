clear
close all
clc

%% Exponencial
dt = 0.00005;
t = -0.005:dt:0.005;
x = exp(-1000*abs(t));
plot(t,x)
title('Função exponencial')
xlabel('Tempo (s)')

%% Tranformada de Fourier de tempo contínuo
[W,X] = ctft(t,x,dt);
figure
plot(W,X)
title('Tranformada de Fourier da função exponencial')
xlabel('Frequência (Hz)')

%% Função porta
dt = 0.005;
t = -1:dt:1;
x = 5 * ones(1,length(t));
figure
plot(t,x)
title('Função porta')
xlabel('Tempo (s)')

%% Tranformada de Fourier de tempo contínuo
[W,X] = ctft(t,x,dt);
figure
plot(W,X)
title('Tranformada de Fourier da função porta')
xlabel('Frequência (Hz)')
