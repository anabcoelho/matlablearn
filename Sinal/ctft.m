function [W,X] = ctft(t,x,dt)
% Função para calcular a Tranformada de Fourier de Tempo Contínuo
% W é o vetor de frequências em Hz
% X é o sinal no domínio da frequência
% t é o vetor de tempo em segundos
% x é o sinal no domínio do tempo
% dt é o período de amostragem do sinal

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