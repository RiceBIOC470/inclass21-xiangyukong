%In class 21

% 1. Consider the system we discussed in class for a gene which is produced
% and degraded: dx/dt = k - d*x. Now consider that this gene turns on a
% second gene y, which also degrades so that its equation is 
% dy/dt = k2*x - d2*y. Choose some values for k,d,k2, and d2 and run a
% numerical simulation of this system for the case where both genes start
% out off ( x(0) = 0 and y(0) = 0). Plot the value of x and y in time and 
% explain your results. 

k = 2;
d = 1;
k2 = 10;
d2 = 16;
rhs_x = @(t,x) k - d*x;
rhs_y = @(t,x,y) k2*x - d2*y;
dt = 0.1;
interval = [0 10];
nstep = (interval(2)-interval(1))/dt;
solx(1) = 0;
soly(1) = 0;
for ii = 2:nstep;
    solx(ii) = solx(ii-1)+rhs_x(ii,solx(ii-1))*dt;
    soly(ii) = soly(ii-1)+rhs_y(ii,solx(ii),soly(ii-1))*dt;
end
tt = linspace(interval(1),interval(2),nstep);
plot(tt,solx,'r.');hold on;
plot(tt,soly,'g.')
%x is an activator of y.When x reach the concentration of k the degradation has the same rate as
%expression, thus the quantity of product is stablized; 1 x product can
%induce 10 molecules of y, yet y degrade very fast, regardless of its large
%production rate, the product remain low.

% 2. Consider the following model: 
% dx/dt = y
% dy/dt = (1-x^2)*y - x
% write code that simulates this system for several different starting
% values of x and y. Plot the results and comment on them. 

rhs_x_r = @(t,y) y;
rhs_y_r = @(t,x,y) (1-x^2)*y - x;
solx_r(1) = 0;
soly_r(1) = 3;
for ii = 2:nstep;
    solx_r(ii) = solx_r(ii-1)+rhs_x_r(ii,soly_r(ii-1))*dt;
    soly_r(ii) = soly_r(ii-1)+rhs_y_r(ii,solx_r(ii),soly_r(ii-1))*dt;
end
tt = linspace(interval(1),interval(2),nstep);
plot(tt,solx_r,'r.');hold on;
plot(tt,soly_r,'g.')
%y is an activator of x, and x is a very effective factor to degrade y,and
%when both factor appear below zero, the reaction should stop from there.