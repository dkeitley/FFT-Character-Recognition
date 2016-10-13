function powerSpectrum()
    chars = ['T','V','S'];
    cols = ['b','g','r'];
    [m,n] = size(chars);
    x = [];
    y = zeros(n+2,10);
    figure()
    for i = 1:n
         for j = 1:10
            fileName = strcat('/home/daniel/SPS/CWK2/characters/',chars(i),int2str(j),'.GIF');
            %fileName = strcat('/home/daniel/SPS/CWK2/test_characters/',chars(i),'_',int2str(j),'.gif');
            
            letterCode = strcat(chars(i),'_',int2str(j));
            image = imread(fileName);
            
            %image = ~image;
            
            [G,F] = showFFT(image);
            
           sec = getSector(G,1);

            power = sum(sum(abs(sec).^2));
           
            y(i,j) = power;
            x = [x, letterCode];
         end
    end
    bar(y);
end
