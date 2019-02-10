networkStruct = struct();
for k = 1:7
    networkStruct(k).mask = networks == k;
    networkStruct(k).maskLine = networkStruct(k).mask(:);
end