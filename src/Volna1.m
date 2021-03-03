function [map, isPath, lenPath] = Volna1(map, coord, isPath, lenPath,depthRecursion)
% необходимые стартовые параметры

speed = 0.0;
isPath=0;

if(nargin<=1)
        
    if(nargin==0)
        %         map = round(rand(10,15)-0.2 - 2);
        file = load('problemMap1.mat');
        map = file.map;
%         coordSource = [1 1];
%         coordDist = [6 14];
%         map(coordSource(1),coordSource(2))=0;
%         map(coordDist(1),coordDist(2))=-3;   
        coordSource = getSmbCoord2D(map,0);
        coordDist = getSmbCoord2D(map,-3); 
    else
        coordSource = getSmbCoord2D(map,0);
    end
    
    depthRecursion=0;
    lenPath=0;
    acsessCoordMass = [];    
    
    % стартовые вычисления
    coord=coordSource;
    
    % стартовый вывод
%     map=map
    figure
    title('Volna1');
    hold on
    drawMap2D(map);
end
sizeMap = size(map);
coordSource = getSmbCoord2D(map,0);
coordDist = getSmbCoord2D(map,-3);


if(depthRecursion>map(coord(1),coord(2)))
    return;
end

coordAround = coordAroundPoint2D(coord,size(map));
newCoord = zeros(size(coordAround));


baseD = map(coord(1),coord(2)); % значение пути в базовой точке

% рисуем базовую точку
plot(coord(2),-coord(1),'y*');
text(coord(2)+0.1,-coord(1)-0.1,num2str(baseD));

for i=1:length(coordAround) % для всех точек вокруг
    curCoord = coordAround(i,:); % координаты "окружной" точки
    curD = map(curCoord(1),curCoord(2)); % значение пути в окружной точке
    
    if(curD>baseD||curD==-2||curD==-3) % если значение пути в точке больше, чем в текущей или там незанятый проход или конец пути
        % рисуем
        plot(curCoord(2),-curCoord(1),'go');
        pause(speed);
        plot(curCoord(2),-curCoord(1),'bo');
%         text(curCoord(2)+0.1,-curCoord(1)-0.1,num2str(curD));
        
        if(curD==-3)
            lenPath = baseD + 2;
            text(curCoord(2)+0.1,-curCoord(1)-0.1,num2str(lenPath));
            isPath=1; % выход из функции
            break;
        else
            curD = baseD + 1; % путь в точке увеличиваем путь на единицу от текущего
            map(curCoord(1),curCoord(2))=curD; % заносим значение на карту
            newCoord(i,:)=coordAround(i,:); % добавляем точку как следующее звено пути
        end
    end
end

if(~isPath) %если путь найден на этом этапе - выйти из функции
    newCoord = deleteNullCoord(newCoord); %удаляем нулевые значения
    if(~(isempty(newCoord))) % если есть, куда идти
        sizeNewCoord = size(newCoord);
        nNewCoord = sizeNewCoord(1);%получаем количество точек (не length!)
        
        newCoord = sortCoord(coordSource,coordDist,newCoord); % упорядочиваем! (вся соль)
        lenPath = map(coord(1),coord(2))+1;
        
        for i=1:nNewCoord % идём во все новые точки
            if(~isPath) %если путь найден на нижнем этапе - выйти из функции
                [map, isPath, lenPath] = Volna1(map,newCoord(i,:), isPath, lenPath, depthRecursion+1);
            else
                break;
            end
        end
    end
end

if(depthRecursion==0)
    if(isPath)
%         disp('Путь найден');
%         fprintf('length = %d\n',lenPath);
        pathMass = Path(map,coordDist,lenPath);
    else
%         disp('Нет доступного пути');
    end
end

end





