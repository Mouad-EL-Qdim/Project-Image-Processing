function res=luminance(im ,valeur)

[l,c]=size(im);
lum = im;
mm=zeros(1,256-valeur);
for i=1:(256-valeur)
    mm(i)= valeur+i;
end
for i=1:l
    for j=1:c
      if im(i,j)<255-valeur
       lum(i,j)=mm(im(i,j)+1);
      end
    end
end
res = lum;

end