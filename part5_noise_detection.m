% Implements a noise detection algorithm on Lena_noise.jpg
% Detects noisy pixels using a thresholded difference from the local median
% Handles all pixels and records coordinates of detected noise
% Produces a visualization image highlighting noise pixels

function noiseReduc = Noise_Detection()
%Reads the image w/ noise
A = imread('Lena_noise.jpg');
%Size of image
[m,n] = size(A);
%Threshold that defines a significant value
threshold = 30;

% ------ NOISE DETECTION ALG --------------------
coords = [];  % list of noisy pixel coordinates

%Nested for-loop that detects pixels for noise.
for i = 1:m
    for j = 1:n
        B = [];  % dynamic array to store neighbors

        % Loop over 3x3 neighborhood
        for u = -1:1
            for v = -1:1
                ni = i + u;
                nj = j + v;

                % Include only valid pixels
                if ni >= 1 && ni <= m && nj >= 1 && nj <= n && ~(u == 0 && v == 0)
                    B = [B, A(ni,nj)];
                end
            end
        end

        % Sort and pick the median
        B = sort(B);
        mid = ceil(length(B)/2);
        p_median = B(mid);

        %If the pixel is significantly different than neighbors, add to
        %coordinates
        if abs(double(A(i,j)) - double(p_median)) > threshold
            coords = [coords; i,j];
        end
    end
end

%----- NOISE VISUALIZATION --------
figure;
redBackground = ones(m,n,3) * 255; 
redBackground(:,:,2) = 0;  % Green channel = 0
redBackground(:,:,3) = 0;  % Blue channel = 0
redBackground = uint8(redBackground);

  % Place original pixel values at noise coordinates
for k = 1:size(coords,1)
    i = coords(k,1);
    j = coords(k,2);
    val = A(i,j);
    % Set all RGB channels to original grayscale value
    redBackground(i,j,1) = val;
    redBackground(i,j,2) = val;
    redBackground(i,j,3) = val;
end
    
% Display red background
imshow(redBackground);
% function will return coordinates
save("part5_noise_detection.mat");

%---------RETURN-----------------
%Returns the coordinates for part 6
noiseReduc = coords;
end
