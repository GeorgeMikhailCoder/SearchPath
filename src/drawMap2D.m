function res = drawMap2D(map)
    sizeMap = size(map);
    sizeMap(1)=-sizeMap(1);
    
    stenkaX = zeros(1,sizeMap(2)*sizeMap(1));
    stenkaY = zeros(1,sizeMap(1)*sizeMap(2));
    coordSource = zeros(1,2);
    coordDist = zeros(1,2);
    k=0;
    for i=1:-sizeMap(1)
        for j=1:sizeMap(2)
            if(map(i,j)==-1)
                k=k+1;
                stenkaY(k) = -i;
                stenkaX(k) = j;
            else if(map(i,j)==0)
                    coordSource = [j -i];
                else if(map(i,j)==-3)
                    coordDist = [j -i];
                end
            end
        end
    end

    hold on, grid on
    plot(coordSource(1),coordSource(2),'*y')
    plot(coordDist(1),coordDist(2),'*g')
    
    plot(stenkaX,stenkaY,'ok')
    plot(stenkaX,stenkaY,'*k')
    plot([1, 1, sizeMap(2), sizeMap(2), 1],[-1, sizeMap(1), sizeMap(1), -1, -1],'ro-')
    axis([0 sizeMap(2)+1 sizeMap(1)-1 0]);
    end
end