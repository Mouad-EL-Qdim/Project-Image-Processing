function res= histogramme(img)

if size(img,3)==3
img=rgb2gray(img);
end
histo = zeros(1,256);
[l,c]=size(img);
for i=1:l
    for j=1:c
        
        if (img(i,j)-floor(img(i,j)))>0.5
            h= ceil(img(i,j));
        elseif (img(i,j)-floor(img(i,j)))<0.5
            h= floor(img(i,j));
        end
        histo(h+1)= histo(h+1)+1;
    end
end

res = histo;

end