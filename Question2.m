% Mikhail Smirnov (ID:1249994) Assignment 3, Question 2 (Parts a, b, c)

% This script solves multiple systems of equations with varying
% matrix sizes, N, and varying condition numbers, cnd.
% It then compares the time taken to solve the systems of equations, T,
% with the matrix sizes, N and the condition number, cnd.

N = [250 500 1000 2000 4000]; % Sizes of matrix
cnd = [10 100 1000 10000]; % Condition numbers

% Initializes the definite size of the Time and residual matrices with
% values of 1.
% If I was to not do this, and define them in the loop, their sizes would
% change every iteration, slowing down the code significantly.
res = ones(5,4);
T = ones(5,4); 
% The rows of these variables represent N (matrix sizes) and the columns
% represent cnd (condition numbers).

tic % Starts timer

%Loops through each element of the cnd array for each iteration of looping
% through the N array, varying both condition numbers and matrix sizes.
for i = 1:length(N)
    for j = 1:length(cnd)
    [A,b]=genSPDlinearsystem(N(i),cnd(j)); % Calls the genSPDlinearsystem function to create random SPD matrix A and vector b with given size (N) and condition number.
    x=A\b; % Solves for x using Gaussian Elimination
    res(i,j) = norm(A*x-b); %Computes residual for each varying value of N and cnd and stores it in the res matrix.
    T(i,j) = toc; % Stops the timer and stores it in matrix T for every respective N and cnd value.
    end
end
res %As you go through the columns the residuals increase, meaning that varying condition number leads to less precision.


%The better condition number is, the faster conjugate gradient is. The worse condition number is, the slower conjugate gradient is.
%The amount of time it takes is a function of the size of the matrix.


figure(1)
hold on
xlabel('$log10(N)$','Interpreter', 'LaTex')
title('$log10(T)$  using Gaussian Elimination','Interpreter','LaTex')
disp('Equations of linear fits are')
% This for loop plots each of the 4 curves representing different condition
% numbers (10, 100, 1000, 10000)
% The function is approximated linearly using polyfit and
% the resulting coefficients are used in polyval, and the fit is later
% plotted as f1.
% Each of the fits to all 4 curves are also printed out in disp.
for j=1:length(cnd)
    plot(log10(N),log10(T(:,j)),'-o', 'LineWidth', 2)
    c = polyfit(log10(N'),log10(T(:,j)),1);
    f1 = polyval(c,log10(N));
    % Displays evaluated fits (y = m*x + b) 
    disp(['y = ' num2str(c(1)) '*x + ' num2str(c(2))])
    plot(log10(N),f1)
    % Pauses for each curve and fit plotted
    pause(1);
end
legend('cnd=10','Linear fit for cnd=10', 'cnd=100','Linear fit for cnd=100','cnd=1000','Linear fit for cnd=1000','cnd=10000','Linear fit for cnd=10000')
set(legend,'Location','northwest')
set(legend,'Interpreter','LaTeX')
hold off
