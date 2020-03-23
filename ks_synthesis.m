function y = ks_synthesis(x,alpha,P)
%KS_SYNTHESIS

M = length(x);
y = zeros(M*P,1);
k = 0;
for n = 1:length(y)
    k = k + 1;
    if k > M
       k = k - M; 
    end
    if (n - M) > 0
        y(n) = alpha*y(n - M) + x(k);
    end
end
end

