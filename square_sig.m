function [x, t_mark] = square_sig(f, Fs, t0, t1)
% Функция для формирования прямоугольного сигнала заданной частоты f.
% Параметры:
% f  - частота сигнала
% Fs - частота дискретизации
% t0 - начальный момент времени
% t1 - конечный момент времени.
% Выходные данные:
% x  - выходные значения сигнала
% t_mark - временные метки выходных отсчетов сигнала

t_mark = t0:1/Fs:t1;
Ln = length(t_mark);
x = zeros(1,Ln);
for n=1:Ln
    x(n) = sq_sig(t_mark(n),1/f);
end

end

function y = sq_sig(time, period)

while time>period
    time = time - period; 
end

if time>period/2
    y = 1;
else
    y = -1;
end

end