function [T,V,S] = classify(test,training)
    IDX = knnsearch(training(:,1:2),test(:,1:2));
    IDX(find(IDX<=10)) = 1;
    IDX(find(IDX<=20 & IDX>=11)) = 2;
    IDX(find(IDX<=30 & IDX>=21)) = 3;

    test(:,3) = IDX;
    T = test(find(test(:,3)==1),:);
    V = test(find(test(:,3)==2),:);
    S = test(find(test(:,3)==3),:);

end