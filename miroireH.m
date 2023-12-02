function res=miroireH(im)

[l,c,d]=size(im);
mer = im;
for k=1:d
for i=1:l
    for j=1:c
    mer(i,j,k)= im(l-i+1,j,k);
    end
end
end
res = mer;

end