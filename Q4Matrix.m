% Mikhail Smirnov (ID:1249994) Assignment 3, Question 4, Math 330: Computational Analysis

function [X]=Q4Matrix(t,m)

% This function produces a matrix of size N x 2m+1
% where m is an integer, t is a vector of times, and N is the length of t

T = 14.357; % Period
N = length(t);
X = zeros(N,2*m+1); %Initializes matrix

% Every row will be from t=1:N
% Columns 2 up until 2m+1 will vary from k:1:m


% This loop creates a matrix of the first columns all being 1, and the
% following columns being cos((2*pi*k/T)*t) and sin((2*pi*k/T)*t) 
% respectively.
% The columns vary k from 1 to m every 2 columns and the rows vary the times
% based on vector, t.
for ti = 1:N
    for i = 1:(2*m+1)
        if i == 1
            X(ti,i) = 1; % Set first column to ones
        else % All other columns with cos and sin
            if mod(i,2) == 0 % Mod allows for even columns to be cos term
                k = i/2; % Allows k to be the same for every 2 columns   
                X(ti,i) = cos(((2*pi*k)/T)*t(ti));
            else % Allows for odd columns to be sin term
                k = (i-1)/2; % Allows k to be the same for both cosine and sine terms
                X(ti,i) = sin(((2*pi*k)/T)*t(ti)); 
            end
        end
    end
end
