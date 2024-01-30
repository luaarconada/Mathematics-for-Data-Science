%Exercise 3.10 

clc
clear all
format short g
a=[9 1; 1 2] %matrix
[v,lambda]=eig(a) %"exact" eigenvalues and eigenvectors
x=[1,1]' %initial vector
%x=v(:,1) % initial vector along the second eigenvector
X=[v(:,2) x]; %first iteration
mu=x'*a*x; %Rayleigh quotient
Mu=[mu]; %first iteration

%first iteration
Table=[mu norm(x+v(:,2))/1 abs(mu-lambda(2,2))/abs(lambda(2,2)) ...
    lambda(1,1)/lambda(2,2) (lambda(1,1)/lambda(2,2))^2];

error_mu=[abs(mu-lambda(2,2)) 1];% error in the evalue
error_v=[norm(x+v(:,2)) 1]; % error in the evector
eprev=1; %error in previous step
emuprev=1; %error in previous step
i=0;
while eprev>1e-7 %tolerance
    clc
    i=i+1;
    x=a*x %power method
    x=x/norm(x); %normalization
    
    X=[X, x]; %Store x
       
    mu=x'*a*x;
    Mu=[Mu; mu] %store Rayleigh quotient

    %store data
    Table=[Table; mu norm(x+v(:,2))/eprev abs(mu-lambda(2,2))/emuprev ...
        lambda(1,1)/lambda(2,2) (lambda(1,1)/lambda(2,2))^2]


    eprev=norm(x+v(:,2));
    emuprev=abs(mu-lambda(2,2));

    %store errors
    error_v=[error_v; norm(x+v(:,2)) (lambda(1,1)/lambda(2,2))^i ]
    error_mu=[error_mu; abs(mu-lambda(2,2)) (lambda(1,1)/lambda(2,2))^(2*i)]
        
end
X
v
lambda

figure(1)
semilogy(1:i+1,error_v(:,1),'b-',1:i+1,error_v(:,2),'r-')
legend('error v', 'predicted error')
grid on

figure(2)
semilogy(1:i+1,error_mu(:,1),'b-',1:i+1,error_mu(:,2),'r-')
legend('error lambda', 'predicted error')
grid on    

    
    
