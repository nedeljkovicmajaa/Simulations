%Marija Nedeljkoviæ 2020/0096
function [res, vreme1] = maksimumi(resenje,vreme)
br = 0;
for i = 2:1:999
    a1 = resenje(i-1,1);
    a2 = resenje(i,1);
    a3 = resenje(i+1,1);
    if(a1<a2 & a2>a3)
        br=br+1;
    end 
end
res = zeros(br,1);
vreme1 = zeros(br,1);
k = 1;
for i = 2:1:999
    a1 = resenje(i-1,1);
    a2 = resenje(i,1);
    a3 = resenje(i+1,1);
    if(a1<a2 && a2>a3)
        res(k) = a2;
        vreme1(k) = vreme(i);
        k=k+1;
    end 
end
end