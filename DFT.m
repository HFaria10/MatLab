function DFT = DFT()
GreyImage2 = imread('Imagens TP1/Images-Grey Scale/Greyfruit_tray.png');

fGreyfruit_tray = imread('Imagens TP1/Images-Grey Scale/Greyfruit_tray.png');
PQGreyfruit_tray = paddedsize(size(fGreyfruit_tray));
FGreyfruit_tray=fft2(double(fGreyfruit_tray), PQGreyfruit_tray(1), PQGreyfruit_tray(2)); %calcular DFT
FGreyfruit_tray2=fftshift(FGreyfruit_tray);       
figure(2)
subplot(332)
imshow(log(1+abs(FGreyfruit_tray2)),[]); title('DFT IMAGE - Original FRUIT TRAY')

fGreyfruit_traySP = imread('Imagens TP1/Images-Noise/fruit_tray_noisetype_salt&pepper.png');
PQGreyfruit_traySP = paddedsize(size(fGreyfruit_traySP));
FGreyfruit_traySP=fft2(double(fGreyfruit_traySP), PQGreyfruit_traySP(1), PQGreyfruit_traySP(2)); %calcular DFT
FGreyfruit_tray2SP=fftshift(FGreyfruit_traySP);       
figure(2)
subplot(335)
imshow(log(1+abs(FGreyfruit_tray2SP)),[]); title('DFT IMAGE - FRUIT TRAY SALT PEPPER')

fGreyfruit_trayGaussian = imread('Imagens TP1/Images-Noise/fruit_tray_noisetype_gaussian.png');
PQGreyfruit_trayGaussian = paddedsize(size(fGreyfruit_trayGaussian));
FGreyfruit_trayGaussian =fft2(double(fGreyfruit_trayGaussian), PQGreyfruit_trayGaussian(1), PQGreyfruit_trayGaussian(2)); %calcular DFT
FGreyfruit_tray2Gaussian =fftshift(FGreyfruit_trayGaussian);       
figure(2)
subplot(338)
imshow(log(1+abs(FGreyfruit_tray2Gaussian)),[]); title('DFT IMAGE - FRUIT TRAY GAUSSIAN')