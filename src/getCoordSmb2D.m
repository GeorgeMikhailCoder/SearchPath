function res = getCoordSmb2D(map, coord)

countCoord = getCountStb(coord);
a = zeros(1,countCoord);
for i=1:countCoord
    a(i) = map(coord(i,1), coord(i,2));
end
res = a';
end