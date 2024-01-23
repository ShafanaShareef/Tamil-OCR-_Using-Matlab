function PPoints = Find_perimeter_points(Img)
% Receives an image and finds only the surrounding pixel's coordinates 
PPoints = cell(1,2);
for r = 1:size(Img,1)
    c = find(Img(r,:),1,'first');
    if size(c,2)~= 0
        PPoints{1} = cat(1,PPoints{1},r);
        PPoints{2} = cat(1,PPoints{2},c);
    end
    c = find(Img(r,:),1,'last');
    if size(c,2)~= 0
        PPoints{1} = cat(1,PPoints{1},r);
        PPoints{2} = cat(1,PPoints{2},c);
    end
end
end