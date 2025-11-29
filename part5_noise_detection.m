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
for i = 2:m -1
    for j = 2:n - 1

        %3 by 3 neighbors
        p_neighbors = [A(i-1,j-1), A(i-1,j), A(i-1,j+1), ...
                       A(i,j-1),             A(i,j+1), ...
                       A(i+1,j-1), A(i+1,j), A(i+1,j+1)];
        %Get the median of the neighbors for comparison
        p_median = median(p_neighbors);

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
