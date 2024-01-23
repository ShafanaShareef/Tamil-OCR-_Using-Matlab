function [FS1,FS2,FS3,FS4,FS5,FS6,FS7,FS8,FS9,FS10]= FeaturesSets(characterClass,DF,BF,snHOG,fHOG,soHOG,eHOG,TF)

       %     ExtractedFeatures={};
          %  Extracted=[];
%            Extracted=horzcat(FeatureArrayOFallDensity,BF);% ...
              %  numberOfleft_sland numberOfright_sland eulerNumber snHOG fHOG soHOG eHOG TF];

      %    ExtractedFeatures=cat(2,ExtractedFeatures,FeatureArrayOFallDensity);
       %   ExtractedFeatures=cat(2,ExtractedFeatures,aspect);
         % ,numberOfvert,numberOfhori,...
          %      numberOfleft_sland,numberOfright_sland,eulerNumber,snHOG,fHOG,soHOG,eHOG,TF);
          
          
          
          FS1=cat(2,characterClass,fHOG);
          FS2=cat(2,characterClass,fHOG,snHOG);
          FS3=cat(2,characterClass,fHOG,soHOG);
          FS4=cat(2,characterClass,fHOG,soHOG,DF);
          FS5=cat(2,characterClass,fHOG,eHOG);
          FS6=cat(2,characterClass,fHOG,TF);
          FS7=cat(2,characterClass,fHOG,BF);
          FS8=cat(2,characterClass,fHOG,snHOG,soHOG,eHOG);
          FS9=cat(2,characterClass,fHOG,snHOG,soHOG,eHOG,DF);
          FS10=cat(2,characterClass,fHOG,snHOG,soHOG,eHOG,DF,TF,BF);
          

end