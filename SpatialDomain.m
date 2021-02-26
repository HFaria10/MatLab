function SpatialDomain = SpatialDomain(ValueDomain, ValueSmoothing, windowWidth,Sigma)


%Escolha do dominio do utilizador
%promptDomain = 'Please select domain (spatial or frequency): ';
%ValueDomain = input(promptDomain, 's');

%Escolha do type of smoothing do utilizador
%promptSmoothing = 'Please select smoothing (average, gaussian or median): ';
%ValueSmoothing = input(promptSmoothing, 's');

GreyImage2 = imread('Imagens TP1/Images-Grey Scale/Greyfruit_tray.png');

if strcmp(ValueDomain,'spatial') == 1 && strcmp(ValueSmoothing,'average')
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
    %Escolha do Size
    %promptSize = 'Please select size (5,10 or 20): ';
    %windowWidth = input(promptSize, 's');
    %Escolha sigma 
    %promptSigma = 'Please select sigma (5,10 or 20): ';
    %Sigma = input(promptSigma);
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

