function [resMap, maskMap] = EraseEllipse(map,e)
if(nargin==0)
    f = load('easyMap1.mat');
    map = f.map;
end

if(nargin<=1)
    e = 0.8;
end

drawMap2D(map);
coordSource = getSmbCoord2D(map,0);
coordDist = getSmbCoord2D(map,-3);
sizeMap = size(map);

vect = coordDist - coordSource;
normVect = vect/norm(vect);
F1 = coordSource;
F2 = coordDist;

O = (F1+F2)/2;
c = norm(F1 - O);
a = c/e;

constM = norm((O + a*normVect) - F1) + norm((O + a*normVect) - F2);
maskMap = zeros(size(map));
for i=1:sizeMap(1)
    for j=1:sizeMap(2)
        if( norm([i,j] - F1) + norm([i,j] - F2)<=constM )
            maskMap(i,j) = 1;
        end
    end
end

resMap = zeros(size(map));
resMap(maskMap==1)=map(maskMap==1);

figure
plotMaskMap=maskMap;
plotMaskMap=changeSmb(plotMaskMap,1,-1);
plotMaskMap=changeSmb(plotMaskMap,0,-2);
drawMap2D(plotMaskMap);


end