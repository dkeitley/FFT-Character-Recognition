function findOptimumSector()
    bestAng1 = 0;
    bestAng2 = 0;
    maxAvDist = 0;
    i = -pi/2;
    j = -pi/2;
    while i<pi/2
        while j < pi/2
            
            avDist = powerSpectrum(i,j);
            if(avDist > maxAvDist)
                maxAvDist = avDist;
                bestAng1 = i;
                bestAng2 = j;
            end
            j = j + pi/8;
        end
        i = i + pi/8;
    end
    disp(bestAng1);
    disp(bestAng2);
    disp(maxAvDist);
        


end