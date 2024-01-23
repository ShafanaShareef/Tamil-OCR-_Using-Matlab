

function [numObjects, numEdgePoints, numIntersectPoints]= end_intersect(img)

img = padarray(img,[15 15]);
n1=img;

CC=bwconncomp(img,8);
L = labelmatrix(CC);
%disp('number of objects');
%disp(CC.NumObjects);
numObjects=CC.NumObjects;
n1 = bwmorph(n1,'diag',Inf);

%interval2=[1 1 1
  %         1 1 1
 %          0 1 0];

       
%n1 = bwhitmiss(n1,interval2);


%n1= bwmorph(n1,'remove');       
n1 = bwmorph(n1,'skel',Inf);
n1 = bwmorph(n1,'spur',15);

BinImag=n1;

% draw binary image
%image(BinImag,'CDataMapping','scaled');
% Get position (Abscissa, Ordinate) of all non-zero values
[Pos(:,1),Pos(:,2)] = find(BinImag);
% Inital edge points
numEdgePoints = 0;
% Inital intersection points
numIntersectPoints = 0;
% Over all nonZero elements
for kNonZero = 1:size(Pos,1)
    % Initial neighborhood of the nonzero element
    kNonZeroNeig = zeros(9,2);
    % Position in the Initial neighborhood
    i = 0;
    % All neighbor positions
    for kNeighborX = -1:1:1
        for kNeigborY = -1:1:1
            i = i+1;
            kNonZeroNeig(i,1) = Pos(kNonZero,1)+kNeighborX;
            kNonZeroNeig(i,2) = Pos(kNonZero,2)+kNeigborY;
        end
    end
    % Check existing neighbors
    existNeigbor = intersect(Pos,kNonZeroNeig,'rows');
    % Number of existing neighbors
    numExistNeigbor = size(existNeigbor,1);
    % Check what typ of point is it
    switch numExistNeigbor
        % edge point
        case 2
            numEdgePoints = numEdgePoints+1;
            % Edge Point position, x-y correction with fliplr
            EdgePointsPosition(numEdgePoints,:) = fliplr(Pos(kNonZero,:));
        case 5
            numIntersectPoints = numIntersectPoints+1;
            % Edge Point position, x-y correction with fliplr
            % Not working correct
            IntersectPointsPosition(numIntersectPoints,:) = fliplr(Pos(kNonZero,:));
    end            
end
%disp('end');
%disp(numEdgePoints);
%disp('inter');
%disp(numIntersectPoints);
end
