%Adicionar Salt-an-pepper noise
function noise = noise(ValueNoise) 

%Mesagem de erro utilizador
msg = 'Error occurred.';
GreyImage2 = imread('Imagens TP1/Images-Grey Scale/Greyfruit_tray.png');

if strcmp(ValueNoise,'salt-an-pepper') == 1
    FruitSaltNoise= imnoise(GreyImage2, 'salt & pepper', 0.05); %J = imnoise(I,'salt & pepper', d) adds salt and pepper noise, where d is the noise density. This affects approximately d*numel(I) pixels.
    imwrite (FruitSaltNoise, 'Imagens TP1/Images-Noise/fruit_tray_noisetype_salt&pepper.png', 'png');
    %figure(1),imshow(FruitSaltNoise);

%Adicionar gaussian noise
elseif strcmp(ValueNoise,'gaussian') == 1
    FruitGaussianNoise = imnoise(GreyImage2, 'gaussian', 0, 0.05); %J = imnoise(I,'gaussian',m,var_gauss) adds Gaussian white noise with mean m and variance var_gauss.
    imwrite (FruitGaussianNoise, 'Imagens TP1/Images-Noise/fruit_tray_noisetype_gaussian.png', 'png');
    %figure(2),imshow(FruitGaussianNoise);

else
    error(msg)
end