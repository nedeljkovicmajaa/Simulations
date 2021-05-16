%Marija Nedeljković 2020/0096
function m = lv_model(t,y1,r_prey,r_predator,a,b)
m = zeros(2,1);
x = y1(1);
y = y1(2);
dx = r_prey*x - a*x*y;
dy = -r_predator*y + b*y*x;
m(1) = dx;
m(2) = dy;
end