function res = sortCoord(coordSource,coordDist,newCoord)
if(nargin==0)
    coordSource = [1 1];
    coordDist= [2 5];
%     newCoord = [
%         2 2;
%         1 3;
%         2 1;
%         2 3
%         ];
    
    newCoord = [
        3 3;
        4 4;
        5 3;
        4 2
        ];
end
vect = coordDist-coordSource;

s = size(newCoord);
nNewCoord = s(1);
prodMass = zeros(1,nNewCoord);

for i=1:nNewCoord
    curVect = coordDist - newCoord(i,:);
%   prodMass(i) = curVect*vect'/norm(curVect);
    prodMass(i) = norm(curVect);
end
[B I] = sort(prodMass);
res = newCoord(I,:);
end