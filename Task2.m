a1 = 0.09241;
a2 = 1.63060;
b0 = 0.70587;
b1 = 0.07190;
b2 = 1.41295;

a = [1 a1 a2];
b = [b0 b1 b2];

n = 1:20;
x = [1 zeros(1,length(n)-1)];

y1 = filter(b,a,x);
y2 = filter_func(b,a,x);

subplot(3,1,1);
plot(n,y1,n,y2);
subplot(3,1,2);
plot(n,y1);
subplot(3,1,3);
plot(n,y2);