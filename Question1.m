% Mikhail Smirnov (ID:1249994) Assignment 3, Question 1

% Solving for x in the system of equations Ax=B using A\b

% The equations are 
% 2*x_1 + 3*x_2 -x_3 = 5
% 4*x_1 + 4*x_2 -3*x_3 = 3
% -2*x_1 + 3*x_2 -7*x_3 = 1 

A = [2 3 -1;4 4 -3;-2 3 -7]; % Coefficient matrix
b = [5 3 1]'; % b vector

% Solves system of equations using Gaussian Elimination
x = A\b

% Computes absolute residual ||Ax-b||
res = norm(A*x-b)
% The residual is the error that Matlab makes from solving the system
% of equations numerically. Ideally, the residual should be as close to 0 
% as possible, since theoretically A*x-b should equal 0.

% Computes relative residual by diving the absolute residual by the norm of
% b. This produces a residual that tells us the error when compared to b.
normb=norm(b);
relres=res/normb

% Computes condition number of the matrix A.
% The condition number simply put, tells you how well-behaved a matrix is
% and how many digits of the input you can trust versus the output.
condOfA = cond(A) 

