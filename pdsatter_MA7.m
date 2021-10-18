% Preston Satterfield
% MA7


%% Task 1 Data Validation
% Load images MRI_Scan.png and Tumor.png
% check MRI scan is larger than tumor (both rows and cols)
% Check both images are viewable (3-d, 3-layers), error if not met

mri_scan = imread('MRI_Scan.png');
tumor= imread('Tumor.png');
subplot(1,2,1); image(mri_scan)
subplot(1,2,2); image(tumor)
[mri_r, mri_c, mri_l] = size(mri_scan);
[tumor_r, tumor_c, tumor_l] = size(tumor);

% Error messages
if tumor_r > mri_r || tumor_c > mri_c
    error('tumor image is too large')
elseif mri_l ~= 3 || mri_l ~= tumor_l
    error('make sure images are viewable')
end
%% Task 2 Find the tumor
%
detected = false;  % true/false, bool if tumor is found
for i = 1:mri_r-tumor_r+1  % cycles through mri pixels (only goes until width of tumor wouldn't fit on image
   for j = 1:mri_c-tumor_c+1
       first = tumor(1,1);  % First pixel on tumor picture (top left)
       
       if mri_scan(i,j) == first  % If mri matches tumor pixel
          start = [i,j];  % start point (used to indentify top left pixel of tumor)
          detected = true;  % detected is true if found
          
          for row = 1:tumor_r  % cycles through tumor
              for col = 1:tumor_c
                  if tumor(row,col) ~= mri_scan(i + row -1, j + col - 1)  % if tumor doesn't match
                      detected = false;
                      break
                  end
              end
          end
          
          if detected == true
              break
          end
       end
       
   end
    if detected == true
        break
    end
end
last = [start(1) + tumor_r - 1, start(2) + tumor_c - 1];
if detected == true
    fprintf('The tumor is located between cords [%d,%d] and [%d,%d] starting from top left corner\n',...
        start(1), start(2), last(1), last(2))
    %% Task 3 Highlight the tumor

    avg_brightness = 0;
    for i = 1:tumor_r
        for j = 1:tumor_c
            avg_brightness = avg_brightness + double(tumor(i,j,1));
        end
    end
    avg_brightness = uint8(avg_brightness / (tumor_r * tumor_c));

    for n = 1:tumor_r
        for m = 1:tumor_c
            if (double(tumor(n,m,1))+double(tumor(n,m,2))+double(tumor(n,m,3)))/3 > avg_brightness
                mri_scan(n+start(1) - 1,m+start(2)-1,1) = tumor(n,m,1) * 1.25;
                mri_scan(n+start(1) - 1,m+start(2)-1,2) = tumor(n,m,2) * 1.25;
                mri_scan(n+start(1) - 1,m+start(2)-1,3) = tumor(n,m,3) * 0.50;
            end

        end
    end
    image(mri_scan);
else
    fprintf('Tumor cannot be found');
end