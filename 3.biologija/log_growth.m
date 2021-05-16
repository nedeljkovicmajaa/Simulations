%Marija Nedeljković 2020/0096
function dy = log_growth(t,y,r,K)
dy = r*y*(1-(y/K));
end