x = linspace(0,2*pi,60);
a = sin(x);
b = cos(x);
plot(x,a+b)
hold on
stem(x,a)
stem(x,b)
hold off