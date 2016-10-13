function [G,F] = showFFT(image)
    F = fft2(double(image));
    F = fftshift(F);
    G = F;
    F = log(abs(F)+1);
    F = mat2gray(F);
    %F = imagesc(F);
    %colorbar;
end
