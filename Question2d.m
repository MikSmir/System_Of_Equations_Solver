% Mikhail Smirnov (ID:1249994) Assignment 3, Question 2 (Part d)

N = [250 500 1000 2000 4000]; %Sizes of matrix
cnd = [10 100 1000 10000]; % Condition numbers

resCG = ones(5,4);
iterCG = ones(5,4);
% The res and T variables were initialized with a size because if they were defined in the loop, their size would change every iteration.
T = ones(5,4); % The T matrix actually had lower values after this was implemented.
tic % Starts timer
for i=1:length(N)
    for j=1:length(cnd)
    [A,b]=genSPDlinearsystem(N(i),cnd(j));
    [x,fl,resCG(i,j),iterCG(i,j)]=pcg(A,b,1e-6,10000); % Solves for x using Conjugate Gradient method
    T(i,j)=toc; %Stores the time taken in T
    end
end

resCG
% As you go through the columns the residuals increase, meaning that varying condition # leaves to less precision.
% The better condition number is, the faster conjugate gradient is. The worse condition number is, the slower conjugate gradient is.
% The amount of time it takes is a function of the size of the matrix.


figure(2)
hold on
xlabel('$log10(N)$','Interpreter', 'LaTex')
title('$log10(T)$  using Conjugate Gradient','Interpreter','LaTex')
disp('Equations of linear fits are')    
% This for loop plots each of the 4 curves representing different condition
% numbers (10, 100, 1000, 10000)
for j = 1:length(cnd)
    plot(log10(N),log10(T(:,j)),'-o', 'LineWidth', 2)
    c = polyfit(log10(N'),log10(T(:,j)),1);
    f1=polyval(c,log10(N));
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
