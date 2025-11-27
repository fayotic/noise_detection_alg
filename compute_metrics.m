function [MSE, SNR, PSNR] = compute_metrics(A, B)
% Computes MSE, SNR, PSNR between two grayscale images A and B.
% A = original image (double)
% B = processed image (double)

A = double(A);
B = double(B);
[m,n] = size(A);

% ---------- MSE ----------
    % MSE = (1 / N) * Σ (A(i,j) - B(i,j))^2
    % where:
    %     A(i,j) = pixel value from the original image
    %     B(i,j) = pixel value from the processed/noisy image
    %     N      = total number of pixels = (m * n)
    
    sum_diff = 0;
    for i = 1:m
        for j = 1:n
            diff = A(i,j) - B(i,j);
            sum_diff = sum_diff + diff * diff;
        end
    end
    MSE = sum_diff / (m*n);

% ---------- SNR ----------
    % SNR = 10 * log10( sigma_x^2 / sigma_d^2 )
    % where:
    %   sigma_x^2 = average square value of the original image A
    %   sigma_d^2 = MSE = average squared difference between A and B

    signal_sum = 0;
    for i = 1:m
        for j = 1:n
            signal_sum = signal_sum + A(i,j)^2;
        end
    end

    sigma_x2 = signal_sum / (m*n);   % average square of original
    sigma_d2 = MSE;                  % noise variance (MSE)

    SNR = 10 * log10(sigma_x2 / sigma_d2);

% ---------- PSNR ----------
    % PSNR = 10 * log10( X_peak^2 / MSE )
    % where:
    %     X_peak = maximum possible pixel value of the original image.
    %     MSE    = mean squared error between original and noisy images.
    
    Xpeak = max(A(:));    % find maximum pixel of original image
    PSNR = 10 * log10( (Xpeak^2) / MSE );

end
