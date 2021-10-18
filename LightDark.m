function newImage = LightDark(oldImage)
% Purpose: Swaps the lightest pixels in the given image with the darkest and vice versa.
%
% Inputs:
%   oldImage = original image array
% Outputs:
%   newImage = the image array after the pixels have been swapped
%
% Remember that the above function header is only a template and the names of any input and/or
% output variables can be changed, if desired.

    
    brightest = [0, 0, 0];
    darkest = [255, 255, 255];
    
    % Find
    [row, col, ~] = size(oldImage);
    for i = 1:row
        for j = 1:col
            check = sum(oldImage(i,j,1:3));
            red = oldImage(i,j,1);
            green = oldImage(i,j,2);
            blue = oldImage(i,j,3);
            if check > sum(brightest)
                brightest = [red, green, blue];
            end
            if check < sum(darkest)
                darkest = [red, green, blue];
            end
        end
    end
    % Replace
    newImage=oldImage;
    for i = 1:row
        for j = 1:col
            red = oldImage(i,j,1);
            green = oldImage(i,j,2);
            blue = oldImage(i,j,3);
            
            
            if isequal(sum(brightest), sum([red, green, blue]))
                newImage(i,j,1) = darkest(1);
                newImage(i,j,2) = darkest(2);
                newImage(i,j,3) = darkest(3);
            elseif isequal(sum(darkest), sum([red, green, blue]))
                newImage(i,j,1) = brightest(1);
                newImage(i,j,2) = brightest(2);
                newImage(i,j,3) = brightest(3);
            end
        end
    end    
    
end