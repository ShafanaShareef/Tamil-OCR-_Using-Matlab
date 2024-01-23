function [z,Region_order] = sort_labels(bw,L,num)
% Components are sorted based on their maximum row value. Therefore, all
% the components with smaller maximum row values will be labeled before the
% next row's components.
Region_info = cell(1,2);
Region_order = cell(1,1);
for i = 1:num
    [r ~] = find(L == i);
	Region_info{1} = cat(1,Region_info{1},min(r));
    
end


[sorted,sorted_order] = sort(Region_info{1},1); 




L2 = zeros(size(L));
for i = 1:num
    L2(L == sorted_order(i)) = i ;
end
clear Region_info
Region_info = cell(1,2);
Region_info{1} = sorted;

%disp('size(Region_info{1}');
%disp(size(Region_info{1}));

for i = 1:num
    [r ~] = find(L2 == i);
Region_info{2} = cat(1,Region_info{2},min(r));%%%%%%%%%%%%%%%
end

Region_order{1} = cat(1,Region_order{1},1); 
for i = 1:num-1
	if abs(Region_info{1}(i,1)-Region_info{2}(i+1,1))> 20 
		Region_order{1} = cat(1,Region_order{1},i+1);
	end 
end
Region_order{1} = cat(1,Region_order{1},num+1);
Region_order{1}(:,1);
clear Region_info;
clear sorted;
clear sorted_order;
clear r;
clear c;

% Look at the components of each row and sort them from maximum column 
% value to minimum.
Region_info = cell(1,2);
z = zeros(size(L2));

for M = 1:num
	[r c] = find(L2 == M);
Region_info{2} = cat(1,Region_info{2},min(c)); 
  
	Region_info{1} = cat(1,Region_info{1},M);
end
for i = 1: size(Region_order{1})-1
	for j = Region_order{1}(i): (Region_order{1}(i+1))-1 
        
         
		for k = j+1: (Region_order{1}(i+1))-1
			if(Region_info{2}(j) > Region_info{2}(k)) 
				temp1 = Region_info{2}(j);
				temp2 = Region_info{1}(j); 
				Region_info{2}(j) = Region_info{2}(k); 
				Region_info{1}(j) = Region_info{1}(k); 
				Region_info{2}(k)= temp1; 
				Region_info{1}(k)= temp2;
			end 
		end
	end 
end

for i = 1: num
     z(L2 == Region_info{1}(i)) = i ;
end
%%return
end
