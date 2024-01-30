function [z, k]=pagerank(q,alpha)
k=0;
n=length(q);
residual=1;
e=ones(n,1);
z=e/n;
while(residual>1e-4)
    k=k+1
    y=alpha*q*z;
    beta=1-norm(y,1);
    y=y+beta*e/n;
    residual=norm(y-z,1)
    z=y;
end