function []= changeImageName(folder,commonFolderName,cClass,startIndexofImage)
clc;

close all;
cClass=cClass;
cd(folder)
available=false;
 somefolder ='./ReNamedImages_Test/';
file_l = dir(somefolder);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1: size(file_l,1)
if file_l(i).isdir ~= true
fname = file_l(i).name;
        temp = regexp (fname,'_','split');
        classtag = str2double(temp{1,2});
        
        
        temp = regexp (fname,'-','split');
        characterClass=str2double(temp{1,1});
        
        
        if(characterClass == cClass)
            if(classtag >= startIndexofImage)
            available = true;
             fn = sprintf('You Already have an image with this name  "%s-Image_%s"',num2str(cClass),num2str(startIndexofImage));
           warndlg(fn);
             
            break;
           
            end
           
        end
end
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(available==false)
    
cd(folder);

cd(commonFolderName);
somefolder=sprintf('./%s/',num2str(cClass));
%somefolder ='./1/';
file_l = dir(somefolder);
startIndexofImage=startIndexofImage;%// the first two in filelist are . and ..
for i=1: size(file_l,1)
if file_l(i).isdir ~= true
fname = file_l(i).name;    
disp(fname);
Img = imread([somefolder fname]);

           
 cd(folder)
 cd('./ReNamedImages_Test/')
 fn = sprintf('%s-Image_%s',num2str(cClass),num2str(startIndexofImage));
 imwrite(Img,fn,'bmp');
 startIndexofImage=startIndexofImage+1;
end
 cd(folder)
 cd(commonFolderName);
end
  cd(folder)

%characterReadInterfaceToTest(folder);
end