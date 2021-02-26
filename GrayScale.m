
[X, map] = imread('Imagens TP1/fruit_tray.gif');
Image2 = ind2gray(X,map);

GreyImage2 = ind2gray(X,map);
imwrite (GreyImage2, 'Imagens TP1/Images-Grey Scale/Greyfruit_tray.png', 'png');