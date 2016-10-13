function findK(training,test)
    for k = 1:6
        idx = knnsearch(training,test(:,1:2),'K',k);
        idx(find(idx<=10)) = 1;
        idx(find(idx >=11 & idx<=20)) = 2;
        idx(find(idx >=21 & idx <= 30)) = 3;

        m = mode(idx,2);

        correct = (test(:,3) == m);
        accuracy = sum(correct)/30;
        string = strcat('K = ',int2str(k),' accuracy = ',num2str(accuracy));
        disp(string);
    end

end