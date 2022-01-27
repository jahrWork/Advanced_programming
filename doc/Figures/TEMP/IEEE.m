clear all
clc
close all

N = 100000;

a = 0.5;
b = 2;

z = zeros(N+1,1);
g = zeros(N+1,1);
IE = [0.5, 0.625, 0.75, 0.875, 1., 1.25, 1.5, 1.75, 2.];
IE2 = [0.5625, 0.6875, 0.8125, 0.9375, 1.125, 1.375, 1.625, 1.875, 2.];

for i = 1:N+1
    z(i) = (b-a)/N*(i-1) + a;
end

%Error absoluto
for i = 1:N+1
    if z(i) <= IE2(1)
        g(i) = abs(z(i) - IE(1));
    elseif z(i) > IE2(1) && z(i) <= IE2(2)
        g(i) = abs(z(i) - IE(2));
    elseif z(i) > IE2(2) && z(i) <= IE2(3)
        g(i) = abs(z(i) - IE(3));
    elseif z(i) > IE2(3) && z(i) <= IE2(4)
        g(i) = abs(z(i) - IE(4));
    elseif z(i) > IE2(4) && z(i) <= IE2(5)
        g(i) = abs(z(i) - IE(5));
    elseif z(i) > IE2(5) && z(i) <= IE2(6)
        g(i) = abs(z(i) - IE(6));
    elseif z(i) > IE2(6) && z(i) <= IE2(7)
        g(i) = abs(z(i) - IE(7));
    elseif z(i) > IE2(7) && z(i) <= IE2(8)
        g(i) = abs(z(i) - IE(8));
    elseif z(i) > IE2(8) && z(i) <= IE2(9)
        g(i) = abs(z(i) - IE(9));
    end
end

figure(1)
plot(z, g)


%Error relativo
for i= 1:N+1
    r(i) = g(i)/z(i);
end

figure(2)
plot(z, r)








