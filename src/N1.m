length = 4;
width = 5;

map = randi(2, length, width)-1;
map(1,1,1,1)=1;
map(1,2,1,1)=0;
map(2,1,1,1)=0;
map(:,:,1,1)

a = [randi(length) randi(width) randi(heigh)];
a = [1 1 1];
b = [randi(length) randi(width) randi(heigh)];


map = LabelPointAround2D(map,a);

map(:,:,1,1)

