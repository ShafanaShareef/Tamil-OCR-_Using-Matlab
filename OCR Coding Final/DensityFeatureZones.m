
function [ FeatureArrayOFallDensity]=DensityFeatureZones(image)
grayImage = image; % Read in image.
% Figure out where to divide it.
[rows, columns] = size(grayImage);
r3 = int32(rows/3);
c3 = int32(columns/3);
% Extract the 9 images.
zone11 = grayImage(1:r3, 1:c3);
densityZone11=densityFeatures(zone11);
zone12 = grayImage(1:r3, c3+1:2*c3);
densityZone12=densityFeatures(zone12);
zone13 = grayImage(1:r3, 2*c3+1:end);
densityZone13=densityFeatures(zone13);
zone21 = grayImage(r3+1:2*r3, 1:c3);
densityZone21=densityFeatures(zone21);
zone22 = grayImage(r3+1:2*r3, c3+1:2*c3);
densityZone22=densityFeatures(zone22);
zone23 = grayImage(r3+1:2*r3, 2*c3+1:end);
densityZone23=densityFeatures(zone23);
zone31 = grayImage(2*r3+1:end, 1:c3);
densityZone31=densityFeatures(zone31);
zone32 = grayImage(2*r3+1:end, c3+1:2*c3);
densityZone32=densityFeatures(zone32);
zone33 = grayImage(2*r3+1:end, 2*c3+1:end);
densityZone33=densityFeatures(zone33);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%Creating an array of density of nine zones.
Zk=cell(1,9);
Zk={zone11;zone12;zone13;zone21;zone22;zone23;zone31;zone32;zone33};
densityArrayOfNineZones=cell(1,9);
densityArrayOfNineZones={densityZone11;densityZone12;densityZone13;...
                         densityZone21;densityZone22;densityZone23;...
                         densityZone31;densityZone32;densityZone33};



