function eHOG=  ehogcalculator(img)

img=imresize(img,[64 64]);
img1=img;
img2=img;
img3=img;
img4=img;
img5=img;
img6=img;
img7=img;
img8=img;
img9=img;


[rows, columns] = size(img);
%%%%%%%%%%%%%%%%%%%%%
%c1 = [32 0 32 64];
%r1 = [0 32 64 32];
%mask1 = roipoly(img1,c1,r1);
%img1(~mask1) = 0; %set things not in the mask to zero
%imshow(img1);
%%%%%%

%w1=sqrt((rows*rows)+(columns*columns))/3;
h1=rows/6;
byThree=rows/3;
half=rows/2;


%%%%%%%%%%%%%%%%%%%%
%HOG for 5_a_nine_regions%
r_a_1 = [1 h1 byThree h1];
c_a_1 = [half (half-h1) half (half+h1)];
mask1 = roipoly(img1,c_a_1,r_a_1);
img1(~mask1) = 0;
%imshow(img1);

[cellph cellpw]=size(img1);
eHOG_a_1=hogcalculator(img1, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');

%disp(' eHOG_a_1');
%disp(eHOG_a_1);
%%%%%%%%%%%%%%%%%%%%%
r_a_2 = [h1 byThree half byThree];
c_a_2 = [(half-h1) (half-2*h1) (half-h1) half];
mask2 = roipoly(img2,c_a_2,r_a_2);
img2(~mask2) = 0;
%imshow(img2);

[cellph cellpw]=size(img2);
eHOG_a_2=hogcalculator(img2, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');

%disp(' eHOG_a_2');
%disp(eHOG_a_2);
%%%%%%%%%%%%%%%%%%%%%%
r_a_3 = [h1 byThree half byThree];
c_a_3 = [(half+h1) half (half+h1) (half+2*h1)];
mask3 = roipoly(img3,c_a_3,r_a_3);
img3(~mask3) = 0;
%imshow(img3);

[cellph cellpw]=size(img3);
eHOG_a_3=hogcalculator(img3, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');

%disp(' eHOG_a_3');
%disp(eHOG_a_3);
%%%%%%%%%%%%%%%%%%%%%%%
r_a_4 = [byThree half byThree*2 half];
c_a_4 = [(half-2*h1) 1 (half-2*h1) (half-h1)];
mask4 = roipoly(img4,c_a_4,r_a_4);
img4(~mask4) = 0;
%imshow(img4);

[cellph cellpw]=size(img4);
eHOG_a_4=hogcalculator(img4, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');

%disp(' eHOG_a_4');
%disp(eHOG_a_4);
%%%%%%%%%%%%%%%%%%%%%%
r_a_5 = [byThree half byThree*2 half];
c_a_5 = [half (half-h1) half (half+h1)];
mask5 = roipoly(img5,c_a_5,r_a_5);
img5(~mask5) = 0;
%imshow(img5);

[cellph cellpw]=size(img5);
eHOG_a_5=hogcalculator(img5, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');

%disp(' eHOG_a_5');
%disp(eHOG_a_5);
%%%%%%%%%%%%%%%%%%%%%%
r_a_6 = [byThree half byThree*2 half];
c_a_6 = [(half+2*h1) (half+h1) (half+2*h1) rows];
mask6 = roipoly(img6,c_a_6,r_a_6);
img6(~mask6) = 0;
%imshow(img6);

[cellph cellpw]=size(img6);
eHOG_a_6=hogcalculator(img6, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');

%disp(' eHOG_a_6');
%disp(eHOG_a_6);
%%%%%%%%%%%%%%%%%%%%%%
r_a_7 = [half byThree*2 (rows-h1) byThree*2];
c_a_7 = [(half-h1) (half-2*h1) (half-h1) half];
mask7 = roipoly(img7,c_a_7,r_a_7);
img7(~mask7) = 0;
%imshow(img7);

[cellph cellpw]=size(img7);
eHOG_a_7=hogcalculator(img7, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');

%disp(' eHOG_a_7');
%disp(eHOG_a_7);
%%%%%%%%%%%%%%%%%%%%%%%%
r_a_8 = [half byThree*2 (rows-h1) byThree*2];
c_a_8 = [(half+h1) half (half+h1) (half+2*h1)];
mask8 = roipoly(img8,c_a_8,r_a_8);
img8(~mask8) = 0;
%imshow(img8);

[cellph cellpw]=size(img8);
eHOG_a_8=hogcalculator(img8, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');

%disp(' eHOG_a_8');
%disp(eHOG_a_8);
%%%%%%%%%%%%%%%%%%%%%%%%%
r_a_9 = [byThree*2 (rows-h1) rows (rows-h1)];
c_a_9 = [half (half-h1) half (half+h1)];
mask9 = roipoly(img9,c_a_9,r_a_9);
img9(~mask9) = 0;
%imshow(img9);

[cellph cellpw]=size(img9);
eHOG_a_9=hogcalculator(img9, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');

%disp(' eHOG_a_9');
%disp(eHOG_a_9);
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%figure
%subplot(3,3,1);
%imshow(img1);
%subplot(3,3,2);
%imshow(img2);
%subplot(3,3,3);
%imshow(img3);
%subplot(3,3,4);
%imshow(img4);
%subplot(3,3,5);
%imshow(img5);
%subplot(3,3,6);
%imshow(img6);
%subplot(3,3,7);
%imshow(img7);
%subplot(3,3,8);
%imshow(img8);
%subplot(3,3,9);
%imshow(img9);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%top left 4 hog%

top_left_4_1 = img(1:8, 1:17);
%fHOG=hogcalculator(top_left_4);
[cellph cellpw]=size(top_left_4_1);
eHOG_b_1=hogcalculator(top_left_4_1, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%disp(' eHOG_b_1');
%disp(eHOG_b_1);

top_left_4_2 = img(1:8, 18:34);
%fHOG=hogcalculator(top_left_4);
[cellph cellpw]=size(top_left_4_2);
eHOG_b_2=hogcalculator(top_left_4_2, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%disp(' eHOG_b_2');
%disp(eHOG_b_2);

top_left_4_3 = img(9:16, 1:17);
%fHOG=hogcalculator(top_left_4);
[cellph cellpw]=size(top_left_4_3);
eHOG_b_3=hogcalculator(top_left_4_3, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%disp('eHOG_b_3 ');
%disp(eHOG_b_3);

top_left_4_4 = img(9:16, 18:34);
%fHOG=hogcalculator(top_left_4);
[cellph cellpw]=size(top_left_4_4);
eHOG_b_4=hogcalculator(top_left_4_4, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%disp('eHOG_b_4 ');
%disp(eHOG_b_4);
%%%%%%%%%%%%%%%%%%

%figure
%subplot(2,2,1);
%imshow(top_left_4_1);
%subplot(2,2,2);
%imshow(top_left_4_2);
%subplot(2,2,3);
%imshow(top_left_4_3);
%subplot(2,2,4);
%imshow(top_left_4_4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bottom_left_4%

bottom_left_4_1 = img(48:56, 1:17);
[cellph cellpw]=size(bottom_left_4_1);
eHOG_c_1=hogcalculator(bottom_left_4_1, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%disp(' eHOG_c_1');
%disp(eHOG_c_1);

bottom_left_4_2 = img(48:56, 18:34);
%fHOG=hogcalculator(top_left_4);
[cellph cellpw]=size(bottom_left_4_2);
eHOG_c_2=hogcalculator(bottom_left_4_2, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%disp(' eHOG_c_2');
%disp(eHOG_c_2);

bottom_left_4_3 = img(57:64, 1:17);
%fHOG=hogcalculator(top_left_4);
[cellph cellpw]=size(bottom_left_4_3);
eHOG_c_3=hogcalculator(bottom_left_4_3, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%disp('eHOG_c_3 ');
%disp(eHOG_c_3);

bottom_left_4_4 = img(57:64, 18:34);
%fHOG=hogcalculator(top_left_4);
[cellph cellpw]=size(bottom_left_4_4);
eHOG_c_4=hogcalculator(bottom_left_4_4, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%disp('eHOG_c_4 ');
%disp(eHOG_c_4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure
%subplot(2,2,1);
%imshow(bottom_left_4_1);
%subplot(2,2,2);
%imshow(bottom_left_4_2);
%subplot(2,2,3);
%imshow(bottom_left_4_3);
%subplot(2,2,4);
%imshow(bottom_left_4_4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bottom_right_4_1 = img(48:56, 30:47);
[cellph cellpw]=size(bottom_right_4_1);
eHOG_d_1=hogcalculator(bottom_right_4_1, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%disp(' eHOG_d_1');
%disp(eHOG_d_1);

bottom_right_4_2 = img(48:56, 48:64);
%fHOG=hogcalculator(top_left_4);
[cellph cellpw]=size(bottom_right_4_2);
eHOG_d_2=hogcalculator(bottom_right_4_2, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%disp(' eHOG_d_2');
%disp(eHOG_d_2);

bottom_right_4_3 = img(57:64, 30:47);
%fHOG=hogcalculator(top_left_4);
[cellph cellpw]=size(bottom_right_4_3);
eHOG_d_3=hogcalculator(bottom_right_4_3, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%disp('eHOG_d_3 ');
%disp(eHOG_d_3);

bottom_right_4_4 = img(57:64, 48:64);
%fHOG=hogcalculator(top_left_4);
[cellph cellpw]=size(bottom_right_4_4);
eHOG_d_4=hogcalculator(bottom_right_4_4, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%disp('eHOG_d_4 ');
%disp(eHOG_d_4);
%%%%%%%%%%%%%%%%%%%%
%figure
%subplot(2,2,1);
%imshow(bottom_right_4_1);
%subplot(2,2,2);
%imshow(bottom_right_4_2);
%subplot(2,2,3);
%imshow(bottom_right_4_3);
%subplot(2,2,4);
%imshow(bottom_right_4_4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

top_right_4_1 = img(1:8, 1:17);
%fHOG=hogcalculator(top_left_4);
[cellph cellpw]=size(top_right_4_1);
eHOG_e_1=hogcalculator(top_right_4_1, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%disp(' eHOG_e_1');
%disp(eHOG_e_1);

top_right_4_2 = img(1:8, 18:34);
%fHOG=hogcalculator(top_left_4);
[cellph cellpw]=size(top_right_4_2);
eHOG_e_2=hogcalculator(top_right_4_2, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%disp(' eHOG_e_2');
%disp(eHOG_e_2);

top_right_4_3 = img(9:16, 1:17);
%fHOG=hogcalculator(top_left_4);
[cellph cellpw]=size(top_right_4_3);
eHOG_e_3=hogcalculator(top_right_4_3, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%disp('eHOG_e_3 ');
%disp(eHOG_e_3);

top_right_4_4 = img(9:16, 18:34);
%fHOG=hogcalculator(top_left_4);
[cellph cellpw]=size(top_right_4_4);
eHOG_e_4=hogcalculator(top_right_4_4, cellpw, cellph, 1, 1,...
9, 0, 'localinterpolate', 'unsigned', 'l2hys');
%disp('eHOG_e_4 ');
%disp(eHOG_e_4);
%%%%%%%%%%%%%%%%%%%
%figure
%subplot(2,2,1);
%imshow(top_right_4_1);
%subplot(2,2,2);
%imshow(top_right_4_2);
%subplot(2,2,3);
%imshow(top_right_4_3);
%subplot(2,2,4);
%imshow(top_right_4_4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



eHOG=horzcat(eHOG_a_1,eHOG_a_2,eHOG_a_3,eHOG_a_4,eHOG_a_5,eHOG_a_6,eHOG_a_7,eHOG_a_8,eHOG_a_9,eHOG_b_1,eHOG_b_2,eHOG_b_3,eHOG_b_4,eHOG_c_1,eHOG_c_2,eHOG_c_3, eHOG_c_4,...
   eHOG_d_1,eHOG_d_2,eHOG_d_3,eHOG_d_4,eHOG_e_1,eHOG_e_2,eHOG_e_3,eHOG_e_4);
end