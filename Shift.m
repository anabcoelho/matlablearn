funcion Shift (x,s) ;%%Mover gráfico no eixo y
s = zeros(size(x))
if shift >0
  s(shift+1:end) = x(1:end-shift);
elseif shift <0
  s(1:end+shift) = x(-shift+1:end);
end