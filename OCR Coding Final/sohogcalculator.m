function soHOG = sohogcalculator(img)
image=imresize(img,[96 96]);
%image=img;
[rows, columns] = size(image);

grayImage=image;
r3 = int32(rows/3);
c3 = int32(columns/3);


% Extract the 9 images.
zone11 = grayImage(1:r3, 1:c3);
[cellph cellpw]=size(zone11);
r2 = cellph;
c2 = int32(cellpw/2);


LZ = zone11(:, 1 : c2);
RZ = zone11(:, c2+1 : cellpw);






%[cellph cellpw]=size(zone11);
soHOG11=hogcalculator(zone11, 8, 8, 4, 4,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%disp(soHOG11);
%hogvector=snHOG11;
%soHOG11=hogcalculator(zone11, 8, 8, 2, 2,...
%9, 0.5, 'localinterpolate', 'unsigned', 'l2hys');
%disp(soHOG11);


zone12 = grayImage(1:r3, c3+1:2*c3);
%[cellph cellpw]=size(zone12);
soHOG12=hogcalculator(zone12,8, 8, 4, 4,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%hogvector=snHOG12;


zone13 = grayImage(1:r3, 2*c3+1:end);
%[cellph cellpw]=size(zone13);
soHOG13=hogcalculator(zone13 , 8, 8, 4, 4,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%hogvector=snHOG13;

zone21 = grayImage(r3+1:2*r3, 1:c3);
%[cellph cellpw]=size(zone21);
soHOG21=hogcalculator(zone21, 8, 8, 4, 4,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%hogvector=snHOG21;


zone22 = grayImage(r3+1:2*r3, c3+1:2*c3);
%[cellph cellpw]=size(zone22);
soHOG22=hogcalculator(zone22, 8, 8, 4, 4,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%hogvector=snHOG22;


zone23 = grayImage(r3+1:2*r3, 2*c3+1:end);
%[cellph cellpw]=size(zone23);
soHOG23=hogcalculator(zone23, 8, 8, 4, 4,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%hogvector=snHOG23;


zone31 = grayImage(2*r3+1:end, 1:c3);
%[cellph cellpw]=size(zone31);
soHOG31=hogcalculator(zone31, 8, 8, 4, 4,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%hogvector=snHOG31;


zone32 = grayImage(2*r3+1:end, c3+1:2*c3);
%[cellph cellpw]=size(zone32);
soHOG32=hogcalculator(zone32, 8, 8, 4, 4,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%hogvector=snHOG32;


zone33 = grayImage(2*r3+1:end, 2*c3+1:end);
%[cellph cellpw]=size(zone33);
soHOG33=hogcalculator(zone33, 8, 8, 4, 4,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%hogvector=snHOG33;



soHOG=horzcat(soHOG11,soHOG12,soHOG13,soHOG21,soHOG22,soHOG23,soHOG31,soHOG32,soHOG33);

end