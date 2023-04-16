clear
close all
clc

%% Teste da funcao de media-movel
x = [4 8 6 -1 -2 -3 -1 3 4 5]

n = 3;
y = media_movel(n,x)
f = movmean(x,n)

subplot(2,1,1)
plot(x)
hold on
plot(y)
title('Filtro media-movel')
legend('Sinal original','Sinal filtrado')

%% Teste da funcao de mediana-movel
y = mediana_movel(n,x)
f = movmedian(x,n)

subplot(2,1,2)
plot(x)
hold on
plot(y)
title('Filtro mediana-movel')
legend('Sinal original','Sinal filtrado')
