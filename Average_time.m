%Erroneous Home vector
%Normalisation and average
%path integration egocentric discrete. Calculation of average time.
x=0;
y=0;
r=0;
d=0;
d_real=0;
d_app=0;
w=0;
theta=0;
X=0;
Y=0;
var=0;
tot=0;
avg=0;
L=0.7;
eps=1;
pi = 3.14;
s=1;
V=0.4;
r(1,1)= 10;
for j=1:3
r(j,1)=10^j;
theta(j,1)=pi/4;
d_real(j,1)=pi/3;

%erroneous home vector, randomly distributed about the actual with variance V
d_app(j,1)=normrnd(d_real(j,1),V);
for k=1:20
i(j,k)=1;
while(r(j,i(j,k))>eps)
X(j,i(j,k))=r(j,i(j,k))*cos(abs(theta(j,i(j,k))));
Y(j,i(j,k))=r(j,i(j,k))*sin(abs(theta(j,i(j,k))));
var(j,i(j,k))=0.0005*r(j,i(j,k));
w(j,i(j,k))=(L*d_real(j,i(j,k))+ d_app(j,i(j,k)))/(L+1);
x(j,i(j,k)+1)=r(j,i(j,k))*cos(abs(d_real(j,i(j,k))-w(j,i(j,k))))-s;
y(j,i(j,k)+1)= r(j,i(j,k))*sin(abs(d_real(j,i(j,k))-w(j,i(j,k))));
r(j,i(j,k)+1)=sqrt((x(j,i(j,k)+1))^2+(y(j,i(j,k)+1))^2);
d_real(j,i(j,k)+1)=atan(y(j,i(j,k)+1)/x(j,i(j,k)+1));
d_app(j,i(j,k)+1)=normrnd(d_real(j,i(j,k)+1),V);
theta(j,i(j,k)+1)=theta(j,i(j,k))+d_real(j,i(j,k)+1)-d_real(j,i(j,k))+w(j,i(j,k));
if(theta(j,i(j,k)+1)>pi/2)
theta(j,i(j,k)+1)=theta(j,i(j,k)+1)-pi;
end
i(j,k)=i(j,k)+1;
end
end
for k=1:20
tot = tot + i(j,k);
end
avg(j)=tot/10;
end
for i=1:3
dist(i)=10^i;
end
plot(log10(dist),log10(avg),'o');