function [A,b] = genSPDlinearsystem(N,cnd)

M = rand(N,N); 
[Q,~] = qr(M); 
lc = max(log10(cnd),0); %min condition number is 1 
L = 10.^linspace(0,-lc,N); L=L(:); 

A = Q*(repmat(L,1,N).*Q'); 

b=rand(N,1); 
b = b./norm(b); 
end

