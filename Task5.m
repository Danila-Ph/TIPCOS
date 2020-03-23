a1 = 0.09241;
a2 = 1.63060;
b0 = 0.70587;
b1 = 0.07190;
b2 = 1.41295;

a = [1 a1 a2];
b = [b0 b1 b2];
n = 1:5;
[x1,n1] = trapez_sig(18,520,n(1),n(length(n)));
[x2,n2] = trapez_sig(130,520,n(1),n(length(n)));

subplot(2,1,1);
signal1 = filter_func(b,a,x1);
plot(n1,signal1);

subplot(2,1,2);
signal2 = filter_func(b,a,x2);
plot(n2,signal2);