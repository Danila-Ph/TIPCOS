function y = delta(n)
%DELTA Generates a signal consisting of a single impulse

len = length(n);
y = zeros(1,len);
for ind = 1:len
    y(ind) = del(n(ind));
end

end

function y = del(n)
%DEL

if n == 0
    y = 1;
else
    y = 0;
end

end