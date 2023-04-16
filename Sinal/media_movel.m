function y = media_movel(n,x)
    L = length(x);
    y=zeros(1,L);
    k = 2;
    for i=1:L
        if(k-n) < 0
            ini = 1;
        else
            ini = k-n+1;
        end
        
        if(k <= L)
            y(i) = mean(x(ini:k));
        else
            y(i) = mean(x(ini:L));
        end
        
        k = k + 1;
    end
end