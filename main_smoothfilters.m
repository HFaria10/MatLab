function main_smoothfilters = main_smoothfilters(ValueDomain, ValueSmoothing, ValueStandardDeviation, ValueOrder) 
%FILTERING DOMAIN:SPATIAL DOMAIN OR FREQUENCY DOMAIN

%Escolha do dominio do utilizador
%promptDomain = 'Please select domain (spatial or frequency): ';
%ValueDomain = input(promptDomain, 's');

%Escolha do type of smoothing do utilizador
%promptSmoothing = 'Please select smoothing (butterworth or gaussian): ';
%ValueSmoothing = input(promptSmoothing, 's');

%FREQUENCY DOMAIN
msg = 'Error occurred.';

GreyImage2 = imread('Imagens TP1/Images-Grey Scale/Greyfruit_tray.png');
%GAUSSIAN
if strcmp(ValueDomain,'frequency') == 1 && strcmp(ValueSmoothing,'gaussian') == 1
    %LOW PASS GAUSSIAN - FRUIT
    
    FruitLPG=imread('Imagens TP1/Images-Grey Scale/Greyfruit_tray.png');
    %Determine good padding for Fourier transform
    PQFruitLPG = paddedsize(size(FruitLPG));
    %Mensagem Utilizador-standard deviations
    %promptStandardDeviation  = 'Please select standard deviation(1 or 2 or 3): ';
    %ValueStandardDeviation = input(promptStandardDeviation);
    %Create a Gaussian Lowpass filter 5% the width of the Fourier transform
    %D0FruitLPG CORRESPONDE AO standard deviation 
    D0FruitLPG = 0.05*PQFruitLPG(1);
    HFruitLPG = lpfilter('gaussian', PQFruitLPG(1), PQFruitLPG(2), D0FruitLPG);
    % Calculate the discrete Fourier transform of the image
    FFruitLPG=fft2(double(FruitLPG),size(HFruitLPG,1),size(HFruitLPG,2));
    % Apply the lowpass filter to the Fourier spectrum of the image
    LPFS_FruitLPG = HFruitLPG.*FFruitLPG;
    % convert the result to the spacial domain.
    LPF_FruitLPG=real(ifft2(LPFS_FruitLPG)); 
    % Crop the image to undo padding
    LPF_FruitLPG=LPF_FruitLPG(1:size(FruitLPG,1), 1:size(FruitLPG,2));
    %Display the blurred image
    
    %figure(3), imshow(LPF_FruitLPB, [])
    if ValueStandardDeviation == 1
        imwrite (mat2gray(LPF_FruitLPG), 'Imagens TP1/Images-Smoothed/fruit_tray_gaussianLowPass_standardDeviation1.png', 'png');
    elseif ValueStandardDeviation == 2
        imwrite (mat2gray(LPF_FruitLPG), 'Imagens TP1/Images-Smoothed/fruit_tray_gaussianLowPass_standardDeviation2.png', 'png');
    elseif ValueStandardDeviation == 3
        imwrite (mat2gray(LPF_FruitLPG), 'Imagens TP1/Images-Smoothed/fruit_tray_gaussianLowPass_standardDeviation3.png', 'png');
    else
        error(msg)
    end
    % Display the Fourier Spectrum 
    % Move the origin of the transform to the center of the frequency rectangle.
    FcFruitLPG=fftshift(FFruitLPG);
    FcfFruitLPG=fftshift(LPFS_FruitLPG);
    % use abs to compute the magnitude and use log to brighten display
    S1FcFruitLPG=log(1+abs(FcFruitLPG)); 
    S2FcFruitLPG=log(1+abs(FcfFruitLPG));
    figure(4), 
    subplot(332)
    imshow(S1FcFruitLPG,[]); title('FRUIT - Fourier Spectrum of Image')
    subplot(335)
    imshow(S2FcFruitLPG,[]); title('FRUIT - Spectrum of image with Gaussian lowpass filter')

    %HIGH PASS GAUSSIAN - FRUIT
    
    FruitHPG=imread('Imagens TP1/Images-Grey Scale/Greyfruit_tray.png');
    %Determine good padding for Fourier transform
    PQFruitHPG = paddedsize(size(FruitHPG));
    %Create a Gaussian Highpass filter 5% the width of the Fourier transform
    D0FruitHPG = 0.05*PQFruitHPG(1);
    HFruitHPG = hpfilter('gaussian', PQFruitHPG(1), PQFruitHPG(2), D0FruitHPG);
    % Calculate the discrete Fourier transform of the image
    FFruitHPG=fft2(double(FruitHPG),size(HFruitHPG,1),size(HFruitHPG,2));
    % Apply the highpass filter to the Fourier spectrum of the image
    HPFS_FruitHPG = HFruitHPG.*FFruitHPG;
    % convert the result to the spacial domain.
    HPF_FruitHPG=real(ifft2(HPFS_FruitHPG)); 
    % Crop the image to undo padding
    HPF_FruitHPG=HPF_FruitHPG(1:size(FruitHPG,1), 1:size(FruitHPG,2));
    %Display the "Sharpened" image
    %figure, imshow(HPF_FruitHPG, [])
    if ValueStandardDeviation == 1
        imwrite (mat2gray(HPF_FruitHPG),'Imagens TP1/Images-Smoothed/fruit_tray_gaussianHighPass_standardDeviation1.png', 'png');
    elseif ValueStandardDeviation == 2
        imwrite (mat2gray(HPF_FruitHPG),'Imagens TP1/Images-Smoothed/fruit_tray_gaussianHighPass_standardDeviation2.png', 'png');
    elseif ValueStandardDeviation == 3
        imwrite (mat2gray(HPF_FruitHPG),'Imagens TP1/Images-Smoothed/fruit_tray_gaussianHighPass_standardDeviation3.png', 'png');
    else
        error(msg)
    end
    % Display the Fourier Spectrum
    % Move the origin of the transform to the center of the frequency rectangle.
    FcfFruitHPG=fftshift(HPFS_FruitHPG);
    % use abs to compute the magnitude and use log to brighten display
    SFruitHPG=log(1+abs(FcfFruitHPG));
    figure(4), 
    subplot(338)
    imshow(SFruitHPG,[]); title('FRUIT - Spectrum of image with Gaussian highpass filter')

