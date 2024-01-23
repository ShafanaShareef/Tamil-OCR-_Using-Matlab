

function [numberOfvert,numberOfhori,numberOfleft_sland,numberOfright_sland]=LineCounts(img)

 img = padarray(img,[5 5]);
 %img = bwmorph(img,'diag',Inf);
 %img = bwmorph(img,'skel',Inf);
%img = bwmorph(img,'thicken',1);
%img = bwmorph(img,'remove');
%img = bwmorph(img,'thin',3);

%img = imclearborder(img);
           

%figure, imshow(dial_logical_line), title('dial logical line');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Vertical lines%%%%%%%
im = img;
tol = 5;
[~,ang] = imgradient(im);
outv = (ang >= 180 - tol | ang <= -180 + tol);
out_filter_vert = bwareaopen(outv, 40);

%{
figure
subplot(4,3,1);
imshow(im);
subplot(4,3,2);
imshow(outv);
subplot(4,3,3);
imshow(out_filter_vert);
%}

%[labeledImagevert, numberOfvert] = bwlabel(out_filter_vert);
[labeledImagevert, numberOfvert] = bwlabel(out_filter_vert);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Horizontal lines%%%%%%%
im2 = img;
tol = 5;
[~,ang] = imgradient(im2);
outh = (ang >= 95 - tol & ang <= 90 + tol) | (ang >= -90 - tol & ang <= -90 + tol);

out_filter_hori = bwareaopen(outh, 40);

%{
%figure
subplot(4,3,4);
imshow(im);
subplot(4,3,5);
imshow(outh);
subplot(4,3,6);
imshow(out_filter_hori);
%}
[labeledImagehori, numberOfhori] = bwlabel(out_filter_hori);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% left Slanding lines%%%%%%%
im3 = img;
tol = 20;
[~,ang] = imgradient(im3);
outls = (ang >= 45 - tol & ang <= 45 + tol) | (ang >= -135 - tol & ang <= -135 + tol);
out_filter_left_sland = bwareaopen(outls, 28);

%{
%figure
subplot(4,3,7);
imshow(im2);
subplot(4,3,8);
imshow(outls);
subplot(4,3,9);
imshow(out_filter_left_sland);
%}
[labeledImageleft_sland, numberOfleft_sland] = bwlabel(out_filter_left_sland);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% right Slanding lines%%%%%%%
im4 = img;
tol = 20;
[~,ang] = imgradient(im4);
outrs = (ang >= 135 - tol & ang <= 135 + tol) | (ang >= -45 - tol & ang <= -45 + tol);
out_filter_right_sland = bwareaopen(outrs, 28);
%imshow(out_filter_right_sland);

%{
%figure
subplot(4,3,10);
imshow(im2);
subplot(4,3,11);
imshow(outrs);
subplot(4,3,12);
imshow(out_filter_right_sland);
%}
[labeledImageright_sland, numberOfright_sland] = bwlabel(out_filter_right_sland);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



end