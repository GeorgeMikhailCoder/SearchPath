close all

kMap = 1;
kFun = 2;

timeMass = zeros(kMap,kFun);
mapNameMass = cell(1,kMap);
for i=kMap:kMap
%         mapNameMass{i} = ['problemMap' num2str(i) '.mat'];
        mapNameMass{i} = 'NoPathMap1.mat';
        file = load(mapNameMass{i});
        map = file.map;
%     map = round(rand(60,50)-(0.5 - 1000/(60*50)) - 2);
%     coordSource = [1 1];
%     coordDist = [46 39];
%     map(coordSource(1),coordSource(2))=0;
%     map(coordDist(1),coordDist(2))=-3;

    
%     timeMass(i,1) = testFun(@(m) Volna0(m), map);
    timeMass(i,1) = testFun(@(m) Volna1(m), map);
    timeMass(i,2) = testFun(@(m) Volna2(m), map);
    
end

disp('Îò÷¸ò:');
for i=kMap:kMap
    fprintf(mapNameMass{i});fprintf('\n');
    for j=1:kFun
        fprintf('Volna %d = %.3f\n',j-1,timeMass(i,j));
    end
end


