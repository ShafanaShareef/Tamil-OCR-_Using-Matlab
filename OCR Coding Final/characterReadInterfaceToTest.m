function []= characterReadInterfaceToTest(folder)
clc;
%clear all;
close all;


cd(folder);
somefolder ='./TrainTemp/';
filelist = dir(somefolder);
FV_T = cell(1,2);
imcell = cell(1,((numel(filelist)-2))); 
counter = 0;
 characterClass='X';
for i=1:size(filelist,1)
   %// filelist is not a folder
    if filelist(i).isdir ~= true
    fname = filelist(i).name;
    temp = regexp (fname,'_','split');
    classtag = str2double(temp{1,2});
    
    temp = regexp (fname,'-','split');
    characterClass=str2double(temp{1,1});
    
    Img = imread([somefolder fname]);
        %// convert it to grayscale image if tmp is a color
        %// image/picture
        if size(Img,3) == 3
        Img = rgb2gray(Img);
        end
        
       
         counter = counter + 1;
      if counter < 2
          imcell{classtag} = Img;
         
        
      elseif counter == 4
           counter = 0;
      end
      
      
    %%%level = graythresh(Img); % find the threshold based on otsu's method
     BinaryImg1 = binarizeImage(Img); %%% im2bw(Img,level); % convert intensity image to binary
    
     
     BinaryImg1skewd = skewDetectionCorrection(BinaryImg1);
     
     if BinaryImg1skewd(1,1) == 1
    BinaryImg1 = ~BinaryImg1skewd;
     end
    
     
     BinaryImg1=~BinaryImg1;
     
    BinaryImg1 = padarray(BinaryImg1,[5 5]);
    
    [r c] = find(BinaryImg1 == 1);
 
    Img_b = bound2im([r c]);
 
    FV_T{1} = cat(1,FV_T{1},invmoments(Img_b)); 
    FV_T{2} = cat(1,FV_T{2},classtag);
classtag = [];
end 
end
Y = cell(1,2);

B = FV_T(:,2);

[Y{2},ix] = sort(B{1});



Y{1} = FV_T{1}(ix,:);



FV_T = Y;



clear Y;
cd(folder)
file_l = dir(somefolder);
FV_S = [];
class = [];
%// the first two in filelist are . and ..
for i=1: size(file_l,1)
if file_l(i).isdir ~= true
fname = file_l(i).name;


disp(fname);
Img = imread([somefolder fname]);
%// convert it to grayscale image if tmp is a color
%// image/picture
if size(Img,3) == 3
Img = rgb2gray(Img);
end


 BinaryImg = binarizeImage(Img); %%% im2bw(Img,level); % convert intensity image to binary
           BinaryImg = skewDetectionCorrection(BinaryImg);

if BinaryImg(1,1) == 1
    BinaryImg = ~BinaryImg;
end
imagen=BinaryImg;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Label connected components
%[La Ne]=bwlabel(imagen);


CC=bwconncomp(imagen,8);
%L=bwlabel(CC);

L = labelmatrix(CC);


[Regions,R_order] = sort_labels(imagen,L,CC.NumObjects);

[Match_matrix,Nmobj] = labeling_dist(Regions,CC.NumObjects,R_order); 

[changed_labled_image,N_obj] = change_label(Regions,Match_matrix,Nmobj,CC.NumObjects);


%% Measure properties of image regions
%propied=regionprops(changed_labled_image,'BoundingBox');
%hold on
%% Plot Bounding Box
%for n=1:size(propied,1)
 %rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
%end
%hold off
 
%figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            
            
for k = 1:N_obj
    
                cd(folder)
                [r,c] = find(changed_labled_image == k);
                q = bound2im([r,c]);
                FV_S = cat(1,FV_S,invmoments(q));
            
                %figure    
           
