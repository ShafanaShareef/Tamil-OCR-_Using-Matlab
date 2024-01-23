function [MinT,Area,RS] = Find_Min_Area2(MinT,RS,Points,Area,P)
% Rotates inputed points in +RS and -RS degree and calculates the area of
% the minimum rectangle surrounding the points and returns the theta value
% that gives the minimum area between two opposite rotations.
% figure,imshow(Img)
PP1 = Rotate_Perimeter_Points(Points,MinT + RS); 
PP1{1}(:) = PP1{1}(:)+P(1);
PP1{2}(:) = PP1{2}(:)+P(2);
[CP1 Area_Up] = Find_rec_area(PP1);
PP2 = Rotate_Perimeter_Points(Points,MinT - RS); 
PP2{1}(:) = PP2{1}(:)+P(1);
PP2{2}(:) = PP2{2}(:)+P(2);
[CP2 Area_Down] = Find_rec_area(PP2);
if Area > Area_Up
     MinT = MinT + RS;
     Area = Area_Up;
 else if Area > Area_Down
         MinT = MinT - RS;
         Area = Area_Down;
end 
end
RS = RS/2;
end