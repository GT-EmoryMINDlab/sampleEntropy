function outImg = flattenEntrop(entropyImg)
entropyImg = permute(entropyImg(end:-1:1,:,end:-1:1),[3,1,2]);
[x,y,z] = size(entropyImg);
counter = 1;

outImg = zeros(x.*8,y.*16);
for r = 1:8
    for c = 1:16
        currslice = entropyImg(:,:,counter);
        rstart = (r-1).*64 + 1;
        rend = r.*64;
        cstart = (c-1).*64 + 1;
        cend = c.*64;
        outImg(rstart:rend,cstart:cend) = currslice;
        counter = counter+1;
    end
end
end