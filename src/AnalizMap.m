function res = AnalizMap(map)
% res = 0 - light
% res = 1 - difficult


map = changeSmb(map, -2, 0);
map = changeSmb(map, -3, 0);
map = changeSmb(map, -1, 1);

res = mean(mean(map));

end