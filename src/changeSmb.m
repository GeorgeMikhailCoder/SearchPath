function res = changeSmb(map,smbFrom, smbTo)
sizeMap = size(map);
for i=1:sizeMap(1)
    for j=1:sizeMap(2)
        for k=1:length(smbTo)
           if(map(i,j)==smbFrom(k)) 
                map(i,j)=smbTo(k);
           end
        end
    end
end
res = map;
end