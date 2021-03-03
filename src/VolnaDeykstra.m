function [map, isPath, lenPath] = VolnaDeykstra(map, coord, acsessCoordMass, isPath, lenPath,depthRecursion)
% необходимые стартовые параметры

speed = 0.1;
isPath=0;

if(nargin<=1)
    
    if(nargin==0)
        %map = round(rand(10,15)-0.2 - 2);
        file = load('easyMap1.mat');
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
    title('Volna Deykstra');
    hold on
    drawMap2D(map);
end
sizeMap = size(map);
coordSource = getSmbCoord2D(map,0);
coordDist = getSmbCoord2D(map,-3);


if(lenPath==7)
    speed = 5;
end

coordAround = coordAroundPoint2D(coord,size(map));
newCoord = zeros(size(coordAround));


baseD = map(coord(1),coord(2)); % значение пути в базовой точке

% рисуем базовую точку
plot(coord(2),-coord(1),'y*');
plot(coord(2),-coord(1),'ro');
pause(speed)
plot(coord(2),-coord(1),'bo');
text(coord(2)+0.1,-coord(1)-0.1,num2str(baseD));

for i=1:length(coordAround) % для всех точек вокруг
    curCoord = coordAround(i,:); % координаты "окружной" точки
    curD = map(curCoord(1),curCoord(2)); % значение пути в окружной точке
    
    if(curD>baseD+1||curD==-2||curD==-3) % если значение пути в точке больше, чем в текущей или там незанятый проход или конец пути
        if(curD==-3) % если конец пути
            lenPath = baseD + 2;
            text(curCoord(2)+0.1,-curCoord(1)-0.1,num2str(lenPath-1));
            isPath=1; % выход из функции
            break;
        else
            newCoord(i,:)=coordAround(i,:); % добавляем точку как следующее звено пути
            map(curCoord(1),curCoord(2))= map(coord(1),coord(2)) + 1; % заносим значение на карту
        end
        
        % рисуем точку
        plot(curCoord(2),-curCoord(1),'go');
        pause(speed);
        plot(curCoord(2),-curCoord(1),'bo');
    end
end

if(~isPath) %если путь найден на этом этапе - выйти из функции
    newCoord = deleteNullCoord(newCoord); %удаляем нулевые значения
    
    if(~(isempty(newCoord))) % если есть, куда идти
        acsessCoordMass = [acsessCoordMass; newCoord];
        sizeAcsessCoord = size(acsessCoordMass);
        nAcsessCoord = sizeAcsessCoord(1);%получаем количество точек (не length!)
        
        acsessCoordMass = sortCoord2(map,coordSource,coordDist,acsessCoordMass); % упорядочиваем! (вся соль)
%         acsessCoordMass(1 : min(sizeAcsessCoord(1),4) ,:)% просто вывод, потом удалить
        
        while(nAcsessCoord>0) % идём во все доступные точки
            if(~isPath) %если путь найден на нижнем этапе - выйти из функции

                acsessCoordMass = sortCoord2(map,coordSource,coordDist,acsessCoordMass); % упорядочиваем! (вся соль)
                nextCoord = acsessCoordMass(1,:);
                acsessCoordMass(1,:) = []; % удаляем посещённую точку
                nAcsessCoord=nAcsessCoord-1;
                
               
                
                lenPath = getCoordSmb2D(map,coord);
                pause(speed)
                [map, isPath, lenPath] = VolnaDeykstra(map,nextCoord,acsessCoordMass, isPath, lenPath, depthRecursion+1);
            else
                break;
            end
        end
    end
end

if(depthRecursion==0)
    if(isPath)
        disp('Путь найден');
        fprintf('length = %d\n',lenPath);
        pathMass = Path(map,coordDist,lenPath);
        hold on
        plot(pathMass(:,1),pathMass(:,2))
        hold off
    else
        disp('Нет доступного пути');
    end
end

end





