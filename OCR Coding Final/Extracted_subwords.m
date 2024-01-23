function [changed_labled_image,N_obj] = Extracted_subwords(BinaryImg)
CC = bwconncomp(BinaryImg,8);
L = labelmatrix(CC);
[Regions,R_order] = sort_labels(BinaryImg,L,CC.NumObjects); 
[Match_matrix,Nmobj] = labeling_dist(Regions,CC.NumObjects,R_order); 
[changed_labled_image,N_obj] = change_label(Regions,Match_matrix,Nmobj,CC.NumObjects);

%%%%%%%%%%%%%%%%%%%%%%
%[L Ne]=bwlabel(imagen);
%% Measure properties of image regions
propied=regionprops(changed_labled_image,'BoundingBox');
hold on
%% Plot Bounding Box
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off
pause (1)
%% Objects extraction
figure
for n=1:Ne
    [r,c] = find(L==n);
    n1=imagen(min(r):max(r),min(c):max(c));
    imshow(~n1);
    pause(0.5)
end
end