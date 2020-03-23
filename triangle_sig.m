function [x, t_mark] = triangle_sig(f, Fs, t0, t1)
% ������� ��� ������������ ������������ ������� �������� ������� f.
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
    x(n) = tr_sig(t_mark(n),1/f);
end

end

function y = tr_sig(time, period)

while time>period
    time = time - period; 
end

y = interp1([0 period/2 period], [0 1 0], time);
end