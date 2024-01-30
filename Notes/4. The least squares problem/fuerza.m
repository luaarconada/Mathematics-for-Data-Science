clear all
C=ones(2,10);
C(2,:)=1/2*[19 17 15 13 11 9 7 5 3 1];
d=[0 1]';
[Q,R]=qr(C')
R0=R(1:2,1:2)

y=(R0)'\d

Q1=Q(:,1:2)
Q2=Q(:,3:end)

z=-Q2\(Q1*y) %A=Id, b=0 por tanto A2z-(b-A1y) es Q2z+Q1y

F=Q*[y;z]

norm(F)

xx = 0:.01:10-0.01;
yy=[];
for i=0:length(xx)-1
    yy(i+1)=F(floor(i/100)+1);
end
plot(yy)
grid on