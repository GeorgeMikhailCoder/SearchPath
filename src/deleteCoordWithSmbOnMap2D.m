function res = deleteCoordWithSmbOnMap2D(map, coord, smb)

sizeCoord = size(coord);
nCoord = sizeCoord(1);
boolMass = ones(1, nCoord);

for i=1:nCoord
    if(map(coord(i,1),coord(i,2))==smb)
        boolMass(i)=0;
    end
end
coord = deleteStrByBoolMass(coord,boolMass);
res = coord;

end