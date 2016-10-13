function powerSpec(F)
    Pyy = F.*conj(F)/251;
    f = 1000/251*(0:127);
    figure();
    plot(f,Pyy(1:128));
    

end