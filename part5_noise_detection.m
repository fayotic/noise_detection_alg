% Implements a noise detection algorithm on Lena_noise.jpg
% Detects black (0) and white (255) pixels as salt-and-pepper noise
% Handles all pixels and records coordinates of detected noise
% Produces a visualization image highlighting noise pixels

function noiseReduc = Noise_Detection()
%Reads the image w/ noise
A = imread('Lena_noise.jpg');
%Size of image
[m,n] = size(A);
%Threshold that defines a significant value
threshold = 20;

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
        
% function will return coordinates
save("part5_noise_detection.mat")

%---------RETURN-----------------
%Returns the coordinates for part 6
noiseReduc = coords;
end
