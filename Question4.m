% Mikhail Smirnov (ID:1249994) Assignment 3, Question 4, Math 330: Computational Analysis

PopulationTable = readtable('PredatorPreyData.xlsx'); % Imports data from the table
% Stores each of the columns of the table to get the times, Baboon
% Population and Cheetah Population
ttable = PopulationTable(:,1); % Time data
P_Btable = PopulationTable(:,2); % Baboon population data
P_Ctable = PopulationTable(:,3); % Cheetah population data

% Converts the data type "table" of the columns into arrays to be used more
% easily
t = table2array(ttable);
P_B = table2array(P_Btable);
P_C = table2array(P_Ctable);

m = 10;
N = length(t);


%----------------------------Data Plot------------------------------------
% This figure plots just the data extracted from the table (Populations of
% Baboons and Cheetahs over time
figure(5)
hold on
title('Population Over Time of Baboons and Cheetahs', 'Interpreter', 'LaTeX')
xlabel('Time','Interpreter', 'LaTex')
ylabel('Population','Interpreter', 'LaTex')
plot(t,P_B,'LineWidth', 2) % Baboon Population
plot(t,P_C) % Cheetah Population
legend('Baboon Population, $P_B$', 'Cheetah Population, $P_C$')
set(legend,'Interpreter','LaTeX')
hold off
%-------------------------------------------------------------------------


% Creates a matrix X where its columns are a combination of sines and 
% cosines in order to model the data.
X = Q4Matrix(t,m);

% Solves coefficient vector, alpha_b, for system X*alpha_b=P_B
alpha_b = X \ P_B;

% Solves coefficient vector, alpha_c, for system X*alpha_c=P_C
alpha_c = X \ P_C;


% --------------------------Sine/Cosine Modeling------------------------
% This figure plots the model created by the combination of sines and
% cosines for both the Cheetah and Baboon populations, and compares it to
% the actual population data from the table.
figure(6)
hold on
title('Approximation of Population Over Time of Baboons and Cheetahs', 'Interpreter', 'LaTeX')
xlabel('Time','Interpreter', 'LaTex')
ylabel('Population','Interpreter', 'LaTex')
plot(t,P_B, '-r') % Plotting Baboon population data
plot(t,X*alpha_b, '-k', 'LineWidth', 2) % Plotting Baboon population sine/cosine model
plot(t,P_C, '-b') % Plotting Cheetah population data
plot(t,X*alpha_c, '-g', 'LineWidth', 2) % Plotting Cheetah population sine/cosine model
legend('$P_B$', '$X \alpha_b$', '$P_C$', '$X \alpha_c$')
set(legend,'Interpreter','LaTeX')
axis([0 90 0 35])
hold off


% -----------------------Logarithmic Modeling -----------------------------
% Solves coefficient vector, alpha_b, for system X*beta_b=log(P_B)
beta_b = X \ log(P_B);

% Solves coefficient vector, alpha_c, for system X*beta_c=log(P_C)
beta_c = X \ log(P_C);

%This figure plots the logarithmic model taken from the combination of sines and
% cosines for both the Cheetah and Baboon populations, and compares it to
% the actual population data from the table.
figure(7)
hold on
title('Logarithmic Approximation of Population Over Time of Baboons and Cheetahs', 'Interpreter', 'LaTeX')
xlabel('Time','Interpreter', 'LaTex')
ylabel('Population','Interpreter', 'LaTex')
plot(t,log(P_B), '-r') % Baboon population data
plot(t,X*beta_b, '-k', 'LineWidth', 2) % Baboon population model
plot(t,log(P_C), '-b') % Cheetah population data
plot(t,X*beta_c, '-g', 'LineWidth', 2) % Cheetah population model
legend('$ln(P_B)$', '$ln(X \alpha_b)$', '$ln(P_C)$', '$ln(X \alpha_c)$')
set(legend,'Interpreter','LaTeX')
hold off


%---------------------------Exponential Modeling---------------------------
%This figure plots the exponential model taken from the combination of 
%sines and cosines for both the Cheetah and Baboon populations, and compares
%it to the actual population data from the table.
figure(8)
hold on
title('Exponential Approximation of Population Over Time of Baboons and Cheetahs', 'Interpreter', 'LaTeX')
xlabel('Time','Interpreter', 'LaTex')
ylabel('Population','Interpreter', 'LaTex')
plot(t,P_B, '-r') %Baboon population data
plot(t,exp(X*beta_b), '-k', 'LineWidth', 2) % Baboon population model
plot(t,P_C, '-b') % Cheetah population data
plot(t,exp(X*beta_c), '-g', 'LineWidth', 2) % Cheetah population model
legend('$P_B$', '$exp(X \alpha_b)$', '$P_C$', '$exp(X \alpha_c)$')
set(legend,'Interpreter','LaTeX')
hold off



