% Reads Lena.jpg and Lena_noise.jpg.
% Computes MSE1, SNR1, PSNR1.

function Metrics = part1_metrics()

% Read images
A = imread('Lena.jpg');           % original
B = imread('Lena_noise.jpg');     % noisy

% Convert to double
A = double(A);
B = double(B);

[m,n] = size(A);

% Compute Metrics
[MSE1, SNR1, PSNR1] = compute_metrics(A, B);
save('part1_metrics.mat')

% Display results
fprintf("MSE1  = %.4f\n", MSE1);
fprintf("SNR1  = %.4f\n", SNR1);
fprintf("PSNR1 = %.4f\n", PSNR1);

end
