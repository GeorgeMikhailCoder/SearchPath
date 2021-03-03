function [map, isPath, lenPath] = Volna1(map, coord, isPath, lenPath,depthRecursion)
% ����������� ��������� ���������

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
    
    % ��������� ����������
    coord=coordSource;
    
    % ��������� �����
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


baseD = map(coord(1),coord(2)); % �������� ���� � ������� �����

% ������ ������� �����
plot(coord(2),-coord(1),'y*');
text(coord(2)+0.1,-coord(1)-0.1,num2str(baseD));

for i=1:length(coordAround) % ��� ���� ����� ������
    curCoord = coordAround(i,:); % ���������� "��������" �����
    curD = map(curCoord(1),curCoord(2)); % �������� ���� � �������� �����
    
    if(curD>baseD||curD==-2||curD==-3) % ���� �������� ���� � ����� ������, ��� � ������� ��� ��� ��������� ������ ��� ����� ����
        % ������
        plot(curCoord(2),-curCoord(1),'go');
        pause(speed);
        plot(curCoord(2),-curCoord(1),'bo');
%         text(curCoord(2)+0.1,-curCoord(1)-0.1,num2str(curD));
        
        if(curD==-3)
            lenPath = baseD + 2;
            text(curCoord(2)+0.1,-curCoord(1)-0.1,num2str(lenPath));
            isPath=1; % ����� �� �������
            break;
        else
            curD = baseD + 1; % ���� � ����� ����������� ���� �� ������� �� ��������
            map(curCoord(1),curCoord(2))=curD; % ������� �������� �� �����
            newCoord(i,:)=coordAround(i,:); % ��������� ����� ��� ��������� ����� ����
        end
    end
end

if(~isPath) %���� ���� ������ �� ���� ����� - ����� �� �������
    newCoord = deleteNullCoord(newCoord); %������� ������� ��������
    if(~(isempty(newCoord))) % ���� ����, ���� ����
        sizeNewCoord = size(newCoord);
        nNewCoord = sizeNewCoord(1);%�������� ���������� ����� (�� length!)
        
        newCoord = sortCoord(coordSource,coordDist,newCoord); % �������������! (��� ����)
        lenPath = map(coord(1),coord(2))+1;
        
        for i=1:nNewCoord % ��� �� ��� ����� �����
            if(~isPath) %���� ���� ������ �� ������ ����� - ����� �� �������
                [map, isPath, lenPath] = Volna1(map,newCoord(i,:), isPath, lenPath, depthRecursion+1);
            else
                break;
            end
        end
    end
end

if(depthRecursion==0)
    if(isPath)
%         disp('���� ������');
%         fprintf('length = %d\n',lenPath);
        pathMass = Path(map,coordDist,lenPath);
    else
%         disp('��� ���������� ����');
    end
end

end





