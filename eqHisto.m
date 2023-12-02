function res= eqHisto(img,cu)

[l,c]=size(img);
eq=img;
for i=1:l
    for j=1:c
        h=img(i,j);
        eq(i,j)= (cu(h+1)*255)/(l*c);
    end
end
res = eq;
end