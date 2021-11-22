% Preston Satterfield
% MA7 Q2

%% Task 1 Swap Brightest and Darkest Colors
% Create LightDark function
% identifies brightest color (closest to white) and swaps with darkest
% color (closest to blck)
wheel = imread('ColorWheel.png');

swap_wheel = LightDark(wheel);
grayscale = Grayscale(wheel);
colorblind = Colorblind(wheel);

subplot(4,2,1);
image(wheel);
title('Normal')

subplot(4,2,2);
image(swap_wheel)
title('Colors Swapped')

subplot(4,2,3);
image(grayscale)
title('Grayscale')

subplot(4,2,4);
image(colorblind)
title('Deuteranomaly')

[row,col,~] = size(wheel);
all_images = [row*2, col*2, 3];

for i = 1:2*row
    for j = 1:2*col
        if i <= row
            if j <=col % top left
                all_images(i,j,1) = uint8(wheel(i,j,1));
                all_images(i,j,2) = uint8(wheel(i,j,2));
                all_images(i,j,3) = uint8(wheel(i,j,3));
            else % bottom left
                all_images(i,j,1) = uint8(swap_wheel(i,j-col,1));
                all_images(i,j,2) = uint8(swap_wheel(i,j-col,2));
                all_images(i,j,3) = uint8(swap_wheel(i,j-col,3));
            end
        else
            if j <=col % top right
                all_images(i,j,1) = uint8(grayscale(i-row,j,1));
                all_images(i,j,2) = uint8(grayscale(i-row,j,2));
                all_images(i,j,3) = uint8(grayscale(i-row,j,3));
            else % bottom right
                all_images(i,j,1) = uint8(colorblind(i-row,j-col,1));
                all_images(i,j,2) = uint8(colorblind(i-row,j-col,2));
                all_images(i,j,3) = uint8(colorblind(i-row,j-col,3));
            end
        end
        
    end
end
all_images = uint8(all_images);

subplot(4,2,5:8);
image(all_images)
title('All functions Applied')

%% Task 2 Grayscale
% Create grayscale function which converts image into grayscale
% luminance = 0.2989 * red + 0.5870 * green + 0.1141 * blue

%% Task 3 Deuteranomly
% Someone suffers from deuteranomaly (red-green colorblindess)
% Create function colorblind applies filter
% red = red*.66 + green * .34
% green = red*0.55 + green *.45
% blue = green * 0.25 + blue * 0.75



%% Task 4 Applications






