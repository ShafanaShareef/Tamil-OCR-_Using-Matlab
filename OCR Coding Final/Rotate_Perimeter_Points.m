function PP = Rotate_Perimeter_Points(Input_coordinates,theta) 
% This function rorates the Input_coordinates, theta degrees. % 
% Rotate input coordinates theta degree.
In = cell2mat(Input_coordinates);
m = [cos(theta) -sin(theta);sin(theta) cos(theta)]'; 
Rotated = In*m;
PP = mat2cell(Rotated,size(Rotated,1),[1 1]);
end