function y = convolucao(x,h)
% Função para calcular a convolução entre dois sinais no tempo
% y é o sinal resultante da convolução
% x é o sinal
% h é o sinal a ser aplicado em x

    L = length(x) + length(h) - 1;
    y = zeros(1,L);
    for i=1:L
        for j=1:length(h)
            if((i - j + 1) >= 1) && ((i - j + 1) <= length(x))
                y(i) = y(i) + h(j)*x(i-j+1);
            end
        end 
    end

end