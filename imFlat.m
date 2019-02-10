function flat = imFlat(image)
%flatten image, with 8 columns, and however many rows are needed (with
%extra empty slices added to fill space
[m,n,k] = size(image);
while (mod(k,8) ~= 0)
    image(:,:,end+1) = zeros(m,n);
    k = size(image,3);
end

cols = 8;
rows = k./8;
flat = zeros(rows.*m,cols.*n);
counter = 1;
for r = 1:rows
    for c = 1:cols
        toPlace = image(:,:,counter);
        flat(m*(r-1)+1:m*r,n*(c-1)+1:n*c) = toPlace;
        counter = counter+1;
    end
end
end