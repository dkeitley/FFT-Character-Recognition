function fftMatrix()
    ffts = [];
    for i = 1:10
        fileName = strcat('/home/daniel/SPS/CWK2/test_characters/V_',int2str(i),'.gif');
        saveName = strcat('/home/daniel/SPS/CWK2/FFTs/S',int2str(i),'_fft.GIF');
        
        [G,F] = showFFT((~imread(fileName)));
        F = repmat(uint8(255.*F),[1 1 3]);
        ffts = [ffts,F];
    end

  montage(ffts);

end
