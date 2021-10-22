%% Gerando função b
%%Função porta em 0
t=(-700:0.001:700);
x=square (0.5*pi*t);
%%Offset
shift=-1000
s = zeros(size(x));
s(1:end+shift) = x(-shift+1:end);
plot (t,s)
axis ( [-7 7 -2 2] )