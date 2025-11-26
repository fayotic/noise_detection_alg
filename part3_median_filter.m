% Implements a manual 3×3 median filter (use sort to find median).
% Writes Lena_median.jpg.
% Computes MSE3, SNR3, PSNR3.

function Imed = Median_Filter()

A = imread('Lena_noise.jpg');
A = double(A);
[m,n] = size(A);

I = zeros(m,n);

for i = 2:m-1
    for j = 2:n-1

        B = zeros(1,9);
        k = 1;
        for u = -1:1
            for v = -1:1
                B(k) = A(i+u, j+v);
                k = k + 1;
            end
        end

        B = sort(B);
        I(i,j) = B(5);

    end
end

Imed = uint8(I);
imwrite(Imed, 'Lena_median.jpg');

orig = imread('Lena.jpg');
[MSE3, SNR3, PSNR3] = compute_metrics(double(orig), double(Imed));

% Display results
fprintf("MSE3  = %.4f\n", MSE3);
fprintf("SNR3  = %.4f\n", SNR3);
fprintf("PSNR3 = %.4f\n", PSNR3);

end
