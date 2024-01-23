function [Img1]=skewDetectionCorrection(Img)
% this will call the some other sub functions of skew detection and correction 
%such as Find_Min_Arae2, Find_perimeter_points, Find_rec_area, Rotate_Perimeter_Points, Smearing_Func
%And call some other main functions to do the column seperation such as Row_RLSA_ forColumnSeperation2, 
%Column_RLSA_forColumnSeperation2.


Step = pi/180;
Theta = [];
Area = zeros(size(Theta));

        %if  Img(1,1) ~= 0
         %   Img = ~Img;
        %end

        

        Final_Img = zeros(size(Img));
        [n,m] = size(Img);
        Pivot(1)= (n+1)/2;
        Pivot(2)= (m+1)/2;
        PP = Find_perimeter_points(Img);
        [Corners Area_Org] = Find_rec_area(PP);
crop = Img(min(Corners{1}(:)):max(Corners{1}(:)),min(Corners{2}(:)):max(Corners{2} (:)));
%%figure,imshow(~crop)
PP{1}(:) = PP{1}(:)-Pivot(1);
PP{2}(:) = PP{2}(:)-Pivot(2);
Rotated_PP = Rotate_Perimeter_Points(PP,Step);
Rotated_PP{1}(:) = Rotated_PP{1}(:)+Pivot(1); 
Rotated_PP{2}(:) = Rotated_PP{2}(:)+Pivot(2);
[x Area_Up] = Find_rec_area(Rotated_PP); 
Rotated_PP = Rotate_Perimeter_Points(PP,-1*Step); 
Rotated_PP{1}(:) = Rotated_PP{1}(:)+Pivot(1);
Rotated_PP{2}(:) = Rotated_PP{2}(:)+Pivot(2); 
[x Area_Down] = Find_rec_area(Rotated_PP);

if Area_Up < Area_Org
    Turn_dir = 1;
else if Area_Down < Area_Org
        Turn_dir = -1;
else
Turn_dir = 0;
%cd('/Users/Shana/Desktop/OCR_Versions/Rotated_results/My_SkewFun')
%fn = sprintf('Original_Image_%s.png',num2str(i-2,'%02i'));
%imwrite(~Img,fn,'png');
end
end
        Rotation_Step = 4*pi/180;
        R = 0;
        tic
        if Turn_dir ~= 0
            Min_Area = Area_Org;
            R = R + Turn_dir*Rotation_Step;
            RPP = Rotate_Perimeter_Points(PP,R); 
            RPP{1}(:) = RPP{1}(:)+Pivot(1);
            RPP{2}(:) = RPP{2}(:)+Pivot(2);
            [Corners Area_maxr] = Find_rec_area(RPP); 
            while Min_Area > Area_maxr
                Min_Area = Area_maxr;
                R = R + Turn_dir*Rotation_Step;
                RPP = Rotate_Perimeter_Points(PP,R); 
                RPP{1}(:) = RPP{1}(:)+Pivot(1);
                RPP{2}(:) = RPP{2}(:)+Pivot(2);
                [Corners Area_maxr] = Find_rec_area(RPP);
            end

            if R*180/pi~=0
                R = R-Turn_dir*Rotation_Step;
            end
            Rotation_Step = Rotation_Step/2;
            while Rotation_Step >= (0.25*pi/180) && Turn_dir ~= 0
                [R,Min_Area,Rotation_Step] = Find_Min_Area2(R,Rotation_Step,PP, Min_Area,Pivot);
            end 
        end
        t = R*180/pi;
        Img1 = imrotate(Img,R*180/pi,'bilinear'); 
        PP = Find_perimeter_points(Img1);
        Flag = Smearing_Func(Img1,PP);
        if Flag == 0
            Img1 = imrotate(Img1,-1*Turn_dir*90,'bilinear'); %Img1
            t = -1*Turn_dir*90 + R*180/pi;
        end
  %%      toc
        % imshow(Img1)
    %segment(Img1);
   % hor_image = Row_RLSA_forColumnSeperation2(Img1);   
   % ver_image =Column_RLSA_forColumnSeperation2(Img1);
    
   
   
return    
  % Row_RLSA_forColumnSeperation2(Img1);
end

