function newImage = Colorblind(oldImage)
% Purpose: Applies the deuteranomaly filter to the given image.
%
% Inputs:
%   oldImage = original image array
% Outputs:
%   newImage = the image array with the filter applied
%
% Remember that the above function header is only a template and the names of any input and/or
% output variables can be changed, if desired.
	red = oldImage(:,:,1);
    green = oldImage(:,:,2);
    blue = oldImage(:,:,3);
    
    red2(:,:) = red(:,:) * .66 + green(:,:) * .34;
    green2(:,:) = red(:,:) * .55 + green(:,:) * .45;
    blue2(:,:) = green(:,:) * .25 + blue(:,:) * .75;
    
    newImage = oldImage;
    newImage(:,:,1) = red2(:,:);
    newImage(:,:,2) = green2(:,:);
    newImage(:,:,3) = blue2(:,:);
    
end