%Marija Nedeljkoviæ 2020/0096
function koordinate = zero_finder(k,xmin,xmax)
    P = linspace(xmin,xmax,1000);  

    f = @(P) -P.^3 + P + k;

    znaci = sign(f(P));
    razlike = diff(znaci);
    zero_crossings = find(razlike);
    duzina = length(zero_crossings);
    koordinate = zeros(duzina,1);
    for i = 1:1:duzina
        koordinate(i) = xmin+zero_crossings(i)*(xmax-xmin)/1000;
    end
    
    plot(P,f(P))
    hold on
end