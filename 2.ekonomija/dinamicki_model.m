%Marija Nedeljković 2020/0096
function dy = dinamicki_model(t,y,a,b,c,d,gama)
dy = gama*(a+c)-gama*(b+d)*y;
end