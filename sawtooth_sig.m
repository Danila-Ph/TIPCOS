function [x, t_mark] = sawtooth_sig(f, Fs, t0, t1)
% ������� ��� ������������ ������������� ������� �������� ������� f.
% ���������:
% f  - ������� �������
% Fs - ������� �������������
% t0 - ��������� ������ �������
% t1 - �������� ������ �������.
% �������� ������:
% x  - �������� �������� �������
% t_mark - ��������� ����� �������� �������� �������

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

y = interp1([0 period], [0 1], time);

end