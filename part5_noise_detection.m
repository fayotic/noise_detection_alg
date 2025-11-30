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
threshold = 15;

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
                if ni >= 1 && ni <= m && nj >= 1 && nj <= n
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
        if abs(A(i,j) - p_median) > threshold
            coords = [coords; i,j];
        end
    end
end

%----- NOISE VISUALIZATION --------
        
%disp(coords); (used for testing)
figure;
imshow(A) %shows all the noise of the image.

noiseReduc = coords; % function will return coordinates

end
