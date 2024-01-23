
function [lineCrossPoint_47]= num_crossing_points(img)

img = padarray(img,[5 5]);
n1=img;




   
n1 = bwmorph(n1,'skel',Inf);

n1 = bwmorph(n1,'spur',13);
%imshow(n1);

lineCrossPoint_47=sum(sum(n1(47,:)));

%disp('lineCrosspoint_47');
%disp(lineCrossPoint_47);


end