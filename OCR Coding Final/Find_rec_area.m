function [CP Area] = Find_rec_area(P)
% Having perimiter points of a text area find the corner points of 
% the surrounding rectangle and the coverage area
PP = cell(1,2);
xmin = min(P{1}(:));
ymin = min(P{2}(:));
if xmin < 0
    PP{1}= P{1}(:)-xmin;
    else
        PP{1} = P{1}(:);
end
if ymin < 0
    PP{2} = P{2}(:)-ymin;
else
    PP{2} = P{2}(:);
end
%PP{1}(:)
%PP{2}(:)
CP = cell(1,2);
[val ind1]= min(PP{1});
ind2 = find(PP{2}(ind1)== min(PP{2}(ind1)),1,'first'); 
CP{1} = cat(1,CP{1},PP{1}(ind1(1,ind2)));
CP{2} = cat(1,CP{2},PP{2}(ind1(1,ind2))) ; % Point A
[val ind1]= max(PP{1});
ind2 = find(PP{2}(ind1)== max(PP{2}(ind1)),1,'first');
CP{1} = cat(1,CP{1},PP{1}(ind1(1,ind2)));
CP{2} = cat(1,CP{2},PP{2}(ind1(1,ind2))); % Point C
[val ind1]= min(PP{2});
ind2 = find(PP{1}(ind1)== max(PP{1}(ind1)),1,'first'); 
CP{1} = cat(1,CP{1},PP{1}(ind1(1,ind2)));
CP{2} = cat(1,CP{2},PP{2}(ind1(1,ind2))); % Point D
[val ind1]= max(PP{2});
ind2 = find(PP{1}(ind1)== min(PP{1}(ind1)),1,'first'); 
CP{1} = cat(1,CP{1},PP{1}(ind1(1,ind2)));
CP{2} = cat(1,CP{2},PP{2}(ind1(1,ind2))); % Point B CP{1}(:) = ceil(CP{1}(:));
CP{2}(:) = ceil(CP{2}(:));
Area = (CP{1}(2)-CP{1}(1))*(CP{2}(4)-CP{2}(3));

end