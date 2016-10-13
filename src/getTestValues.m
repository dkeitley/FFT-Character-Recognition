function values = getTestValues()
    testValues = zeros(30,3);
    chars = ['T','V','S'];
    cols = ['b','g','r'];
    [m,n] = size(chars);
    
    for i = 1:n
         for j = 1:10
            fileName = strcat('/home/daniel/SPS/CWK2/test_characters/',chars(i),'_',int2str(j),'.gif');
            image = imread(fileName);
            %reverse gimp colour coding
            image = ~image;

            [fft,img] = showFFT(image);
            sector1 = getSector(fft,1);
            sector2 = getSector(fft,2);

            power1 = sum(sum(abs(sector1).^2));
            power2 = sum(sum(abs(sector2).^2));
            
            values((i-1)*10 + j,:) = [power1,power2,i];
         end
    end
end