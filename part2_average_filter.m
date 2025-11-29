% Implements a manual 3x3 average filter on Lena_noise.jpg
% Handles all pixels including edges/corners by averaging only existing neighbors
% Writes Lena_average.jpg
% Computes and displays MSE, SNR, and PSNR for the filtered image

function Iavg = Average_Filter()

A = imread('Lena_noise.jpg');    % read noisy image
A = double(A);
[m,n] = size(A);

I = zeros(m,n);                  % output image

for i = 1:m
    for j = 1:n
        s = 0;     % sum of neighborhood
        count = 0; % number of pixels included

        % Loop over 3x3 neighborhood
        for u = -1:1
            for v = -1:1
                ni = i + u;
                nj = j + v;

                % Include only valid pixels
                if ni >= 1 && ni <= m && nj >= 1 && nj <= n
                    s = s + A(ni,nj);
                    count = count + 1;
                end
            end
        end

        I(i,j) = round(s / count);   % average of available neighbors
    end
end

Iavg = uint8(I);
imwrite(Iavg, 'Lena_average.jpg');

% Compute metrics
orig = imread('Lena.jpg');
[MSE2, SNR2, PSNR2] = compute_metrics(double(orig), double(Iavg));

% Display results
fprintf("MSE2  = %.4f\n", MSE2);
fprintf("SNR2  = %.4f\n", SNR2);
fprintf("PSNR2 = %.4f\n", PSNR2);

end