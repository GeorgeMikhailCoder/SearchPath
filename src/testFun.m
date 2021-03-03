function res = testFun(Voln,map)
Start = cputime;
Voln(map);
res = cputime - Start;
end
