a1 = 0.09241;
a2 = 1.63060;
b0 = 0.70587;
b1 = 0.07190;
b2 = 1.41295;

a = [1 a1 a2];
b = [b0 b1 b2];

ia = 1:length(a);
ib = 0:(length(b)-1);
w = 0:0.0062:pi;
H = zeros(1,length(w));

% for i = 1:length(w)
%     h1 = sum(b.*(exp(1i.*w(i).*ib)));
%     h2 = 1+sum(a.*(exp(1i.*w(i).*ia)));
%     H(i) = h1/h2;
% end

% syms z
% H = ((sum(b.*z.^(ib)))/(1+sum(a.*z.^(ia))));
% z = exp(1i.*w);
% H1=eval(H);

for i = 1:length(w)
    sum_b = 0;
    sum_a = 0;
   for k = 0:(length(b)-1)
       sum_b = sum_b + b(k+1)*exp(1i*w(i)*(-k));
   end
   
   for k = 1:(length(a)-1)
       sum_a = sum_a + a(k+1)*exp(1i*w(i)*(-k));
   end
   H(i) = sum_b/(sum_a + 1);
end

subplot(2,1,1);
plot(w,abs(H));

subplot(2,1,2);
plot(w,angle(H));