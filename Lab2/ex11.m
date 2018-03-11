function [] = ex11(imagePath);
[filepath,name,ext] = fileparts(imagePath)

%resolução do exercicio 1.1 de lab2

%parte 1.1 i)
image = imread(imagePath);
if size(image,3) ~= 3
	image = cat(3,image,image,image);
end
disp('Imagem:');
figure(1),imshow(image),title('imagem original');
%parte 1.1 ii)
r = image(:,:,1);
g = image(:,:,2);
b = image(:,:,3);
figure(2),imshow(r),title('red');
figure(3),imshow(g),title('green');
figure(4),imshow(b),title('blue');

%parte 1.1 iii)
image2 = rgb2hsv(image);
disp('HSV');
figure(5),imshow(image2),title('imagem em hsv');

%parte 1.1 iv)
h = image2(:,:,1);
s = image2(:,:,2);
v = image2(:,:,3);
figure(6),imshow(h),title('hue');
figure(7),imshow(s),title('saturation');
figure(8),imshow(v),title('brightness');

%parte 1.2
image3 = rgb2ycbcr(image);
figure(9),imshow(image3),title('imagem em ycbcr');

y = image3(:,:,1);
cb = image3(:,:,2);
cr = image3(:,:,3);
figure(10),imshow(y),title('luminance');
figure(11),imshow(cb),title('cb');
figure(12),imshow(image),title('cr');

imwrite(image,strcat('outputs/',name,'-','original',ext));
imwrite(r,strcat('outputs/',name,'-','red',ext));
imwrite(g,strcat('outputs/',name,'-','green',ext));
imwrite(b,strcat('outputs/',name,'-','blue',ext));
imwrite(image2,strcat('outputs/',name,'-','hsv',ext));
imwrite(h,strcat('outputs/',name,'-','hue',ext));
imwrite(s,strcat('outputs/',name,'-','sat',ext));
imwrite(v,strcat('outputs/',name,'-','brigh',ext));
imwrite(image3,strcat('outputs/',name,'-','ycbcr',ext));
imwrite(y,strcat('outputs/',name,'-','y',ext));
imwrite(cb,strcat('outputs/',name,'-','cb',ext));
imwrite(cr,strcat('outputs/',name,'-','cr',ext));
