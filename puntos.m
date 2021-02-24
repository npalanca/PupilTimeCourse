%Select a loaded image
%IMG=input('Name the image to analyze: ');


%imagen=histeq(imagen);
imshow(imagen)
%Select one or more points, get the color values for them
[X,Y]=getpts; 
POINT=[int16(X), int16(Y)]; 
COLOR=zeros(length(POINT(:,1)),1);
for count= 1:length(COLOR)
COLOR(count)= imagen(POINT(count,2),POINT(count,1));
end
COLOR;

%Get the values of a +-300 pixel line on the X axis
AXIS=zeros(600,2);
SAVEPOINTS=zeros(600,2);
Pixel=-300;
for n= 1:600 
 SAVEPOINTS(n, :)= [POINT(1,2), (POINT(1,1)+ Pixel)];
 AXIS(n,1)=imagen(POINT(1,2), (POINT(1,1)+Pixel));  
 AXIS(n,2)=Pixel;
 Pixel=Pixel+1;
end 

AXIS
SAVEPOINTS
hold on;
plot(SAVEPOINTS(:,2), SAVEPOINTS(:,1));
