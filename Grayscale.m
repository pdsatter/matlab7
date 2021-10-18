function newImage = Grayscale(oldImage)
% Purpose: Converts the given image to grayscale.
%
% Inputs:
%   oldImage = original image array
% Outputs:
%   newImage = a grayscale version of the image array
%
% Remember that the above function header is only a template and the names of any input and/or
% output variables can be changed, if desired.

newImage = oldImage;
red = oldImage(:,:,1);
green = oldImage(:,:,2);
blue = oldImage(:,:,3);

luminance = .2989 * red + 0.5870*green + 0.1141 * blue;

newImage(:,:,1) = luminance(:,:);
newImage(:,:,2) = luminance(:,:);
newImage(:,:,3) = luminance(:,:);
end
