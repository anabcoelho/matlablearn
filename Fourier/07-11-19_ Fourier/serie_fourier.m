clear
close all
clc
%% Coeficientes
qtdCoef = 8;
%% Sinal senoidal retificado
fs = 10000;
F = 10;
amplitude = 10;
t = 0:1/fs:(1-1/fs);
x = amplitude * sin(2 * pi * F * t);
x = abs(x);
plot(t,x)
title('Sinal senoidal retificado')
xlabel('Tempo (s)')
ylabel('Amplitude')

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

%% Espectro plot
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

%% Função porta
fs = 10000; %% Freq. Amostragem
F = 5; %% Freq
A=5
amplitude = A;
t = -1:1/fs:(1-1/fs);
pulso = [amplitude*ones(1,fs/(2*F)) zeros(1,fs/(2*F))];
x = pulso(length(pulso)/4:end);
s=x
for cont=2:10
    x = [x pulso];
end
y=x
z = [y pulso(1:(length(pulso)/4)-1)];
figure
plot(t,z)
title('Função porta')
xlabel('Tempo (s)')
ylabel('Amplitude')

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