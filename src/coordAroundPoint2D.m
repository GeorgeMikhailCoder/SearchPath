function res = coordAroundPoint2D(coord, sizeMap)
coordAdd = [
    1  0;
    -1 0;
    0  1;
    0 -1
    ];

coordAround = zeros(size(coordAdd));

k=0;
for i=1:length(coordAdd)
    k=k+1;
    
    coordAround(k,:) = coordAdd(i,:)+coord;
    
    % удаляем вершины, вылетевшие за пределы массива
    if(~(prod(coordAround(k,:)>0)&& prod(coordAround(k,:)<=sizeMap)))
        coordAround(k,:)=[]; 
        k=k-1;
    end
    
end
res = coordAround;
end