%BUTTERWORTH
elseif strcmp(ValueDomain,'frequency') == 1 && strcmp(ValueSmoothing,'butterworth') == 1
    %Low Pass Butterworth - Fruit
    
    FruitLPB=imread('Imagens TP1/Images-Grey Scale/Greyfruit_tray.png');
    %Determine good padding for Fourier transform
    PQFruitLPB = paddedsize(size(FruitLPB));
    %Create a Gaussian Lowpass filter 5% the width of the Fourier transform
    D0FruitLPB = 0.05*PQFruitLPB(1);
    %Mensagem Utilizador-standard deviations
    %promptOrder = 'Please select order(1 or 2 or 3): ';
    %ValueOrder = input(promptOrder);
    HFruitLPB = lpfilter('btw', PQFruitLPB(1), PQFruitLPB(2), D0FruitLPB, ValueOrder);
    % Calculate the discrete Fourier transform of the image
    FFruitLPB=fft2(double(FruitLPB),size(HFruitLPB,1),size(HFruitLPB,2));
    % Apply the lowpass filter to the Fourier spectrum of the image
    LPFS_FruitLPB = HFruitLPB.*FFruitLPB;
    % convert the result to the spacial domain.
    LPF_FruitLPB=real(ifft2(LPFS_FruitLPB)); 
    % Crop the image to undo padding
    LPF_FruitLPB=LPF_FruitLPB(1:size(FruitLPB,1), 1:size(FruitLPB,2));
    %Display the blurred image
    %figure(3), imshow(LPF_LenaLPB, [])
    if ValueOrder == 1
        imwrite (mat2gray(LPF_FruitLPB), 'Imagens TP1/Images-Smoothed/fruit_tray_butterworthLowPass_filterOrder1.png', 'png');
    elseif ValueOrder == 2
        imwrite (mat2gray(LPF_FruitLPB), 'Imagens TP1/Images-Smoothed/fruit_tray_butterworthLowPass_filterOrder2.png', 'png');    
    elseif ValueOrder == 3
        imwrite (mat2gray(LPF_FruitLPB), 'Imagens TP1/Images-Smoothed/fruit_tray_butterworthLowPass_filterOrder3.png', 'png');  
    else
        error(msg)
    end
    % Display the Fourier Spectrum 
    % Move the origin of the transform to the center of the frequency rectangle.
    FcFruitLPB=fftshift(FFruitLPB);
    FcfFruitLPB=fftshift(LPFS_FruitLPB);
    % use abs to compute the magnitude and use log to brighten display
    S1FcFruitLPB=log(1+abs(FcFruitLPB)); 
    S2FcFruitLPB=log(1+abs(FcfFruitLPB));
    figure(5), 
    subplot(332)
    imshow(S1FcFruitLPB,[]); title('FRUIT - Fourier Spectrum of Image')
    subplot(335)
    imshow(S2FcFruitLPB,[]); title('FRUIT - Spectrum of image with Butterworth lowpass filter')

    %High Pass Butterworth - FRUIT
    
    FruitHPB=imread('Imagens TP1/Images-Grey Scale/Greyfruit_tray.png');
    %Determine good padding for Fourier transform
    PQFruitHPB = paddedsize(size(FruitHPB));
    %Create a Gaussian Highpass filter 5% the width of the Fourier transform
    D0FruitHPB = 0.05*PQFruitHPB(1);
    HFruitHPB = hpfilter('btw', PQFruitHPB(1), PQFruitHPB(2), D0FruitHPB);
    % Calculate the discrete Fourier transform of the image
    FFruitHPB=fft2(double(FruitHPB),size(HFruitHPB,1),size(HFruitHPB,2));
    % Apply the highpass filter to the Fourier spectrum of the image
    HPFS_FruitHPB = HFruitHPB.*FFruitHPB;
    % convert the result to the spacial domain.
    HPF_FruitHPB=real(ifft2(HPFS_FruitHPB)); 
    % Crop the image to undo padding
    HPF_FruitHPB=HPF_FruitHPB(1:size(FruitHPB,1), 1:size(FruitHPB,2));
    %Display the "Sharpened" image
    %figure, imshow(HPF_FruitHPG, [])
    if ValueOrder == 1
        imwrite (mat2gray(HPF_FruitHPB),'Imagens TP1/Images-Smoothed/fruit_tray_butterworthHighPass_filterOrder1.png', 'png');
    elseif ValueOrder == 2
        imwrite (mat2gray(HPF_FruitHPB),'Imagens TP1/Images-Smoothed/fruit_tray_butterworthHighPass_filterOrder2.png', 'png');
    elseif ValueOrder == 3
        imwrite (mat2gray(HPF_FruitHPB),'Imagens TP1/Images-Smoothed/fruit_tray_butterworthHighPass_filterOrder3.png', 'png');
    else
        error(msg)
    end
    % Display the Fourier Spectrum
    % Move the origin of the transform to the center of the frequency rectangle.
    FcfFruitHPB=fftshift(HPFS_FruitHPB);
    % use abs to compute the magnitude and use log to brighten display
    SFruitHPB=log(1+abs(FcfFruitHPB));
    figure(5), 
    subplot(338)
    imshow(SFruitHPB,[]); title('FRUIT - Spectrum of image with Butterworth highpass filter')

    %PARTE DO ESPACIAL 
    
