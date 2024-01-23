function class = Voting_Scheme(Z,H,D)
class = cell(1,1);
for i = 1:numel(Z)
    if Z(i) == H(i)
        class{1} = cat(1,class{1},Z(i));
	else
		class{1} = cat(1,class{1},D(i));
	end
end

end