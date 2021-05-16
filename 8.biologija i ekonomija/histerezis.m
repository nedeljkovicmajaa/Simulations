%Marija Nedeljkoviæ 2020/0096
function dy = histerezis(t,y,k)
dy = zeros(1,1);
dy(1) = -y*y*y+y+k;
end