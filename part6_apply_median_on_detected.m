% Implements a manual 3x3 median filter on Lena_noise.jpg
% Detects noisy pixels (exact black or white) and applies the median filter only on those pixels
% Handles all pixels including edges/corners by using only existing neighbors
% Writes Lena_medianfilter_detectednoise.jpg
% Computes and displays MSE, SNR, and PSNR for the filtered image

function Imed_noise = Median_Filter_DetectedNoise()

% Read noisy image
A = double(imread('Lena_noise.jpg'));
[m,n] = size(A);

% Detect noise using algorithm
coords = [];  % list of noisy pixel coordinates
for i = 1:m
    for j = 1:n
        if A(i,j) == 0 || A(i,j) == 255   % only exact black/white
            coords = [coords; i,j];
        end
    end
end

% Apply median filter only on detected noise pixels
I = A;   % initialize output image as original

for k = 1:size(coords,1)
    % Coordinates of noise pixel
    i = coords(k,1);
    j = coords(k,2);

    B = [];

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
    I(i,j) = B(mid);   % replace noisy pixel with median
end

% Save and compute metrics
Imed_noise = uint8(I);
imwrite(Imed_noise, 'Lena_medianfilter_detectednoise.jpg');

% Compute metrics
orig = double(imread('Lena.jpg'));
[MSE4, SNR4, PSNR4] = compute_metrics(orig, double(Imed_noise));

% Display results
fprintf("MSE4  = %.4f\n", MSE4);
fprintf("SNR4  = %.4f\n", SNR4);
fprintf("PSNR4 = %.4f\n", PSNR4);

end
