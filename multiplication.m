function res=multiplication(im,ratio)

[l,c]=size(im);
mult=im;

for i=1:l
    for j=1:c
    mult(i,j)=min(im(i,j)*ratio,255);
    end
end

res = mult;

end