a1 = 0.09241;
a2 = 1.63060;
b0 = 0.70587;
b1 = 0.07190;
b2 = 1.41295;

a = [a1 a2];
b = [b0 b1 b2];

ia = 1:length(a);
ib = 0:(length(b)-1);

% H[z] = ((sum(b.*z^(-ib)))/(1+sum(a.*z^(-ia))))

syms z
h1 = sum(b.*(z.^(-ib)));
h2 = 1+sum(a.*z.^(-ia));
nul = double(solve(h1,z));
pol = double(solve(h2,z));

% simplify(pol);
re = abs(real(pol));
im = abs(imag(pol));
stab = (sum(re >= 1) + sum(im >= 1)) > 0 % returns 1 if the function is unstable

H=simplify(h1/h2)
nul
pol