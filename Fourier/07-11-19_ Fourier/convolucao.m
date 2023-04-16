function y = convolucao(x,h)
% Fun��o para calcular a convolu��o entre dois sinais no tempo
% y � o sinal resultante da convolu��o
% x � o sinal
% h � o sinal a ser aplicado em x

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