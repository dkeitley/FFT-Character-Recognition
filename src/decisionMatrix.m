function coords = decisionMatrix(maxx,maxy,training,classifier)
    %classifier = 0 => nearest neighbour, 1 => ML
    if(classifier == 1)
        T = training(1:10,1:2);
        V = training(11:20,1:2);
        S = training(21:30,1:2);

        muT = mean(T);
        muV = mean(V);
        muS = mean(S);

        sigT = cov(T);
        sigV = cov(V);
        sigS = cov(S);
    end

    coords = [];
    intervalx = (maxx)/50;
    intervaly = (maxy)/50;
    
    for i = 1:50
        for j = 1:50
            x= intervalx*i;
            y = intervaly*j;
            m = 0;
            
            if(classifier == 0)
                idx = knnsearch(training,[x,y],'K',2);
                idx(find(idx<=10)) = 1;
                idx(find(idx >=11 & idx<=20)) = 2;
                idx(find(idx >=21 & idx <= 30)) = 3;
                m = mode(idx');
            else
                PT = mvnpdf([x,y],muT,sigT);
                PV = mvnpdf([x,y],muV,sigV);
                PS = mvnpdf([x,y],muS,sigS);
                if(PS >= PV)
                    if(PT>=PS)
                        m = 1;
                    else
                        m = 3;
                    end
                else
                    m = 2;
                end
            end

            coord = [];
            if(m == 1)
                coord = [x,y,1];
            elseif(m==2)
                coord = [x,y,2];
            else
                coord = [x,y,3];
            end
            coords = [coords;coord];
        end
    end
end