%% Objects extraction



        n1=changed_labled_image(min(r):max(r),min(c):max(c));
        
        n1=featureExtractionPreProcess(n1);
  
      
      [FeatureArrayOFallDensity]=DensityFeatureZones(n1);
 
    
      [BF]=BasicFeatures(n1);
    %  disp('BF');
    %  disp(BF);
      n1=imresize(n1,[64 64]);
      snHOG = snhogcalculator(n1);
      fHOG=hogcalculator(n1);
          
      n1=imresize(n1,[64 64]);
      soHOG = hogcalculator(n1,8,8,2,2,9,0.5,'localinterpolate','unsigned','l2hys');
      eHOG=ehogcalculator(n1);
    
            count=1;

            TF=transitionFeatures(n1);
            
 [FS1,FS2,FS3,FS4,FS5,FS6,FS7,FS8,FS9,FS10]= FeaturesSets(characterClass,FeatureArrayOFallDensity,BF,snHOG,fHOG,soHOG,eHOG,TF);
       
 cd(folder)
 cd('./Results/Hu/')
 fn = sprintf('Image_%s_%s.bmp',num2str(i-2,'%04i'),num2str(k,'%04i'));
 imwrite(n1,fn,'png');
 
            
            cd(folder)
            cd('./FS1/')
            newImageName  = sprintf('%s','.txt');
            dlmwrite('features_FS1.txt',FS1,'-append','newline','pc')
            
            cd(folder)
            cd('./FS2/')
            newImageName  = sprintf('%s','.txt');
            dlmwrite('features_FS2.txt',FS2,'-append','newline','pc')
            
            cd(folder)
            cd('./FS3/')
            newImageName  = sprintf('%s','.txt');
            dlmwrite('features_FS3.txt',FS3,'-append','newline','pc')
            
            cd(folder)
            cd('./FS4/')
            newImageName  = sprintf('%s','.txt');
            dlmwrite('features_FS4.txt',FS4,'-append','newline','pc')
            
            cd(folder)
            cd('./FS5/')
            newImageName  = sprintf('%s','.txt');
            dlmwrite('features_FS5.txt',FS5,'-append','newline','pc')
            
            cd(folder)
            cd('./FS6/')
            newImageName  = sprintf('%s','.txt');
            dlmwrite('features_FS6.txt',FS6,'-append','newline','pc')
            
            cd(folder)
            cd('./FS7/')
            newImageName  = sprintf('%s','.txt');
            dlmwrite('features_FS7.txt',FS7,'-append','newline','pc')
            
            cd(folder)
            cd('./FS8/')
            newImageName  = sprintf('%s','.txt');
            dlmwrite('features_FS8.txt',FS8,'-append','newline','pc')
            
            cd(folder)
            cd('./FS9/')
            newImageName  = sprintf('%s','.txt');
            dlmwrite('features_FS9.txt',FS9,'-append','newline','pc')
            
            cd(folder)
            cd('./FS10/')
            newImageName  = sprintf('%s','.txt');
            dlmwrite('features_FS10.txt',FS10,'-append','newline','pc')
          

          
       
 
          
           
           
           
    pause(0.5)
                
 end
%fclose(fileID);


class = knnclassify(FV_S,FV_T{1},FV_T{2},1); 
for j = 1:numel(class)
TestImg = imcell{class(j)};
           
%{
            cd(folder)
            cd('./Results/Hu/')
            fn = sprintf('Image_%s_%s.png',num2str(i-2,'%04i'),num2str(j,'%04i'));
            imwrite(TestImg,fn,'png');
            
            cd(folder)
            cd('./FS1/')
            newImageName  = sprintf('%s_%s%s',num2str(i-2,'%04i'),num2str(j,'%04i'),'.txt');
            %fullFileName = fullfile(folderName, newFileName);
            fileID = fopen([fname,newImageName],'w');
            fprintf(fileID,'%f ',FS1);
            fclose(fileID); 
            %}
            

end
           
            %%%figure
            %%%imshow(TestImg);


            cd(folder) 
            
class = [];
clear TestImg;
           % end

end
FV_S = [];
end
            cd(folder)  
clear imcell;
            close all
            
                %clear all;

end    
