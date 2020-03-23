a1 = 0.09241;
a2 = 1.63060;
b0 = 0.70587;
b1 = 0.07190;
b2 = 1.41295;

a = [1 a1 a2];
b = [b0 b1 b2];

% syms z
% Az = 1+sum(a(2:length(a)).*z.^(-(1:(length(a)-1))));
% p = double(solve(Az,z));

% syms alf bet
% n = 0:1;
% imp_h = (alf.*(p(1).^n) + bet.*(p(2).^n)).*jum(n);
% [adds,axxx] = solve(imp_h,[alf,bet]);
% adds = double(adds);
% axxx = double(axxx);

p = roots(a);
n = -5:300;
dif_eq = filter_func(b,a,[1 zeros(1,length(n))]);
A = [p(1).^n(6) p(2).^n(6); p(1).^n(7) p(2).^n(7)];
B = [dif_eq(6); dif_eq(7)];
xx = A\B;

h = zeros(1,length(n));
h = (xx(1).*(p(1).^n) + xx(2).*(p(2).^n)).*jum(n);
h = real(h);
subplot(2,1,1);
plot(n,h)
subplot(2,1,2);
plot(n,filter(b,a,n))
figure;
plot(n,filter(b,a,n) - h);