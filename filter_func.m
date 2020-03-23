function [y] = filter_func(b,a,x)
%FILTER_FUNC returns a filtered signal

a1 = a(1);
a = a./a1;
b = b./a1;

y = zeros(1,length(x));

for n = 1:length(x)
    sum_a = 0;
    sum_b = 0;
    
    for i = 1:length(b)
        if (n-i+1)>= 1
            sum_b = sum_b + b(i)* x(n-i+1);
        end
    end
    
    for i = 2:length(a)
        if (n-i+1)>= 1
            sum_a = sum_a + a(i)* y(n-i+1);
        end
    end
    
    y(n) = sum_b - sum_a;
end

end

