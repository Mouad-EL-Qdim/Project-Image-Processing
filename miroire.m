function res=miroire(im)

[l,c,d]=size(im);
mer = im;
for k=1:d
for i=1:l
    for j=1:c
    mer(i,j,k)= im(i,c-j+1,k);
    end
end
end
res = mer;

end