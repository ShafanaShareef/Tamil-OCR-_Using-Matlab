function [LImage,remain_obj] = change_label(LImage,M,N_match,N_obj) 
%CHANGE_LABEL changes the label of the objects have to be in the same group.
%[LImage,remain_obj] = CHANGE_LABEL(LImage,M,N_match,N_OBJ) find the 
%objects that need to be in the same group and changes their label to 
%match them togheter. Then arrange all the label in sequence.
% It receives the labeled image, LImage, and the matrix contains the matching
% number of the labels,M, number of matched has been found,N_match, and the
% total number of objects,N_obj.
% It returns the corrected label matrix ,LImage, and number of objects 
% remained in the Image,remain_obj.
if(N_obj > 0)
    for i = 1:N_match
        [r,c] = find(LImage == M(i,1));
        for j = 1:size(r,1)
            LImage(r(j),c(j))= M(i,2);
		end 
	end
end
x = zeros(1,N_obj);
remain_obj = 0;
for i = 1:N_obj
    y = find(M(:,1) == i);
    if(size(y,1) == 0)
    remain_obj = remain_obj + 1;
        x(remain_obj) = i;
	end 
end
%x
for i = 1:remain_obj
    [r,c] = find(LImage == x(1,i));
    for j = 1:size(r,1)
        LImage(r(j),c(j))= i;
	end 
end

end