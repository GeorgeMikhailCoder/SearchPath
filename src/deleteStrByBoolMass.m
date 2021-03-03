function res = deleteStrByBoolMass(matrix, boolMass)
% 0 - удалить
% 1 - оставить

i=1;
nStr = getCountStb(matrix);
while(i<=nStr)
    if(~boolMass(i))
       matrix(i,:)=[];
       boolMass(i) = [];
       i=i-1;
       nStr=nStr-1;
    end
    i=i+1;
end

res = matrix;
end