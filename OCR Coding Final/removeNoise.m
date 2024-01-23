function [kaverage2]=removeNoise(img1)
%This will remove the noise using wiener filter
%and call the method  skewDetectionCorrection to deskew  the image


img=img1;
%kmedian=medfilt2(img, [3 3]);
%kaverage=wiener2(kmedian,[5 5]);
kaverage2=wiener2(img,[5 5]);

%figure
%imshow(kaverage2);
%title(filename);
%giveProjectedImage(kaverage2);

%skewDetectionCorrection(kaverage2);

%projectionFeatures( kaverage2, filename );
return

end