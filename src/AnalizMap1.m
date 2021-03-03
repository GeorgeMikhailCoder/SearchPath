function res = AnalizMap1(map)
% res = 0 - light
% res = 1 - difficult

if(nargin==0)
   f=load('easyMap1.mat');
   f=load('problemMap1.mat');
   map = f.map;
end

map = changeSmb(map, -2, 0);
map = changeSmb(map, -3, 0);
map = changeSmb(map, -1, 1);

% S = strel('diamond',1);
S = 1/9.*...
   [1 1 1; 
    0 0 1; 
    1 1 1];
I = map.*255;
I = imfilter(I,S);
map = I./255
res = mean(mean(map));

end