function maximumLikelihood(training,maxx,maxy)
    figure()
    hold on
    T = training(1:10,1:2);
    V = training(11:20,1:2);
    S = training(21:30,1:2);
    
    muT = mean(T);
    muV = mean(V);
    muS = mean(S);
    
    sigT = cov(T);
    sigV = cov(V);
    sigS = cov(S);

    x = [0:maxx/50:maxx]';
    y = [0:maxy/50:maxy]';
    [X1,X2] = meshgrid(x,y);

    PT = mvnpdf([X1(:) X2(:)],muT,sigT);
    PV = mvnpdf([X1(:) X2(:)],muV,sigV);
    PS = mvnpdf([X1(:) X2(:)],muS,sigS);
    

    
    scatter(training(1:10,1),training(1:10,2),'r');
    scatter(training(11:20,1),training(11:20,2),'b');
    scatter(training(21:30,1),training(21:30,2),'g');



end
