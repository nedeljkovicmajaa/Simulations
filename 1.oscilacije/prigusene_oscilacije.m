%Marija Nedeljković 2020/0096
function dy = prigusene_oscilacije(t,y,omega,alpha)
dy = zeros(2,1);
dy(1) = y(2);
dy(2) = -(omega^2)*y(1) - 2*alpha*y(2);
end