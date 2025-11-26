% Implements a manual 3×3 average filter (replicate borders recommended).
% Writes Lena_average.jpg.
% Computes MSE2, SNR2, PSNR2 (can call helper in part1_metrics.m or return values).

function Iavg = Average_Filter()

A = imread('Lena_noise.jpg');
A = double(A);
[m,n] = size(A);

I = zeros(m,n);

for i = 2:m-1
    for j = 2:n-1
        s = 0;
        for u = -1:1
            for v = -1:1
                s = s + A(i+u, j+v);
            end
        end
        I(i,j) = round(s / 9.0);
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

