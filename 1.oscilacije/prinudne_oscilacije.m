%Marija Nedeljković 2020/0096
function dy = prinudne_oscilacije(t,y,omega,alpha,m,amplituda_sile, omega_sila)
amplituda = (amplituda_sile/m)/(sqrt((omega^2 - omega_sila^2)^2 +(2*alpha*omega_sila)^2))

dy = zeros(2,1);
dy(1) = y(2);
dy(2) = -(omega^2)*y(1) - 2*alpha*y(2);
end