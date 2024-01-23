function Flag = Smearing_Func(Img,PP)
% Smearing function checks if the text documents need to be rotated 90
% degree clockwise or counter clockwise. If number of white column counts
% are more than white row counts the flag will be 0, otherwise it will be
% 1.
WCC = 0;
WRC = 0;
Flag = 1;
rmin = min(PP{1}(:));
rmax = max(PP{1}(:));
cmin = min(PP{2}(:));
cmax = max(PP{2}(:));
WC = sum(sum(Img(rmin:rmax,cmin:cmax) == 1,2));
WR = sum(sum(Img(rmin:rmax,cmin:cmax) == 1,1));
for c = cmin:cmax
	x = find(Img(rmin:rmax,c),1,'first'); 
	if(isempty(x))
		WCC = WCC + 1;
	end 
end
for r = rmin:rmax
	x = find(Img(r,cmin:cmax),1,'first'); 
	if(isempty(x))
		WRC = WRC + 1;
	end 
end
%WCC
%WRC
if WCC > WRC
	Flag = 0;
end
end