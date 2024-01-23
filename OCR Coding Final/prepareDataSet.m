
function []=prepareDataSet(folder,commonFolderName)




for i=1:124
    
    %disp(imageFolderName);
    cd(folder);
    changeImageName(folder,commonFolderName,i,1)
    
end

end

%fn = sprintf('%s-Image_%s',num2str(cClass),num2str(startIndexofImage));