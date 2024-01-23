function snHOG = snhogcalculator(img)
[rows, columns] = size(img);

grayImage=img;
r3 = int32(rows/3);
c3 = int32(columns/3);


hogvector=cell(1,81);
% Extract the 9 images.
zone11 = grayImage(1:r3, 1:c3);
[cellph cellpw]=size(zone11);
snHOG11=hogcalculator(zone11, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%hogvector=snHOG11;


zone12 = grayImage(1:r3, c3+1:2*c3);
[cellph cellpw]=size(zone12);
snHOG12=hogcalculator(zone12, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%hogvector=snHOG12;


zone13 = grayImage(1:r3, 2*c3+1:end);
[cellph cellpw]=size(zone13);
snHOG13=hogcalculator(zone13 , cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%hogvector=snHOG13;

zone21 = grayImage(r3+1:2*r3, 1:c3);
[cellph cellpw]=size(zone21);
snHOG21=hogcalculator(zone21, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%hogvector=snHOG21;


zone22 = grayImage(r3+1:2*r3, c3+1:2*c3);
[cellph cellpw]=size(zone22);
snHOG22=hogcalculator(zone22, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%hogvector=snHOG22;


zone23 = grayImage(r3+1:2*r3, 2*c3+1:end);
[cellph cellpw]=size(zone23);
snHOG23=hogcalculator(zone23, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%hogvector=snHOG23;


zone31 = grayImage(2*r3+1:end, 1:c3);
[cellph cellpw]=size(zone31);
snHOG31=hogcalculator(zone31, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%hogvector=snHOG31;


zone32 = grayImage(2*r3+1:end, c3+1:2*c3);
[cellph cellpw]=size(zone32);
snHOG32=hogcalculator(zone32, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%hogvector=snHOG32;


zone33 = grayImage(2*r3+1:end, 2*c3+1:end);
[cellph cellpw]=size(zone33);
snHOG33=hogcalculator(zone33, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%hogvector=snHOG33;



snHOG=horzcat(snHOG11,snHOG12,snHOG13,snHOG21,snHOG22,snHOG23,snHOG31,snHOG32,snHOG33);

end