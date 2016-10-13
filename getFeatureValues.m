function train = getFeatureValues()
    train = zeros(30,2);
    chars = ['T','V','S'];
    cols = ['b','g','r'];
    [m,n] = size(chars);
    
    for i = 1:n
         for j = 1:10
            fileName = strcat('/home/daniel/SPS/CWK2/characters/',chars(i),int2str(j),'.GIF');
            letterCode = strcat(chars(i),'_',int2str(j));
            image = imread(fileName);

            [fft,img] = showFFT(image);
            sector1 = getSector(fft,1);
            sector2 = getSector(fft,2);

            power1 = sum(sum(abs(sector1).^2));
            power2 = sum(sum(abs(sector2).^2));
            
            train((i-1)*10 + j,:) = [power1,power2];
         end
    end
    
    







end