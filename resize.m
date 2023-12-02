function res=resize(im,echelle)

[l,c,d]=size(im);
cc =round( echelle*c) ;
ll = round (echelle*l) ;
mer = uint8(zeros(ll,cc,d));
for k=1:d
for i=1:ll
    for j=1:cc
    mer(i,j,k)= im(round(i/echelle),round(j/echelle),k);
    end
end
end
res = mer;

end