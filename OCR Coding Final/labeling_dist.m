function [L_matrix,Nmatched_obj] = labeling_dist(L,num,Line_seg) 
% LABELING labels overlapping objects to the same group.
% [L_matrix,Nmatched_obj] = LABELING(L,NUM)receives a specified 
% connected component matrix and
% the number of connected components in an image and figures out wheather
% either of those objects belong to eachother. If so, it changes the lables
% to reflect this effect. The output of this function is L_matrix, 
% the matrix of the lables that need to be changed, and number of 
% overlapped objects that has been found,Nmatched_obj.
%L_matrix = zeros(factorial(num),2);
L_matrix = zeros(num,2);
rp = 1;
Nmatched_obj = 0;
% Line_seg{1}(:,1);
for i = 1: size(Line_seg{1})-1
	for k = Line_seg{1}(i): (Line_seg{1}(i+1))-1
         [r, c] = find(L==k);
         for j = k+1: (Line_seg{1}(i+1))-1
             [rj, cj] = find(L == j);

             if (max(c,[],1) >= min(cj,[],1)) && (min(c,[],1) <= max(cj, [],1)) 
             	if ( max(cj,[],1) <=max(c,[],1)) && (min(cj,[],1) >= min(c,[],1)) || (max(c,[],1)<= max(cj,[],1)+ 5)

             		if(size(c,1) >= size(cj,1))
						L_matrix(rp,1:2)=[j,k]; % j Label has to change to k label

						rp = rp+1;
					else
						L_matrix(rp,1:2)=[k,j];
						rp = rp+1;
                    end 
                end
					Nmatched_obj = Nmatched_obj + 1; % number of matched  objects

			end
		end
	end	
end
return
end





