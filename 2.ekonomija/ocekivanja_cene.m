%Marija Nedeljković 2020/0096
function dy = ocekivanja_cene(t,y,a,b,c,d,m,n)
dy = zeros(2,1);
dy(1) = y(2);
dy(2) = -(a+c)/n + ((b+d)/n)*y(1)-(m/n)*y(2);
end