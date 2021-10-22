clear
close all
clc
%% Exercício 1

%% Coeficientes
qtdCoef = 8;
%% Função 1: Triangulos
fs=100;
q=0:1/fs:(2-1/fs);
y=2-q;
r=[q y]; % Triângulo
x= [r r r]; %3 triângulos
t=-6:1/fs:(6-1/fs);
plot (t,x)
title('Rampas')%nome bonitin
xlabel('Tempo')
ylabel('Amplitude')
axis([-7 7 0 2.1]) % arrumando um poquinho [x x y y]
%% Função 2:
fs = 1000;
F = 2;
Amp=5;
q = -1:1/fs:(1-1/fs);
pulso = [Amp*ones(1,fs/2*F) zeros(1,fs/2*F)];
z=[pulso pulso pulso];
t=-5:1/fs:(5-1/fs)
plot(t,z)
title('Função')
xlabel('Tempo (s)')
ylabel('Amplitude')
%% Função 3:
%% Função 4:
%% Função 5:
%% Função 6:
%% Função 7:
%% Serie de Fourier
f = fit(t',x',['fourier' num2str(qtdCoef)])
nomes = coeffnames(f)
coefs = coeffvalues(f)
F0 = coefs(1)
Fn = 0.5 * coefs(2);
for cont=2:qtdCoef
    Fn = [Fn 0.5 * coefs(2 * cont)];
end
Fn
freq = f.w / (2*pi)

%% Espectro
w = 2*ones(1,qtdCoef);
for cont=1:qtdCoef
    w(cont) = cont * w(cont); 
end
w = pi*[(-1) * flip(w) 0 w];
serie = [flip(Fn) F0 Fn]
figure
stem(w,serie)
title(['Espectro calculado pelos ' num2str(qtdCoef) ' primeiros termos da Serie de Fourier'])
xlabel('W')
ylabel('Amplitude')

%% Aproximacao do sinal
figure
plot(f,t',x')
title('Sinal aproximado pela Serie de Fourier')