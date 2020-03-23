a1 = 0.09241;
a2 = 1.63060;
b0 = 0.70587;
b1 = 0.07190;
b2 = 1.41295;

a = [1 a1 a2];
b = [b0 b1 b2];
n = 1:30;
n0 = 6;
u = jum(n-n0);

signal = filter_func(b,a,u);
plot(n,signal);