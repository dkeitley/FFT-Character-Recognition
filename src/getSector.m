function new_image = getSector(image,feature)
    [m,n] = size(image);
    new_image = image;

    i_0 = m/2;
    j_0 = n/2;
    
    for i = 1:m
        for j = 1:n
           r_2 = (i-i_0)^2 + (j-j_0)^2;
           theta = atan((j-j_0)/(i-i_0));
           if(feature == 1)
               if(i>i_0 - 50 | j < j_0-15 | j > j_0 + 15 )
                   new_image(i,j) = 0;
               end
           elseif(feature == 2)
               if((theta > 7*pi/16 | theta <5*pi/16 | i > i_0 |r_2 > 30000| r_2 < 4000 | r_2 < 0 ))
                  new_image(i,j) = 0;
               end   
           end
        end
    end
end