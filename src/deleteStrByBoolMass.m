function res = deleteStrByBoolMass(matrix, boolMass)
% 0 - �������
% 1 - ��������

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