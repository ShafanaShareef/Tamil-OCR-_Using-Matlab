function [BF]=BasicFeatures(image)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img=image;

s = regionprops(img);
bb = vertcat(s(:).BoundingBox);
r1 = min(bb(:,2));
c1 = min(bb(:,1));
h = max(bb(:,2)+bb(:,4))-r1+1;
w = max(bb(:,1)+bb(:,3))-c1+1;
%rectangle('Position', [c1,r1,w,h],...
    %  'EdgeColor','r','LineWidth',1);
 aspect = h/w;
%fprintf('\nw = %d\th = %d\taspect ratio=%f',w,h,aspect);
eulerNumber = bweuler(img,8);


[numberOfvert,numberOfhori,numberOfleft_sland,numberOfright_sland]= LineCounts(img);

           
[numLoops,aspectRatioOFloops,densityOFloops]= num_circle(img);
[numObjects, numEdgePoints, numIntersectPoints]= end_intersect(img);
[lineCrossPoint_47]= num_crossing_points(img);


BF=cat(2,aspect,numberOfvert,numberOfhori,numberOfleft_sland,numberOfright_sland,...
    eulerNumber,numLoops,aspectRatioOFloops,densityOFloops,numObjects, numEdgePoints,...
    numIntersectPoints,lineCrossPoint_47);


end