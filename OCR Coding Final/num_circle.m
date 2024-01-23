function [numLoops,aspectRatioOFloops,densityOFloops]= num_circle(img)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% counting number of loops%%%%%
img = padarray(img,[15 15]);
n1=img;
n1 = bwmorph(n1,'diag',Inf);
%n1= bwmorph(n1,'remove');       
n1 = bwmorph(n1,'skel',Inf);
n1 = bwmorph(n1,'spur',Inf);
img1 = imfill(n1, 'holes');
interval2=[0 1 1
           0 1 1
           0 1 1];

bw3 = bwhitmiss(img1,interval2);
% draw binary image
%figure
%imshow(bw3);
    %image(bw3,'CDataMapping','scaled');
CC=bwconncomp(bw3,8);
L = labelmatrix(CC);
numLoops=CC.NumObjects;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculate aspect ratio of loops %
s = regionprops(bw3);

if ~isempty(s)
    bb = vertcat(s(:).BoundingBox);
    r1 = min(bb(:,2));
    c1 = min(bb(:,1));
    h = max(bb(:,2)+bb(:,4))-r1+1;
    w = max(bb(:,1)+bb(:,3))-c1+1;
    %rectangle('Position', [c1,r1,w,h],...
        %  'EdgeColor','r','LineWidth',1);
     aspectRatioOFloops = h/w;
else  
    aspectRatioOFloops = 0;
    
end
   % disp('aspectRatioOFloops');
   % disp(aspectRatioOFloops);  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculate the density of loops %
    densityOFloops=densityFeatures(bw3);
   % disp('densityOFloops');
   % disp(densityOFloops);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure
%imshow(img1);
end