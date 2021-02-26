%O nome da imagem original é "fruit_tray.gif"
%Inicialmente para a meter em tons de cinza deve executar GrayScale.m

%Mesagem de erro utilizador
msg = 'Error occurred.';

%Mensagem Utilizador
promptNoise = 'Please select noise (salt-an-pepper or gaussian): ';
ValueNoise = input(promptNoise, 's');

if strcmp(ValueNoise,'gaussian') == 1 || strcmp(ValueNoise,'salt-an-pepper') == 1
    %Escolha do dominio do utilizador
    promptDomain = 'Please select domain (spatial or frequency): ';
    ValueDomain = input(promptDomain, 's');

    if strcmp(ValueDomain,'frequency') == 1
        %Escolha do type of smoothing do utilizador
        promptSmoothing = 'Please select smoothing (butterworth or gaussian): ';
        ValueSmoothing = input(promptSmoothing, 's');

        if strcmp(ValueDomain,'frequency') == 1 && strcmp(ValueSmoothing,'gaussian') == 1
            %Mensagem Utilizador-standard deviations
            promptStandardDeviation  = 'Please select standard deviation(1 or 2 or 3): ';
            ValueStandardDeviation = input(promptStandardDeviation);

        elseif strcmp(ValueDomain,'frequency') == 1 && strcmp(ValueSmoothing,'butterworth') == 1
            %Mensagem Utilizador-standard deviations
            promptOrder = 'Please select order(1 or 2 or 3): ';
            ValueOrder = input(promptOrder);

        else
            error(msg)
        end

    elseif strcmp(ValueDomain,'spatial') == 1
        %Escolha do type of smoothing do utilizador
        promptSmoothing = 'Please select smoothing (average, gaussian or median): ';
        ValueSmoothing = input(promptSmoothing, 's');

            if strcmp(ValueDomain,'spatial') == 1 && strcmp(ValueSmoothing,'average') == 1
            %Escolha do tamanho
            %Escolha do Size
            promptSize = 'Please select size (5,10 or 20): ';
            windowWidth = input(promptSize, 's');

            elseif strcmp(ValueDomain,'spatial') == 1 && strcmp(ValueSmoothing,'gaussian') == 1
            promptSize = 'Please select size (5,10 or 20): ';
            windowWidth = input(promptSize, 's');
            Escolha sigma 
            promptSigma = 'Please select sigma (5,10 or 20): ';
            Sigma = input(promptSigma);
            
            elseif strcmp(ValueDomain,'spatial') == 1 && strcmp(ValueSmoothing,'median') == 1
            
            else
                error(msg)
            end
    else
        error(msg)
    end
    
    noise(ValueNoise);
    DFT();
    %SpatialDomain(ValueDomain, ValueSmoothing, windowWidth,Sigma);
    main_smoothfilters(ValueDomain, ValueSmoothing, ValueStandardDeviation, ValueOrder);

else
    error(msg)
    
end
