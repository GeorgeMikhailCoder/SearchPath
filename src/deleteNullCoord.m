function res = deleteNullCoord(coord)
a = coord;
b = a([a(:,1)~=0 & a(:,2)~=0 a(:,1)~=0 & a(:,2)~=0]);
res = [b(1:length(b)/2) b(length(b)/2+1:length(b)) ];
end

