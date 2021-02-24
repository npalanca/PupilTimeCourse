%Vamos a empezar por elegir la imagen y convertirla a escala de grises
[FileName,PathName] = uigetfile('*.jpg','Select the image file');
file=strcat(PathName, FileName);
imagen=imread(file);
imagen=rgb2gray(imagen);
imshow(imagen)