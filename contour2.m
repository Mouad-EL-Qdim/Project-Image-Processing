function res= contour(im,valeur)
new1=im;
new2=im;
[l,c,d]=size(im);
if valeur == 0
bloc1=zeros(2,2);
bloc2=zeros(2,2);
[v,w]=size(bloc1);
filtre1=[0,1 ;-1,0 ];
filtre2=[1,0;0,-1 ];
else
[v,w]=size(bloc1);
bloc1=zeros(3,3);
bloc2=zeros(3,3);
filtre1=[1,valeur,1 ;0,0,0 ;-1,-valeur,-1 ];
filtre2=[-1,0,1 ;-valeur,0,valeur ;-1,0,1 ];
end
debut=2;

for k=1:d
for i=debut:l-debut+1
    for j=debut:c-debut+1
        if valeur == 0
        bloc1=im(i-1:i,j-1:j);
        bloc2=im(i-1:i,j-1:j);    
        else
        bloc1=im(i-debut+1:i+debut-1,j-debut+1:j+debut-1);
        bloc2=im(i-debut+1:i+debut-1,j-debut+1:j+debut-1);
        end
        bloc1 = double(bloc1);
        bloc2 = double(bloc2);
        new1(i,j,k)= sum(sum(filtre1.*bloc1));
        new2(i,j,k)= sum(sum(filtre2.*bloc2));
    end
end
end
res=add(new1,new2);
imshow(res);

end