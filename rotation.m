function res= rotation(im,s)

if size(im,3)==3
    [l,c,d]=size(im);
    D=ceil(sqrt(l^2+c^2));
    rot=uint8(zeros(D,D,3));
for k=1:d
for i=1:D
    for j=1:D
    x= round((l/2) + (i-(D/2))*cos(s) - (j-(D/2))*sin(s));
    y= round((c/2) + (j-(D/2))*cos(s) + (i-(D/2))*sin(s));
     if ( x>0 && x<=l && y>0  && y<=c )
               rot(i,j,k) = im(x,y,k);
     else
               rot(i,j,k)=0;
     end
    end
end
end
else
   [l,c]=size(im);
    D=ceil(sqrt(l^2+c^2));
    rot=uint8(zeros(D,D)); 
 for i=1:D
    for j=1:D
    x= round((l/2) + (i-(D/2))*cos(s) - (j-(D/2))*sin(s));
    y= round((c/2) + (j-(D/2))*cos(s) + (i-(D/2))*sin(s));
     if ( x>0 && x<=l && y>0  && y<=c )
               rot(i,j) = im(x,y);
     else
               rot(i,j)=0;
     end
    end
end   
end
res=rot;

end