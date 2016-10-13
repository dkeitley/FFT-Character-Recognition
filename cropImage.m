function subImage = cropImage(I)
    Ithresh = I < 1;
    Ithresh = imclearborder(Ithresh);
    props = regionprops(Ithresh,'BoundingBox','Area');
    subImage = imcrop(I,props.BoundingBox);
    %imshow(subImage,[]);
    subImage = imresize(subImage,[400,640]);
   % imshow(subImage,[]);
    
    
     

end