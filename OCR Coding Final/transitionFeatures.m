function TF=transitionFeatures(img)

[rows, columns] = size(img);
TF=[];
%NT_k2=[];
%%%%%%%%%%%%%%%%%%%%%%%%
%row wise transition%

for k = 1:rows
    row_k = img(k, 1:columns);
    NT_k=sum(diff(row_k)<0);
    TF=cat(2,TF,NT_k);
end

%%%%%%%%%%%%%%%%%%%%%%%%%
%columnwise transition%
for k = 1:rows
    col_k = img(1:rows,k);
    NT_k=sum(diff(col_k)<0);
    TF=cat(2,TF,NT_k);
end

for k = -61:0
    diag_v = diag(img,k);
    NT_k=sum(diff(diag_v)<0);
    TF=cat(2,TF,NT_k);
end

for k = 1:61
    diag_v = diag(img,k);
    NT_k=sum(diff(diag_v)<0);
    TF=cat(2,TF,NT_k);
end

img2=fliplr(img);

for k = -61:0 
    diag_v = diag(img2,k);
    NT_k=sum(diff(diag_v)<0);
    TF=cat(2,TF,NT_k);
end

for k = 1:61
    diag_v = diag(img2,k);
    NT_k=sum(diff(diag_v)<0);
    TF=cat(2,TF,NT_k); 
end


end
