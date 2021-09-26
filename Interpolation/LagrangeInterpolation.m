function y_t = LagrangeInterpolation(x,f_x,x_t)
%% Lagrange interpolation method
if nargin<3
    x = [0.4;0.5;0.6;0.7];
    if nargin<2
        f_x = @(x)0.5*x^3 + 0.6*x^2 + 0.6*x + 0.7;
        if nargin<1
            x_t = 0.55;
        end
    end
end
n = length(x)-1;
y = zeros(n+1,1);
% Evaluate the values at interpolation points
for i=0:n
   y(i+1) = f_x(x(i+1));
end

% For given xt, % Using Eqn.(4) to calculate the product
y_t = 0;
for k= 0:n
    temp = 1;
    for i = 0:n
        if i~= k
            temp = temp * (x_t-x(i+1))/(x(k+1)-x(i+1));% Please pay attention to the order between k and i
        end
    end
    y_t = y_t + y(k+1)*temp;
end

%% Disp the residual
residual = y_t-f_x(x_t);
disp("The residual is:");
disp(residual);

end