elseif strcmp(ValueDomain,'spatial') == 1 && strcmp(ValueSmoothing,'average')
    %Escolha do tamanho
    %Escolha do Size
    %promptSize = 'Please select size (5,10 or 20): ';
    %windowWidth = input(promptSize, 's');
    kernel = ones(windowWidth) / windowWidth .^ 2;
    subplot(3, 1, 1);
    imshow(GreyImage);
    drawnow;
    blurryImage = imfilter(GreyImage2, kernel, 'replicate');
    subplot(3, 1, 2);
    imshow(blurryImage);
  
elseif strcmp(ValueDomain,'spatial') == 1 && strcmp(ValueSmoothing,'gaussian') == 1

    kernel = fspecial('gaussian',windowWidth,Sigma); %% sigma segundo parametro
    mesh(kernel);
    imagesc(kernel);
    subplot(2, 1, 1);
    imshow(rgbImage);
    drawnow;
    subplot(2, 1, 2);
    blurryImage = imfilter(GreyImage2, kernel, 'replicate');
    imshow(blurryImage);

elseif strcmp(ValueDomain,'spatial') == 1 && strcmp(ValueSmoothing,'median') == 1
    
    K = medfilt2(GreyImage2);
    subplot(121);imshow(GreyImage2);
    subplot(122);imshow(K);

else

end
   
end