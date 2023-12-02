function res=add(im,img)

[l,c,d]=size(im);
[ll,cc,d]=size(img);
Max = max(l,ll);
Min = max(c,cc);
i1= uint8(zeros(Max,Min,d));
i1(1:l,1:c,:)=im;
i2= uint8(zeros(Max,Min,d));
i2(1:ll,1:cc,:)=img;
mer= uint8(zeros(Max,Min));
for k=1:d
for i=1:Max
    for j=1:Min
        
    h= i1(i,j,k)+i2(i,j,k);
      
    if h > 255
        mer(i,j,k)=255;
    else
        mer(i,j,k)=h;
    end
    end
end
end
res = mer;

end