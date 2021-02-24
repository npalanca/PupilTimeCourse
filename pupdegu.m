%Vamos a empezar por elegir las imágenes
[FileName,PathName] = uigetfile('*.jpg','Select the image file', 'MultiSelect', 'on');

%Seleccionaremos el punto que queremos declarar como centro de la pupila en
%la primera imagen de la serie
file=strcat(PathName, cell2mat(FileName(16)));
imagen=imread(file);
imagen=rgb2gray(imagen);
%imagen=histeq(imagen);
imshow(imagen);
[X,Y]=getpts; 
POINT=[int16(X), int16(Y)]; 

%Ahora intentaremos calcular el diámetro de cada pupila hacia la derecha e
%izquierda del punto central 
thresholdH= input('Enter horizontal color threshold:  ');
thresholdV= input('Enter vertical color threshold:  ');
maxstrikes= input('Enter strike tolerance: ');
Bordesvertical;
C=VERTOTLENGTH==POINT(2); PROP=(find(C))/length(VERTOTLENGTH);
Diametros=zeros(length(FileName),2);
Diametrosvert=zeros(length(FileName),2);
Area=zeros(length(FileName),2);
for n=1:length(FileName)
file=strcat(PathName, FileName{n});
imagen=imread(file);
imagen=rgb2gray(imagen);
%imagen=histeq(imagen);
Bordesvertical;
PROPOS=round(length(VERTOTLENGTH)*PROP); 
POINT(2)=VERTOTLENGTH(PROPOS);
Bordes;
Diametros(n,1)=DIAMETER;
Diametros(n,2)=n;
Diametrosvert(n,1)=VERTDIAMETER;
Diametrosvert(n,2)=n;
Area(n,1)=(VERTDIAMETER/2)*(VERTDIAMETER/2)*pi; 
Area(n,2)=n; 
check=randi(30);
if check==25
   figure;
   imshow(imagen); 
   hold on; 
   plot(VERTOTLENGTH(:,2), VERTOTLENGTH(:,1),'w'); 
   plot(TOTLENGTH(:,2), TOTLENGTH(:,1),'w');   
   title(sprintf(cell2mat(FileName(n))));
else
end
end

%Ahora sacamos un gráfico con todos los diámetros absolutos, más adelante
%lo sacaremos en porcentaje directamente
diamax=mean(Diametros(1:15, 1));
vertmax=mean(Diametrosvert(1:15,1));
areamax=mean(Area(1:15,1));
%diamax=Diametros(15, 1);
%vertmax=Diametrosvert(15,1);
%areamax=Area(15,1);
relsize=(Diametros(:,1)/diamax)*100;
vertirel=(Diametrosvert(:,1)/vertmax)*100;
arearel=(Area(:,1)/areamax)*100;
figure;
plot(Diametros(:,2), relsize);
title('Horizontal Relative Size');
line([15 15], [50 110], 'color', 'black');

figure;
plot(Diametrosvert(:,2), vertirel);
title('Vertical Relative Size');
line([15 15], [50 110], 'color', 'black');

figure;
plot(Area(:,2), arearel);
title('Relative Area');
line([15 15], [50 110], 'color', 'black');


