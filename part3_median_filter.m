function Imed = Median_Filter()
% Implements a manual 3x3 median filter on Lena_noise.jpg
% Handles all pixels including edges/corners by using only existing neighbors
% Writes Lena_median.jpg

A = imread('Lena_noise.jpg');       % read noisy image
A = double(A);
[m,n] = size(A);

I = zeros(m,n);                     % output image

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
        I(i,j) = B(mid);
    end
end

Imed = uint8(I);
imwrite(Imed, 'Lena_median.jpg');

% Compute metrics
orig = imread('Lena.jpg');
[MSE3, SNR3, PSNR3] = compute_metrics(double(orig), double(Imed));

% Display results
fprintf("MSE3  = %.4f\n", MSE3);
fprintf("SNR3  = %.4f\n", SNR3);
fprintf("PSNR3 = %.4f\n", PSNR3);

end
