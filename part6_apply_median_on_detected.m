% Implements a manual 3x3 median filter on Lena_noise.jpg
% Detects noisy pixels (exact black or white) and applies the median filter only on those pixels
% Handles all pixels including edges/corners by using only existing neighbors
% Writes Lena_medianfilter_detectednoise.jpg
% Computes and displays MSE, SNR, and PSNR for the filtered image

function Imed_noise = Median_Filter_DetectedNoise()

load("part5_noise_detection.mat", "coords");
% Read noisy image
A = double(imread('Lena_noise.jpg'));
[m,n] = size(A);

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
imshow('Lena_medianfilter_detectednoise.jpg');

% Compute metrics
orig = double(imread('Lena.jpg'));
[MSE4, SNR4, PSNR4] = compute_metrics(orig, double(Imed_noise));

%Save variables from file to .mat file
save('part6_apply_median_on_detected.mat')

% Display results
fprintf("MSE4  = %.4f\n", MSE4);
fprintf("SNR4  = %.4f\n", SNR4);
fprintf("PSNR4 = %.4f\n", PSNR4);


end
