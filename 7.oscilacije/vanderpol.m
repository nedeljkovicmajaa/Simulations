%Marija Nedeljkoviæ 2020/0096
function dy = vanderpol(t,y,mi)
dy = zeros(2,1);
dy(1) = y(2);
dy(2) = -y(1) - mi*(y(1)*y(1)-1)*y(2);
end