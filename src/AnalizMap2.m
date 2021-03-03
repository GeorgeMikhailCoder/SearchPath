function res = AnalizMap2(map)
% res = 0 - light
% res = 1 - difficult

if(nargin==0)
   f=load('easyMap1.mat');
%    f=load('problemMap1.mat');
   map = f.map;
end

[map, maskMap] = EraseEllipse(map);

map = changeSmb(map, -2, 0);
map = changeSmb(map, -3, 0);
map = changeSmb(map, -1, 1);

S = sum(sum(map==1));
k = sum(sum(maskMap==1));
res = S/k;

end