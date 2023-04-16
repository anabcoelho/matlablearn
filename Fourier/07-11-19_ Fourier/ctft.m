function [W,X] = ctft(t,x,dt)
% Fun��o para calcular a Tranformada de Fourier de Tempo Cont�nuo
% W � o vetor de frequ�ncias em Hz
% X � o sinal no dom�nio da frequ�ncia
% t � o vetor de tempo em segundos
% x � o sinal no dom�nio do tempo
% dt � o per�odo de amostragem do sinal

    Fmax = 1/(10*dt);
    K = (length(x) - 1) * 4;
    Wmax = 2*pi*Fmax;
    k = 0:K;
    W = k*Wmax/K;
    X = x * exp(-j*t'*W) * dt;
    X = real(X);
    W = [-fliplr(W), W(2:(K+1))];
    X = [fliplr(X), X(2:(K+1))];
end