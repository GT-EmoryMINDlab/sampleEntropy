function [subAvg, subflat] = subScans(filavg, filflat, gsravg, gsrflat)
subAvg = gsravg - filavg;
subflat = gsrflat - filflat;
end