% Display the 9 images.
%{
figure
subplot(3,3,1);
imshow(zone11);
subplot(3,3,2);
imshow(zone12);
subplot(3,3,3);
imshow(zone13);
subplot(3,3,4);
imshow(zone21);
subplot(3,3,5);
imshow(zone22);
subplot(3,3,6);
imshow(zone23);
subplot(3,3,7);
imshow(zone31);
subplot(3,3,8);
imshow(zone32);
subplot(3,3,9);
imshow(zone33);

%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%Divide into Two Zones as LZ, RZ
r2 = rows;
c2 = int32(columns/2);


LZ = grayImage(:, 1 : c2);
RZ = grayImage(:, c2+1 : columns);
HZk=cell(1,2);
HZk={LZ;RZ};
%Creating an array of density of 2(Left and right) zones.
densityZoneLZ=densityFeatures(LZ);
densityZoneRZ=densityFeatures(RZ);

densityArrayOfLZ_RZ_Zones=cell(1,2);
densityArrayOfLZ_RZ_Zones={densityZoneLZ;densityZoneRZ};


%{
figure
subplot(1,2,1);
imshow(LZ);
subplot(1,2,2);
imshow(RZ);

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%Divide into Two Zones as TZ, BZ
rT2 = int32(rows/2);
cT2 = columns;
TZ = grayImage(1 : rT2, : );
BZ = grayImage( rT2+1 : rows,:);
VZk=cell(1,2);
VZk={TZ;BZ};

%Creating an array of density of 2(top , bottom) zones.
densityZoneTZ=densityFeatures(TZ);
densityZoneBZ=densityFeatures(BZ);

densityArrayOfTZ_BZ_Zones=cell(1,2);
densityArrayOfTZ_BZ_Zones={densityZoneTZ;densityZoneBZ};


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%Divide into 15 Zones diagonaly from bottom
rD15 = int32((rows-4)/15);
cD15 =int32((columns-4)/15);



    diagonalZoneFromBottomLeft4x4= grayImage(rD15*15:rows,1:cD15);
    diagonalZoneFromBottomLeft8x8= grayImage(rD15*14:rows,1:cD15*2);
    diagonalZoneFromBottomLeft12x12= grayImage(rD15*13:rows,1:cD15*3);
    diagonalZoneFromBottomLeft16x16= grayImage(rD15*12:rows,1:cD15*4);
    diagonalZoneFromBottomLeft20x20= grayImage(rD15*11:rows,1:cD15*5);
    diagonalZoneFromBottomLeft24x24= grayImage(rD15*10:rows,1:cD15*6);
    diagonalZoneFromBottomLeft28x28= grayImage(rD15*9:rows,1:cD15*7);
    diagonalZoneFromBottomLeft32x32= grayImage(rD15*8:rows,1:cD15*8);
    diagonalZoneFromBottomLeft36x36= grayImage(rD15*7:rows,1:cD15*9);
    diagonalZoneFromBottomLeft40x40= grayImage(rD15*6:rows,1:cD15*10);
    diagonalZoneFromBottomLeft44x44= grayImage(rD15*5:rows,1:cD15*11);
    diagonalZoneFromBottomLeft48x48= grayImage(rD15*4:rows,1:cD15*12);
    diagonalZoneFromBottomLeft52x52= grayImage(rD15*3:rows,1:cD15*13);
    diagonalZoneFromBottomLeft56x56= grayImage(rD15*2:rows,1:cD15*14);
    diagonalZoneFromBottomLeft60x60= grayImage(rD15:rows,1:cD15*15);
    
 %{  
 figure
subplot(5,3,1);
imshow(diagonalZoneFromBottom4x4);
subplot(5,3,2);
imshow(diagonalZoneFromBottom8x8);
subplot(5,3,3);
imshow(diagonalZoneFromBottom12x12);
subplot(5,3,4);
imshow(diagonalZoneFromBottom16x16);
subplot(5,3,5);
imshow(diagonalZoneFromBottom20x20);
subplot(5,3,6);
imshow(diagonalZoneFromBottom24x24);
subplot(5,3,7);
imshow(diagonalZoneFromBottom28x28);
subplot(5,3,8);
imshow(diagonalZoneFromBottom32x32);
subplot(5,3,9);
imshow(diagonalZoneFromBottom36x36);
subplot(5,3,10);
imshow(diagonalZoneFromBottom40x40);
subplot(5,3,11);
imshow(diagonalZoneFromBottom44x44);
subplot(5,3,12);
imshow(diagonalZoneFromBottom48x48);
subplot(5,3,13);
imshow(diagonalZoneFromBottom52x52);
subplot(5,3,14);
imshow(diagonalZoneFromBottom56x56);
subplot(5,3,15);
imshow(diagonalZoneFromBottom60x60);

%}
    densityZoneOFdiagonalZoneFromBottomLeft4x4=densityFeatures(diagonalZoneFromBottomLeft4x4);
    densityZoneOFdiagonalZoneFromBottomLeft8x8=densityFeatures(diagonalZoneFromBottomLeft8x8);
    densityZoneOFdiagonalZoneFromBottomLeft12x12=densityFeatures(diagonalZoneFromBottomLeft12x12);
    densityZoneOFdiagonalZoneFromBottomLeft16x16=densityFeatures(diagonalZoneFromBottomLeft16x16);
    densityZoneOFdiagonalZoneFromBottomLeft20x20=densityFeatures(diagonalZoneFromBottomLeft20x20);
    densityZoneOFdiagonalZoneFromBottomLeft24x24=densityFeatures(diagonalZoneFromBottomLeft24x24);
    densityZoneOFdiagonalZoneFromBottomLeft28x28=densityFeatures(diagonalZoneFromBottomLeft28x28);
    densityZoneOFdiagonalZoneFromBottomLeft32x32=densityFeatures(diagonalZoneFromBottomLeft32x32);
    
    densityZoneOFdiagonalZoneFromBottomLeft36x36=densityFeatures(diagonalZoneFromBottomLeft36x36);
    densityZoneOFdiagonalZoneFromBottomLeft40x40=densityFeatures(diagonalZoneFromBottomLeft40x40);
    densityZoneOFdiagonalZoneFromBottomLeft44x44=densityFeatures(diagonalZoneFromBottomLeft44x44);
    densityZoneOFdiagonalZoneFromBottomLeft48x48=densityFeatures(diagonalZoneFromBottomLeft48x48);
    densityZoneOFdiagonalZoneFromBottomLeft52x52=densityFeatures(diagonalZoneFromBottomLeft52x52);
    densityZoneOFdiagonalZoneFromBottomLeft56x56=densityFeatures(diagonalZoneFromBottomLeft56x56);
    densityZoneOFdiagonalZoneFromBottomLeft60x60=densityFeatures(diagonalZoneFromBottomLeft60x60);


    densityArrayOfdiagonalZonesFromBottomLeft=cell(1,15);
    densityArrayOfdiagonalZonesFromBottomLeft={densityZoneOFdiagonalZoneFromBottomLeft4x4;densityZoneOFdiagonalZoneFromBottomLeft8x8;...
                                        densityZoneOFdiagonalZoneFromBottomLeft12x12;densityZoneOFdiagonalZoneFromBottomLeft16x16;...
                                        densityZoneOFdiagonalZoneFromBottomLeft20x20;densityZoneOFdiagonalZoneFromBottomLeft24x24;...
                                        densityZoneOFdiagonalZoneFromBottomLeft28x28;densityZoneOFdiagonalZoneFromBottomLeft32x32;...
                                        densityZoneOFdiagonalZoneFromBottomLeft36x36;densityZoneOFdiagonalZoneFromBottomLeft40x40;...
                                        densityZoneOFdiagonalZoneFromBottomLeft44x44;densityZoneOFdiagonalZoneFromBottomLeft48x48;...
                                        densityZoneOFdiagonalZoneFromBottomLeft52x52;densityZoneOFdiagonalZoneFromBottomLeft56x56;...
                                        densityZoneOFdiagonalZoneFromBottomLeft60x60}; 
                           
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    %%Divide into 15 Zones diagonaly from top right
  
    
    diagonalZoneFromTopRight4x4= grayImage(1:rD15,cD15*14:cD15*15);
    diagonalZoneFromTopRight8x8= grayImage(1:rD15*2,cD15*14:cD15*15);
    diagonalZoneFromTopRight12x12= grayImage(1:rD15*3,cD15*13:cD15*15);
    diagonalZoneFromTopRight16x16= grayImage(1:rD15*4,cD15*12:cD15*15);
    diagonalZoneFromTopRight20x20= grayImage(1:rD15*5,cD15*11:cD15*15);
    diagonalZoneFromTopRight24x24= grayImage(1:rD15*6,cD15*10:cD15*15);
    diagonalZoneFromTopRight28x28= grayImage(1:rD15*7,cD15*9:cD15*15);
    diagonalZoneFromTopRight32x32= grayImage(1:rD15*8,cD15*8:cD15*15);
    diagonalZoneFromTopRight36x36= grayImage(1:rD15*9,cD15*7:cD15*15);
    diagonalZoneFromTopRight40x40= grayImage(1:rD15*10,cD15*6:cD15*15);
    diagonalZoneFromTopRight44x44= grayImage(1:rD15*11,cD15*5:cD15*15);
    diagonalZoneFromTopRight48x48= grayImage(1:rD15*12,cD15*4:cD15*15);
    diagonalZoneFromTopRight52x52= grayImage(1:rD15*13,cD15*3:cD15*15);
    diagonalZoneFromTopRight56x56= grayImage(1:rD15*14,cD15*2:cD15*15);
    diagonalZoneFromTopRight60x60= grayImage(1:rD15*15,cD15*1:cD15*15);
      
    
             %%dispaly 15 Zones diagonaly from top right  
 %{ 
 figure
subplot(5,3,1);
imshow(diagonalZoneFromTopRight4x4);
subplot(5,3,2);
imshow(diagonalZoneFromTopRight8x8);
subplot(5,3,3);
imshow(diagonalZoneFromTopRight12x12);
subplot(5,3,4);
imshow(diagonalZoneFromTopRight16x16);
subplot(5,3,5);
imshow(diagonalZoneFromTopRight20x20);
subplot(5,3,6);
imshow(diagonalZoneFromTopRight24x24);
subplot(5,3,7);
imshow(diagonalZoneFromTopRight28x28);
subplot(5,3,8);
imshow(diagonalZoneFromTopRight32x32);
subplot(5,3,9);
imshow(diagonalZoneFromTopRight36x36);
subplot(5,3,10);
imshow(diagonalZoneFromTopRight40x40);
subplot(5,3,11);
imshow(diagonalZoneFromTopRight44x44);
subplot(5,3,12);
imshow(diagonalZoneFromTopRight48x48);
subplot(5,3,13);
imshow(diagonalZoneFromTopRight52x52);
subplot(5,3,14);
imshow(diagonalZoneFromTopRight56x56);
subplot(5,3,15);
imshow(diagonalZoneFromTopRight60x60);
   %} 
   

densityZoneOFdiagonalZoneFromTopRight4x4=densityFeatures(diagonalZoneFromTopRight4x4);
    densityZoneOFdiagonalZoneFromTopRight8x8=densityFeatures(diagonalZoneFromTopRight8x8);
    densityZoneOFdiagonalZoneFromTopRight12x12=densityFeatures(diagonalZoneFromTopRight12x12);
    densityZoneOFdiagonalZoneFromTopRight16x16=densityFeatures(diagonalZoneFromTopRight16x16);
    densityZoneOFdiagonalZoneFromTopRight20x20=densityFeatures(diagonalZoneFromTopRight20x20);
    densityZoneOFdiagonalZoneFromTopRight24x24=densityFeatures(diagonalZoneFromTopRight24x24);
    densityZoneOFdiagonalZoneFromTopRight28x28=densityFeatures(diagonalZoneFromTopRight28x28);
    densityZoneOFdiagonalZoneFromTopRight32x32=densityFeatures(diagonalZoneFromTopRight32x32);
    
    densityZoneOFdiagonalZoneFromTopRight36x36=densityFeatures(diagonalZoneFromTopRight36x36);
    densityZoneOFdiagonalZoneFromTopRight40x40=densityFeatures(diagonalZoneFromTopRight40x40);
    densityZoneOFdiagonalZoneFromTopRight44x44=densityFeatures(diagonalZoneFromTopRight44x44);
    densityZoneOFdiagonalZoneFromTopRight48x48=densityFeatures(diagonalZoneFromTopRight48x48);
    densityZoneOFdiagonalZoneFromTopRight52x52=densityFeatures(diagonalZoneFromTopRight52x52);
    densityZoneOFdiagonalZoneFromTopRight56x56=densityFeatures(diagonalZoneFromTopRight56x56);
    densityZoneOFdiagonalZoneFromTopRight60x60=densityFeatures(diagonalZoneFromTopRight60x60);


    densityArrayOfdiagonalZonesFromTopRight=cell(1,15);
    densityArrayOfdiagonalZonesFromTopRight={densityZoneOFdiagonalZoneFromTopRight4x4;densityZoneOFdiagonalZoneFromTopRight8x8;...
                                        densityZoneOFdiagonalZoneFromTopRight12x12;densityZoneOFdiagonalZoneFromTopRight16x16;...
                                        densityZoneOFdiagonalZoneFromTopRight20x20;densityZoneOFdiagonalZoneFromTopRight24x24;...
                                        densityZoneOFdiagonalZoneFromTopRight28x28;densityZoneOFdiagonalZoneFromTopRight32x32;...
                                        densityZoneOFdiagonalZoneFromTopRight36x36;densityZoneOFdiagonalZoneFromTopRight40x40;...
                                        densityZoneOFdiagonalZoneFromTopRight44x44;densityZoneOFdiagonalZoneFromTopRight48x48;...
                                        densityZoneOFdiagonalZoneFromTopRight52x52;densityZoneOFdiagonalZoneFromTopRight56x56;...
                                        densityZoneOFdiagonalZoneFromTopRight60x60}; 
                           

                                    
                                    
                                    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%%Divide into 15 Zones diagonaly from top left
    diagonalZoneFromTopLeft4x4= grayImage(1:rD15,1:cD15*1);
    diagonalZoneFromTopLeft8x8= grayImage(1:rD15*2,1:cD15*2);
    diagonalZoneFromTopLeft12x12= grayImage(1:rD15*3,1:cD15*3);
    diagonalZoneFromTopLeft16x16= grayImage(1:rD15*4,1:cD15*4);
    diagonalZoneFromTopLeft20x20= grayImage(1:rD15*5,1:cD15*5);
    diagonalZoneFromTopLeft24x24= grayImage(1:rD15*6,1:cD15*6);
    diagonalZoneFromTopLeft28x28= grayImage(1:rD15*7,1:cD15*7);
    diagonalZoneFromTopLeft32x32= grayImage(1:rD15*8,1:cD15*8);
    diagonalZoneFromTopLeft36x36= grayImage(1:rD15*9,1:cD15*9);
    diagonalZoneFromTopLeft40x40= grayImage(1:rD15*10,1:cD15*10);
    diagonalZoneFromTopLeft44x44= grayImage(1:rD15*11,1:cD15*11);
    diagonalZoneFromTopLeft48x48= grayImage(1:rD15*12,1:cD15*12);
    diagonalZoneFromTopLeft52x52= grayImage(1:rD15*13,1:cD15*13);
    diagonalZoneFromTopLeft56x56= grayImage(1:rD15*14,1:cD15*14);
    diagonalZoneFromTopLeft60x60= grayImage(1:rD15*15,1:cD15*15);       
    
    
 %{   
   figure
 subplot(5,3,1);
 imshow(diagonalZoneFromTopLeft4x4);
 subplot(5,3,2);
imshow(diagonalZoneFromTopLeft8x8);
subplot(5,3,3);
imshow(diagonalZoneFromTopLeft12x12);
subplot(5,3,4);
imshow(diagonalZoneFromTopLeft16x16);
subplot(5,3,5);
imshow(diagonalZoneFromTopLeft20x20);
subplot(5,3,6);
imshow(diagonalZoneFromTopLeft24x24);
subplot(5,3,7);
imshow(diagonalZoneFromTopLeft28x28);
subplot(5,3,8);
imshow(diagonalZoneFromTopLeft32x32);
subplot(5,3,9);
imshow(diagonalZoneFromTopLeft36x36);
subplot(5,3,10);
imshow(diagonalZoneFromTopLeft40x40);
subplot(5,3,11);
imshow(diagonalZoneFromTopLeft44x44);
subplot(5,3,12);
imshow(diagonalZoneFromTopLeft48x48);
subplot(5,3,13);
imshow(diagonalZoneFromTopLeft52x52);
subplot(5,3,14);
imshow(diagonalZoneFromTopLeft56x56);
subplot(5,3,15);
imshow(diagonalZoneFromTopLeft60x60);  

%}


densityZoneOFdiagonalZoneFromTopLeft4x4=densityFeatures(diagonalZoneFromTopLeft4x4);
    densityZoneOFdiagonalZoneFromTopLeft8x8=densityFeatures(diagonalZoneFromTopLeft8x8);
    densityZoneOFdiagonalZoneFromTopLeft12x12=densityFeatures(diagonalZoneFromTopLeft12x12);
    densityZoneOFdiagonalZoneFromTopLeft16x16=densityFeatures(diagonalZoneFromTopLeft16x16);
    densityZoneOFdiagonalZoneFromTopLeft20x20=densityFeatures(diagonalZoneFromTopLeft20x20);
    densityZoneOFdiagonalZoneFromTopLeft24x24=densityFeatures(diagonalZoneFromTopLeft24x24);
    densityZoneOFdiagonalZoneFromTopLeft28x28=densityFeatures(diagonalZoneFromTopLeft28x28);
    densityZoneOFdiagonalZoneFromTopLeft32x32=densityFeatures(diagonalZoneFromTopLeft32x32);
    
    densityZoneOFdiagonalZoneFromTopLeft36x36=densityFeatures(diagonalZoneFromTopLeft36x36);
    densityZoneOFdiagonalZoneFromTopLeft40x40=densityFeatures(diagonalZoneFromTopLeft40x40);
    densityZoneOFdiagonalZoneFromTopLeft44x44=densityFeatures(diagonalZoneFromTopLeft44x44);
    densityZoneOFdiagonalZoneFromTopLeft48x48=densityFeatures(diagonalZoneFromTopLeft48x48);
    densityZoneOFdiagonalZoneFromTopLeft52x52=densityFeatures(diagonalZoneFromTopLeft52x52);
    densityZoneOFdiagonalZoneFromTopLeft56x56=densityFeatures(diagonalZoneFromTopLeft56x56);
    densityZoneOFdiagonalZoneFromTopLeft60x60=densityFeatures(diagonalZoneFromTopLeft60x60);
    
    
    
    
    densityArrayOfdiagonalZonesFromTopLeft=cell(1,15);
    densityArrayOfdiagonalZonesFromTopLeft={densityZoneOFdiagonalZoneFromTopLeft4x4;densityZoneOFdiagonalZoneFromTopLeft8x8;...
                                        densityZoneOFdiagonalZoneFromTopLeft12x12;densityZoneOFdiagonalZoneFromTopLeft16x16;...
                                        densityZoneOFdiagonalZoneFromTopLeft20x20;densityZoneOFdiagonalZoneFromTopLeft24x24;...
                                        densityZoneOFdiagonalZoneFromTopLeft28x28;densityZoneOFdiagonalZoneFromTopLeft32x32;...
                                        densityZoneOFdiagonalZoneFromTopLeft36x36;densityZoneOFdiagonalZoneFromTopLeft40x40;...
                                        densityZoneOFdiagonalZoneFromTopLeft44x44;densityZoneOFdiagonalZoneFromTopLeft48x48;...
                                        densityZoneOFdiagonalZoneFromTopLeft52x52;densityZoneOFdiagonalZoneFromTopLeft56x56;...
                                        densityZoneOFdiagonalZoneFromTopLeft60x60}; 
                                    
                                    
                                    
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
   
   %%Divide into 15 Zones diagonaly from Bottom Right
    diagonalZoneFromBottomRight4x4= grayImage(rD15*15:rows,cD15*15:columns);
    diagonalZoneFromBottomRight8x8= grayImage(rD15*14:rows,cD15*14:columns);
    diagonalZoneFromBottomRight12x12= grayImage(rD15*13:rows,cD15*13:columns);
    diagonalZoneFromBottomRight16x16= grayImage(rD15*12:rows,cD15*12:columns);
    diagonalZoneFromBottomRight20x20= grayImage(rD15*11:rows,cD15*11:columns);
    diagonalZoneFromBottomRight24x24= grayImage(rD15*10:rows,cD15*10:columns);
    diagonalZoneFromBottomRight28x28= grayImage(rD15*9:rows,cD15*9:columns);
    diagonalZoneFromBottomRight32x32= grayImage(rD15*8:rows,cD15*8:columns);
    diagonalZoneFromBottomRight36x36= grayImage(rD15*7:rows,cD15*7:columns);
    diagonalZoneFromBottomRight40x40= grayImage(rD15*6:rows,cD15*6:columns);
    diagonalZoneFromBottomRight44x44= grayImage(rD15*5:rows,cD15*5:columns);
    diagonalZoneFromBottomRight48x48= grayImage(rD15*4:rows,cD15*4:columns);
    diagonalZoneFromBottomRight52x52= grayImage(rD15*3:rows,cD15*3:columns);
    diagonalZoneFromBottomRight56x56= grayImage(rD15*2:rows,cD15*2:columns);
    diagonalZoneFromBottomRight60x60= grayImage(rD15*1:rows,cD15*1:columns);   
    
    
 %{   
    figure
  subplot(5,3,1);
  imshow(diagonalZoneFromBottomRight4x4);
  subplot(5,3,2);
  imshow(diagonalZoneFromBottomRight8x8);
  subplot(5,3,3);
  imshow(diagonalZoneFromBottomRight12x12);
  subplot(5,3,4);
  imshow(diagonalZoneFromBottomRight16x16);
  subplot(5,3,5);
  imshow(diagonalZoneFromBottomRight20x20);
  subplot(5,3,6);
  imshow(diagonalZoneFromBottomRight24x24);
  subplot(5,3,7);
  imshow(diagonalZoneFromBottomRight28x28);
  subplot(5,3,8);
  imshow(diagonalZoneFromBottomRight32x32);
  subplot(5,3,9);
  imshow(diagonalZoneFromBottomRight36x36);
  subplot(5,3,10);
 imshow(diagonalZoneFromBottomRight40x40);
  subplot(5,3,11);
  imshow(diagonalZoneFromBottomRight44x44);
  subplot(5,3,12);
  imshow(diagonalZoneFromBottomRight48x48);
  subplot(5,3,13);
  imshow(diagonalZoneFromBottomRight52x52);
  subplot(5,3,14);
  imshow(diagonalZoneFromBottomRight56x56);
  subplot(5,3,15);
  imshow(diagonalZoneFromBottomRight60x60);
 
 %}
 
 
    densityZoneOFdiagonalZoneFromBottomRight4x4=densityFeatures(diagonalZoneFromBottomRight4x4);
    densityZoneOFdiagonalZoneFromBottomRight8x8=densityFeatures(diagonalZoneFromBottomRight8x8);
    densityZoneOFdiagonalZoneFromBottomRight12x12=densityFeatures(diagonalZoneFromBottomRight12x12);
    densityZoneOFdiagonalZoneFromBottomRight16x16=densityFeatures(diagonalZoneFromBottomRight16x16);
    densityZoneOFdiagonalZoneFromBottomRight20x20=densityFeatures(diagonalZoneFromBottomRight20x20);
    densityZoneOFdiagonalZoneFromBottomRight24x24=densityFeatures(diagonalZoneFromBottomRight24x24);
    densityZoneOFdiagonalZoneFromBottomRight28x28=densityFeatures(diagonalZoneFromBottomRight28x28);
    densityZoneOFdiagonalZoneFromBottomRight32x32=densityFeatures(diagonalZoneFromBottomRight32x32);
    
    densityZoneOFdiagonalZoneFromBottomRight36x36=densityFeatures(diagonalZoneFromBottomRight36x36);
    densityZoneOFdiagonalZoneFromBottomRight40x40=densityFeatures(diagonalZoneFromBottomRight40x40);
    densityZoneOFdiagonalZoneFromBottomRight44x44=densityFeatures(diagonalZoneFromBottomRight44x44);
    densityZoneOFdiagonalZoneFromBottomRight48x48=densityFeatures(diagonalZoneFromBottomRight48x48);
    densityZoneOFdiagonalZoneFromBottomRight52x52=densityFeatures(diagonalZoneFromBottomRight52x52);
    densityZoneOFdiagonalZoneFromBottomRight56x56=densityFeatures(diagonalZoneFromBottomRight56x56);
    densityZoneOFdiagonalZoneFromBottomRight60x60=densityFeatures(diagonalZoneFromBottomRight60x60);
    
    
    densityArrayOfdiagonalZonesFromBottomRight=cell(1,15);
    densityArrayOfdiagonalZonesFromBottomRight={densityZoneOFdiagonalZoneFromBottomRight4x4;densityZoneOFdiagonalZoneFromBottomRight8x8;...
                                        densityZoneOFdiagonalZoneFromBottomRight12x12;densityZoneOFdiagonalZoneFromBottomRight16x16;...
                                        densityZoneOFdiagonalZoneFromBottomRight20x20;densityZoneOFdiagonalZoneFromBottomRight24x24;...
                                        densityZoneOFdiagonalZoneFromBottomRight28x28;densityZoneOFdiagonalZoneFromBottomRight32x32;...
                                        densityZoneOFdiagonalZoneFromBottomRight36x36;densityZoneOFdiagonalZoneFromBottomRight40x40;...
                                        densityZoneOFdiagonalZoneFromBottomRight44x44;densityZoneOFdiagonalZoneFromBottomRight48x48;...
                                        densityZoneOFdiagonalZoneFromBottomRight52x52;densityZoneOFdiagonalZoneFromBottomRight56x56;...
                                        densityZoneOFdiagonalZoneFromBottomRight60x60}; 
                                      
                                    
                                    
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
   
   %%Divide into 15 Zones diagonaly from center
   
oneRowPart = int32(rows/32);
oneColumnPart =int32(columns/32);

    diagonalZoneFromCenter4x4= grayImage(oneRowPart*15:oneRowPart*17,oneColumnPart*15:oneColumnPart*17);
    diagonalZoneFromCenter8x8= grayImage(oneRowPart*14:oneRowPart*18,oneColumnPart*14:oneColumnPart*18);
    diagonalZoneFromCenter12x12= grayImage(oneRowPart*13:oneRowPart*19,oneColumnPart*13:oneColumnPart*19);
    diagonalZoneFromCenter16x16= grayImage(oneRowPart*12:oneRowPart*20,oneColumnPart*12:oneColumnPart*20);
    diagonalZoneFromCenter20x20= grayImage(oneRowPart*11:oneRowPart*21,oneColumnPart*11:oneColumnPart*21);
    diagonalZoneFromCenter24x24= grayImage(oneRowPart*10:oneRowPart*22,oneColumnPart*10:oneColumnPart*22);
    diagonalZoneFromCenter28x28= grayImage(oneRowPart*9:oneRowPart*23,oneColumnPart*9:oneColumnPart*23);
    diagonalZoneFromCenter32x32= grayImage(oneRowPart*8:oneRowPart*24,oneColumnPart*8:oneColumnPart*24);
    diagonalZoneFromCenter36x36= grayImage(oneRowPart*7:oneRowPart*25,oneColumnPart*7:oneColumnPart*25);
    diagonalZoneFromCenter40x40= grayImage(oneRowPart*6:oneRowPart*26,oneColumnPart*6:oneColumnPart*26);
    diagonalZoneFromCenter44x44= grayImage(oneRowPart*5:oneRowPart*27,oneColumnPart*5:oneColumnPart*27);
    diagonalZoneFromCenter48x48= grayImage(oneRowPart*4:oneRowPart*28,oneColumnPart*4:oneColumnPart*28);
    diagonalZoneFromCenter52x52= grayImage(oneRowPart*3:oneRowPart*29,oneColumnPart*3:oneColumnPart*29);
    diagonalZoneFromCenter56x56= grayImage(oneRowPart*2:oneRowPart*30,oneColumnPart*2:oneColumnPart*30);
    diagonalZoneFromCenter60x60= grayImage(oneRowPart*1:oneRowPart*31,oneColumnPart*1:oneColumnPart*31);  

   
  %{  
     figure
subplot(5,3,1);
imshow(diagonalZoneFromCenter4x4);
subplot(5,3,2);
imshow(diagonalZoneFromCenter8x8);
subplot(5,3,3);
imshow(diagonalZoneFromCenter12x12);
subplot(5,3,4);
imshow(diagonalZoneFromCenter16x16);
subplot(5,3,5);
imshow(diagonalZoneFromCenter20x20);
subplot(5,3,6);
imshow(diagonalZoneFromCenter24x24);
subplot(5,3,7);
imshow(diagonalZoneFromCenter28x28);
subplot(5,3,8);
imshow(diagonalZoneFromCenter32x32);
subplot(5,3,9);
imshow(diagonalZoneFromCenter36x36);
subplot(5,3,10);
imshow(diagonalZoneFromCenter40x40);
subplot(5,3,11);
imshow(diagonalZoneFromCenter44x44);
subplot(5,3,12);
imshow(diagonalZoneFromCenter48x48);
subplot(5,3,13);
imshow(diagonalZoneFromCenter52x52);
subplot(5,3,14);
imshow(diagonalZoneFromCenter56x56);
subplot(5,3,15);
imshow(diagonalZoneFromCenter60x60);
%}   

    densityZoneOFdiagonalZoneFromCenter4x4=densityFeatures(diagonalZoneFromCenter4x4);
    densityZoneOFdiagonalZoneFromCenter8x8=densityFeatures(diagonalZoneFromCenter8x8);
    densityZoneOFdiagonalZoneFromCenter12x12=densityFeatures(diagonalZoneFromCenter12x12);
    densityZoneOFdiagonalZoneFromCenter16x16=densityFeatures(diagonalZoneFromCenter16x16);
    densityZoneOFdiagonalZoneFromCenter20x20=densityFeatures(diagonalZoneFromCenter20x20);
    densityZoneOFdiagonalZoneFromCenter24x24=densityFeatures(diagonalZoneFromCenter24x24);
    densityZoneOFdiagonalZoneFromCenter28x28=densityFeatures(diagonalZoneFromCenter28x28);
    densityZoneOFdiagonalZoneFromCenter32x32=densityFeatures(diagonalZoneFromCenter32x32);
    
    densityZoneOFdiagonalZoneFromCenter36x36=densityFeatures(diagonalZoneFromCenter36x36);
    densityZoneOFdiagonalZoneFromCenter40x40=densityFeatures(diagonalZoneFromCenter40x40);
    densityZoneOFdiagonalZoneFromCenter44x44=densityFeatures(diagonalZoneFromCenter44x44);
    densityZoneOFdiagonalZoneFromCenter48x48=densityFeatures(diagonalZoneFromCenter48x48);
    densityZoneOFdiagonalZoneFromCenter52x52=densityFeatures(diagonalZoneFromCenter52x52);
    densityZoneOFdiagonalZoneFromCenter56x56=densityFeatures(diagonalZoneFromCenter56x56);
    densityZoneOFdiagonalZoneFromCenter60x60=densityFeatures(diagonalZoneFromCenter60x60);
    
    
    densityArrayOfdiagonalZonesFromCenter=cell(1,15);
    densityArrayOfdiagonalZonesFromCenter={densityZoneOFdiagonalZoneFromCenter4x4;densityZoneOFdiagonalZoneFromCenter8x8;...
                                        densityZoneOFdiagonalZoneFromCenter12x12;densityZoneOFdiagonalZoneFromCenter16x16;...
                                        densityZoneOFdiagonalZoneFromCenter20x20;densityZoneOFdiagonalZoneFromCenter24x24;...
                                        densityZoneOFdiagonalZoneFromCenter28x28;densityZoneOFdiagonalZoneFromCenter32x32;...
                                        densityZoneOFdiagonalZoneFromCenter36x36;densityZoneOFdiagonalZoneFromCenter40x40;...
                                        densityZoneOFdiagonalZoneFromCenter44x44;densityZoneOFdiagonalZoneFromCenter48x48;...
                                        densityZoneOFdiagonalZoneFromCenter52x52;densityZoneOFdiagonalZoneFromCenter56x56;...
                                        densityZoneOFdiagonalZoneFromCenter60x60}; 
                                      
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                    
%Creating an array of density of all 13 zones.

    %allZoneDensityFeatureArray=horzcat(densityArrayOfNineZones,densityArrayOfLZ_RZ_Zones,densityArrayOfTZ_BZ_Zones,densityArrayOfdiagonalZonesFromBottom);
    
   % allZoneDensityFeatureArray=cat(2,allZoneDensityFeatureArray,densityArrayOfTZ_BZ_Zones);
  %allZoneDensityFeatureArray=cat(2,densityZone11,densityZone12,densityZone13,densityZone21);
    
%{
FeatureArrayOFallDensity={densityZone11;densityZone12;densityZone13;densityZone21;densityZone22;densityZone23;densityZone31;...
                                        densityZone32;densityZone33;...
                       densityZoneLZ;densityZoneRZ;...
                       densityZoneTZ;densityZoneBZ;...
                       densityZoneOFdiagonalZoneFromBottomLeft4x4;densityZoneOFdiagonalZoneFromBottomLeft8x8;...
                                        densityZoneOFdiagonalZoneFromBottomLeft12x12;densityZoneOFdiagonalZoneFromBottomLeft16x16;...
                                        densityZoneOFdiagonalZoneFromBottomLeft20x20;densityZoneOFdiagonalZoneFromBottomLeft24x24;...
                                        densityZoneOFdiagonalZoneFromBottomLeft28x28;densityZoneOFdiagonalZoneFromBottomLeft32x32;...
                                        densityZoneOFdiagonalZoneFromBottomLeft36x36;densityZoneOFdiagonalZoneFromBottomLeft40x40;...
                                        densityZoneOFdiagonalZoneFromBottomLeft44x44;densityZoneOFdiagonalZoneFromBottomLeft48x48;...
                                        densityZoneOFdiagonalZoneFromBottomLeft52x52;densityZoneOFdiagonalZoneFromBottomLeft56x56;...
                                        densityZoneOFdiagonalZoneFromBottomLeft60x60;...
                       densityZoneOFdiagonalZoneFromTopRight4x4;densityZoneOFdiagonalZoneFromTopRight8x8;...
                                        densityZoneOFdiagonalZoneFromTopRight12x12;densityZoneOFdiagonalZoneFromTopRight16x16;...
                                        densityZoneOFdiagonalZoneFromTopRight20x20;densityZoneOFdiagonalZoneFromTopRight24x24;...
                                        densityZoneOFdiagonalZoneFromTopRight28x28;densityZoneOFdiagonalZoneFromTopRight32x32;...
                                        densityZoneOFdiagonalZoneFromTopRight36x36;densityZoneOFdiagonalZoneFromTopRight40x40;...
                                        densityZoneOFdiagonalZoneFromTopRight44x44;densityZoneOFdiagonalZoneFromTopRight48x48;...
                                        densityZoneOFdiagonalZoneFromTopRight52x52;densityZoneOFdiagonalZoneFromTopRight56x56;...
                                        densityZoneOFdiagonalZoneFromTopRight60x60;...
                       densityZoneOFdiagonalZoneFromTopLeft4x4;densityZoneOFdiagonalZoneFromTopLeft8x8;...
                                        densityZoneOFdiagonalZoneFromTopLeft12x12;densityZoneOFdiagonalZoneFromTopLeft16x16;...
                                        densityZoneOFdiagonalZoneFromTopLeft20x20;densityZoneOFdiagonalZoneFromTopLeft24x24;...
                                        densityZoneOFdiagonalZoneFromTopLeft28x28;densityZoneOFdiagonalZoneFromTopLeft32x32;...
                                        densityZoneOFdiagonalZoneFromTopLeft36x36;densityZoneOFdiagonalZoneFromTopLeft40x40;...
                                        densityZoneOFdiagonalZoneFromTopLeft44x44;densityZoneOFdiagonalZoneFromTopLeft48x48;...
                                        densityZoneOFdiagonalZoneFromTopLeft52x52;densityZoneOFdiagonalZoneFromTopLeft56x56;...
                                        densityZoneOFdiagonalZoneFromTopLeft60x60;...
                      densityZoneOFdiagonalZoneFromBottomRight4x4;densityZoneOFdiagonalZoneFromBottomRight8x8;...
                                        densityZoneOFdiagonalZoneFromBottomRight12x12;densityZoneOFdiagonalZoneFromBottomRight16x16;...
                                        densityZoneOFdiagonalZoneFromBottomRight20x20;densityZoneOFdiagonalZoneFromBottomRight24x24;...
                                        densityZoneOFdiagonalZoneFromBottomRight28x28;densityZoneOFdiagonalZoneFromBottomRight32x32;...
                                        densityZoneOFdiagonalZoneFromBottomRight36x36;densityZoneOFdiagonalZoneFromBottomRight40x40;...
                                        densityZoneOFdiagonalZoneFromBottomRight44x44;densityZoneOFdiagonalZoneFromBottomRight48x48;...
                                        densityZoneOFdiagonalZoneFromBottomRight52x52;densityZoneOFdiagonalZoneFromBottomRight56x56;...
                                        densityZoneOFdiagonalZoneFromBottomRight60x60;...
                      densityZoneOFdiagonalZoneFromCenter4x4;densityZoneOFdiagonalZoneFromCenter8x8;...
                                        densityZoneOFdiagonalZoneFromCenter12x12;densityZoneOFdiagonalZoneFromCenter16x16;...
                                        densityZoneOFdiagonalZoneFromCenter20x20;densityZoneOFdiagonalZoneFromCenter24x24;...
                                        densityZoneOFdiagonalZoneFromCenter28x28;densityZoneOFdiagonalZoneFromCenter32x32;...
                                        densityZoneOFdiagonalZoneFromCenter36x36;densityZoneOFdiagonalZoneFromCenter40x40;...
                                        densityZoneOFdiagonalZoneFromCenter44x44;densityZoneOFdiagonalZoneFromCenter48x48;...
                                        densityZoneOFdiagonalZoneFromCenter52x52;densityZoneOFdiagonalZoneFromCenter56x56;...
                                        densityZoneOFdiagonalZoneFromCenter60x60;...                  
                      
                       };             
                      %}                    

FeatureArrayOFallDensity=cat(2,densityZone11,densityZone12,densityZone13,densityZone21,densityZone22,densityZone23,densityZone31,...
                                        densityZone32,densityZone33,...
                       densityZoneLZ,densityZoneRZ,...
                       densityZoneTZ,densityZoneBZ,...
                       densityZoneOFdiagonalZoneFromBottomLeft4x4,densityZoneOFdiagonalZoneFromBottomLeft8x8,...
                                        densityZoneOFdiagonalZoneFromBottomLeft12x12,densityZoneOFdiagonalZoneFromBottomLeft16x16,...
                                        densityZoneOFdiagonalZoneFromBottomLeft20x20,densityZoneOFdiagonalZoneFromBottomLeft24x24,...
                                        densityZoneOFdiagonalZoneFromBottomLeft28x28,densityZoneOFdiagonalZoneFromBottomLeft32x32,...
                                        densityZoneOFdiagonalZoneFromBottomLeft36x36,densityZoneOFdiagonalZoneFromBottomLeft40x40,...
                                        densityZoneOFdiagonalZoneFromBottomLeft44x44,densityZoneOFdiagonalZoneFromBottomLeft48x48,...
                                        densityZoneOFdiagonalZoneFromBottomLeft52x52,densityZoneOFdiagonalZoneFromBottomLeft56x56,...
                                        densityZoneOFdiagonalZoneFromBottomLeft60x60,...
                       densityZoneOFdiagonalZoneFromTopRight4x4,densityZoneOFdiagonalZoneFromTopRight8x8,...
                                        densityZoneOFdiagonalZoneFromTopRight12x12,densityZoneOFdiagonalZoneFromTopRight16x16,...
                                        densityZoneOFdiagonalZoneFromTopRight20x20,densityZoneOFdiagonalZoneFromTopRight24x24,...
                                        densityZoneOFdiagonalZoneFromTopRight28x28,densityZoneOFdiagonalZoneFromTopRight32x32,...
                                        densityZoneOFdiagonalZoneFromTopRight36x36,densityZoneOFdiagonalZoneFromTopRight40x40,...
                                        densityZoneOFdiagonalZoneFromTopRight44x44,densityZoneOFdiagonalZoneFromTopRight48x48,...
                                        densityZoneOFdiagonalZoneFromTopRight52x52,densityZoneOFdiagonalZoneFromTopRight56x56,...
                                        densityZoneOFdiagonalZoneFromTopRight60x60,...
                       densityZoneOFdiagonalZoneFromTopLeft4x4,densityZoneOFdiagonalZoneFromTopLeft8x8,...
                                        densityZoneOFdiagonalZoneFromTopLeft12x12,densityZoneOFdiagonalZoneFromTopLeft16x16,...
                                        densityZoneOFdiagonalZoneFromTopLeft20x20,densityZoneOFdiagonalZoneFromTopLeft24x24,...
                                        densityZoneOFdiagonalZoneFromTopLeft28x28,densityZoneOFdiagonalZoneFromTopLeft32x32,...
                                        densityZoneOFdiagonalZoneFromTopLeft36x36,densityZoneOFdiagonalZoneFromTopLeft40x40,...
                                        densityZoneOFdiagonalZoneFromTopLeft44x44,densityZoneOFdiagonalZoneFromTopLeft48x48,...
                                        densityZoneOFdiagonalZoneFromTopLeft52x52,densityZoneOFdiagonalZoneFromTopLeft56x56,...
                                        densityZoneOFdiagonalZoneFromTopLeft60x60,...
                      densityZoneOFdiagonalZoneFromBottomRight4x4,densityZoneOFdiagonalZoneFromBottomRight8x8,...
                                        densityZoneOFdiagonalZoneFromBottomRight12x12,densityZoneOFdiagonalZoneFromBottomRight16x16,...
                                        densityZoneOFdiagonalZoneFromBottomRight20x20,densityZoneOFdiagonalZoneFromBottomRight24x24,...
                                        densityZoneOFdiagonalZoneFromBottomRight28x28,densityZoneOFdiagonalZoneFromBottomRight32x32,...
                                        densityZoneOFdiagonalZoneFromBottomRight36x36,densityZoneOFdiagonalZoneFromBottomRight40x40,...
                                        densityZoneOFdiagonalZoneFromBottomRight44x44,densityZoneOFdiagonalZoneFromBottomRight48x48,...
                                        densityZoneOFdiagonalZoneFromBottomRight52x52,densityZoneOFdiagonalZoneFromBottomRight56x56,...
                                        densityZoneOFdiagonalZoneFromBottomRight60x60,...
                      densityZoneOFdiagonalZoneFromCenter4x4,densityZoneOFdiagonalZoneFromCenter8x8,...
                                        densityZoneOFdiagonalZoneFromCenter12x12,densityZoneOFdiagonalZoneFromCenter16x16,...
                                        densityZoneOFdiagonalZoneFromCenter20x20,densityZoneOFdiagonalZoneFromCenter24x24,...
                                        densityZoneOFdiagonalZoneFromCenter28x28,densityZoneOFdiagonalZoneFromCenter32x32,...
                                        densityZoneOFdiagonalZoneFromCenter36x36,densityZoneOFdiagonalZoneFromCenter40x40,...
                                        densityZoneOFdiagonalZoneFromCenter44x44,densityZoneOFdiagonalZoneFromCenter48x48,...
                                        densityZoneOFdiagonalZoneFromCenter52x52,densityZoneOFdiagonalZoneFromCenter56x56,...
                                        densityZoneOFdiagonalZoneFromCenter60x60);                  
                      
                                   
%figure
%subplot(1,2,1);
%imshow(TZ);
%subplot(1,2,2);
%imshow(BZ);

end