function [density]=densityFeatures(zone)

[rows columns]=size(zone);
numberOfBlackPixels=sum(sum(zone==0));
numberOfWhitePixels=sum(sum(zone));
totalNumberOfPixels=rows *columns;

density = (numberOfWhitePixels/totalNumberOfPixels);

%message = sprintf('\nDone!\nTotal number of pixels = %d\nWhite pixels = %d\Density = %.1f%%', ...
      %  totalNumberOfPixels,numberOfWhitePixels,density); 
% message = sprintf('Done!\nDensity is = %d', density);      
%msgbox(message);


end