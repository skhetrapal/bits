%Model with constant variance
%path integration egocentric discrete
x=0;
y=0;
r=0;
d=0;
w=0;
theta=0;
X=0;
Y=0;
var=0;
eps=0.01;
pi = 3.14;
s=0.01;
for j=1:10
i(j)=1;
r(j,1)=1*j/2;
theta(j,1)=pi/4;
d(j,1)=pi/3;
while(r(j,i(j))>eps)
X(j,i(j))=r(j,i(j))*cos(theta(j,i(j)));
Y(j,i(j))=r(j,i(j))*sin(theta(j,i(j)));
var(j,i(j))=0.5*r(j,i(j));
w(j,i(j))=normrnd(d(j,i(j)),var(j,i(j)));
x(j,i(j)+1)=r(j,i(j))*cos(d(j,i(j))-w(j,i(j)))-s;
y(j,i(j)+1)= r(j,i(j))*sin(d(j,i(j))-w(j,i(j)));
r(j,i(j)+1)=sqrt((x(j,i(j)+1))^2+(y(j,i(j)+1))^2);
d(j,i(j)+1)=atan(y(j,i(j)+1)/x(j,i(j)+1));
theta(j,i(j)+1)=theta(j,i(j))+d(j,i(j)+1)-d(j,i(j))+w(j,i(j));
i(j)=i(j)+1;
end
end
plot(i,'o');