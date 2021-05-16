%Marija Nedeljkovic 2020/0096

function [max,t] = maksimumi(vreme,niz)
    br=0;
    for i = 1:1:(length(niz)-2)
        a1 = niz(i);
        a2 = niz(i+1);
        a3 = niz(i+2);
        if(a1<a2 && a3<a2)
            br=br+1;
        end
    end
    lokalni_max = zeros(br,1);
    lokalni_tren = zeros(br,1);
    k=1;
    for i = 1:1:(length(niz)-2)
        a1 = niz(i);
        a2 = niz(i+1);
        a3 = niz(i+2);
        if(a1<a2 && a3<a2)
            lokalni_max(k) = a2;
            lokalni_tren(k) = vreme(i+1);
            k=k+1;
        end
    end
    max = lokalni_max(1);
    t = lokalni_tren(1);
    for i = 1:1:length(lokalni_max)
        if(lokalni_max(i)>max)
           max = lokalni_max(i);
           t = lokalni_tren(i);
        end
    end
end