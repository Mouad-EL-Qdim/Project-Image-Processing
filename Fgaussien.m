function res=Fgaussien(im,gama,valeur)

[l,c]=size(im);
new=im;

filtre=zeros(valeur,valeur);
debut=floor(valeur/2)+1;
x=debut-1;
for i=1:valeur
    for j=1:valeur  

        a=exp(-((i^2 + j^2)/(2*(gama^2)))); 
        b=double(1/(2*pi*(gama^2)));
        filtre(i,j)=a*b;
    end
end
som=sum(sum(filtre));
filtre = filtre./som;
for i=debut:l-x
    for j=debut:c-x
        bloc=im(i-x:i+x,j-x:j+x);
        bloc=double(bloc);
        new(i,j) = sum(sum(filtre.*bloc ));
    end
end
res=new;

 
end
