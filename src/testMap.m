close all
kMap = 7;


mapNameMass = cell(1,kMap);
% mapNameMass = {'problemMap4.mat';'problemMap6.mat'};
for i=1:kMap
        mapNameMass{i} = ['problemMap' num2str(i) '.mat'];
        file = load(mapNameMass{i});
        map = file.map;
   
        AnalizMap2(map)    
end

% disp('Îò÷¸ò:');
% for i=1:kMap
%     fprintf(mapNameMass{i});fprintf('\n');
%     for j=1:kFun
%         fprintf('Volna %d = %.3f\n',j-1,timeMass(i,j));
%     end
% end


