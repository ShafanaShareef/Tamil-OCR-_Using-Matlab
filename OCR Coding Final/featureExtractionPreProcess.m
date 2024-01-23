function [image]= featureExtractionPreProcess(n1)
img=n1;
image=medfilt2(img, [2 2]);
%image = bwmorph(image,'remove');
image = bwmorph(image,'diag',Inf);
%image = bwmorph(image,'fill',Inf);
%image = bwmorph(image,'skel',Inf);

%image = imfill(image,'holes');
%image = bwmorph(image,'skel',Inf);
%image=smooth(image,5);



%image = bwperim(image,8);
%image = imdilate(image, strel('disk',1));

%image = bwmorph(image,'dilate',Inf);
image=imresize(image,[64 64]);

imshow(image);

end