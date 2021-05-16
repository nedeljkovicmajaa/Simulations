%Marija Nededljkovic 2020/0096
clear all,
close all,
clc

v = 16.67;
x_ukupno = 5000;
t_ukupno = 180;
dx = 50;
dt = 0.1;

br_t = t_ukupno/dt;
br_x = x_ukupno/dx;

t = linspace(0,t_ukupno,br_t);
x = linspace(0,x_ukupno,br_x);

ro = zeros(br_x,br_t);

for i = 1:br_t
    ro(1,i) = 200;
end

for i = 2:1:br_x
    for j = 1:(br_t-1)
        ro(i,j+1) = ro(i,j)-v*dt/dx*(ro(i,j)-ro(i-1,j));
    end
end

figure(1);
mesh(t,x,ro);
xlabel('vreme');
ylabel('x osa');
title('ro(x,t)');
figure(2);
contourf(t,x,ro);
xlabel('vreme');
ylabel('x osa');
title('konturni grafik');


    
    
    
    
    
    