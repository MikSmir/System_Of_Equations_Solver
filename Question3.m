%Mikhail Smirnov (ID:1249994) Assignment 3, Question 3

% Load the file first using a command in the script

load LS_data2.mat

x = linspace(0,2*pi,100); % Evenly spaces points between 0 and 2*pi
% X=[1 sin(xi) cos(xi) sin(2xi) cos(2xi) sin(3xi) cos(3xi) sin(xi)^2 cos(xi)^2]

% Plots columns of X with respect to points 0 to 2*pi
figure(3)
xlabel('$x_i$','Interpreter', 'LaTex')
ylabel('$X$','Interpreter','LaTex')
axis([0 2*pi -1 1])
hold on
%For every column of X, plot it with respect to points 0 to 2*pi
for i = 1:9
    plot(x(:),X(:,i)) % Plotting each column of X with respect to the given points, x.
end
legend('$1$','$sin(x_i)$','$cos(x_i)$','$sin(2x_i)$','$cos(2x_i)$', '$sin(3x_i)$','$cos(3x_i)$','$sin(x_i)^2$','$cos(x_i)^2$')
set(legend,'Interpreter','LaTeX')
hold off


% Since Y is a true linear combination of the columns of X,
% we want to solve for the vector of coefficients for a
% system where we have X*alpha=Y, where alpha is vector of coefficients

% The respective alphas were calculated as the coefficients, as well as
% their residuals using least squares.
alpha1 = X\Y
res1 = norm(Y - X*alpha1)^2

alpha2 = X\Y2
res2 = norm(Y - X*alpha2)^2

alpha3 = X\Y3
res3 = norm(Y - X*alpha3)^2


% Plots the noisy versions of Y (Y1 & Y2) and their solved coefficients
% from the linear combinations of X, (X*alpha2 & X*alpha3)
figure(4)
title('Comparing Between $Y_i$ and $X \alpha_i$', 'Interpreter', 'LaTeX')
hold on
% Plotting Y2 and X*alpha2 
plot(x(:), X*alpha2, '-r')
plot(x(:), Y2(:,1), 'ro')
% Plotting Y3 and X*alpha3
plot(x(:), X*alpha3, '-b')
plot(x(:), Y3(:,1), 'bo')
legend('$Y_2$','$X \alpha_2$' , '$Y_3$', '$X \alpha_3$')
set(legend,'Interpreter','LaTeX')
axis([0 2*pi -5 35])
hold off