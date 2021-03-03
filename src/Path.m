function res = Path(map, coordDist,lenPath)
% одиночная, не рекурсивная функция
if(nargin==0)
    map = [
    
     0     1    -1    -2    -2    -2    -1    -1    -2    -2    -2    -2    -2    -2    -2;
     1     2     3    -2    -2    -2    -2    -2    -2    -1    -1    -2    -2    -2    -2;
    -1     3     4     5    -1    -1    -1    -2    -1    -2    -2    -2    -2    -2    -2;
    -2    -1     5     6    -1    -2    -1    -2    -2    -2    -2    -2    -2    -2    -2;
    -2    -1     6    -1    -1    11    -1    -1    -2    -1    -1    -2    -1    -2    -1;
    -2     8     7     8     9    10    11    -2    -2    -2    -2    -2    -2    -2    -1;
    -2    -2    -1     9    10    11    12    13    -2    -2    -1    -1    -2    -2    -2;
    -2    -1    -1    -1    -2    12    13    14    -2    -1    -2    -2    -2    -2    -2;
    -2    -2    -1    -2    -1    -1    14    -2    -2    -2    -2    -2    -2    -1    -2;
    -1    -2    -2    -2    -1    -2    -2    -2    -2    -2    -2    -2    -2    -1    -2];
    
    lenPath=14;
    coordDist = [8 8];
    
end


pathMass = zeros(lenPath,2);
pathMass(1,:) = coordDist;
curCoord = coordDist;

for i=2:lenPath
    coordAround = coordAroundPoint2D(curCoord,size(map));
    sizeCoordAround = size(coordAround);
    sizeCoordAround = sizeCoordAround(1);
    
    Dmap = zeros(1,sizeCoordAround);
    for j=1:sizeCoordAround
        Dmap(j) = map(coordAround(j,1),coordAround(j,2));
    end
    coordSucsess = coordAround(Dmap==lenPath-i,:);
    curCoord = coordSucsess(1,:);
    pathMass(i,:)=curCoord;
end
res = pathMass;
plot(pathMass(:,2),-pathMass(:,1),'b-')
end