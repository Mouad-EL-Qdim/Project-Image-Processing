function res=filtre_median(im , valeur)

[l,c]=size(im);
new=im ;
%valeur =9;
p=valeur*valeur;
v=zeros(l,p);
debut=floor(valeur/2)+1;
x=debut-1;
for i=debut:l-x
    for j=debut:c-x
        bloc = im(i-x:i+x,j-x:j+x);
        v=bloc(:);
        v=sort(v);
        new(i,j)=v(floor(p/2)+1);
    end
end
res = new;
%subplot(2,2,1);imshow(im);
%subplot(2,2,2);imshow(res);
%subplot(2,2,3);imshow(imn);
end        