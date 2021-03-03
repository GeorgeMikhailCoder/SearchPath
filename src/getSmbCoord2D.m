function res = getSmbCoord2D(map,smb)
sizeMap = size(map);
coordMass = zeros(sum(sum(map==smb)),2);
k=0;
for i=1:sizeMap(1)
    for j=1:sizeMap(2)
        if(map(i,j)==smb)
            k=k+1;
            coordMass(k,:) = [i j];
        end
    end
end

res = coordMass;
end