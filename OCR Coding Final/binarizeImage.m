function [image_thresolded]=binarizeImage(Image)


gr=Image;

T = graythresh(gr);


if(T >= 0.45)
    newT = T;
else
   newT = 0.25;
end   


myimage = im2double(gr);
myimage=myimage(:,:,1);

%allocate space for thresolded image
image_thresolded=zeros(size(myimage));

%loop over all rows and columns
for ii=1:size(myimage,1)
    for jj=1:size(myimage,2)
        %get pixel value
        pixel=myimage(ii,jj);
        %check pixel value and assign new value
        
        if (newT >= pixel)
            new_pixel=1;
        else 
            new_pixel = 0;
            
        end
        %save new_Pixel value in thresolded image
        image_thresolded(ii,jj)=new_pixel;

    end
end

%return
end