function [y] = dif_equ(b,a,x)
%DIF_EQU difference equation

a = a./a(1);
b = b./a(1);

ai = 1:(length(a)-1);
bi = 0:(length(b)-1);

% h1 = sum(b.*(z.^(-ib)));
% h2 = 1.+sum(a.*z.^(-ia));

y = sum(b.*x(n-ib))

end

