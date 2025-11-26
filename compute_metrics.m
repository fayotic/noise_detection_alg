function [MSE, SNR, PSNR] = compute_metrics(A, B)
//  Computes MSE, SNR, PSNR between two grayscale images A and B.
//  A = original image (double)
//  B = processed image (double)

A = double(A);
B = double(B);
[m,n] = size(A);

//  ---------- MSE ----------
    // MSE = 1 / (m * n) * (sum_diff A(i,j) - B(i,j)^2)
    sum_diff = 0;
    for i = 1:m
        for j = 1:n
            diff = A(i,j) - B(i,j);
            sum_diff = sum_diff + diff * diff;
        end
    end
    MSE1 = sum_diff / (m*n);

    //  ---------- SNR ----------
    // SNR = signal_sum (A(i,j))^2 / noise_sum  A(i,j) - B(i,j)^2)
    signal_sum = 0;
    noise_sum  = 0;

    for i = 1:m
        for j = 1:n
            signal_sum = signal_sum + A(i,j)^2;
            noise_sum  = noise_sum + (A(i,j) - B(i,j))^2;
        end
    end

    SNR1 = signal_sum / noise_sum;

    // ---------- PSNR ----------
    // PSNR = 10 * log10 (255^2 / MSE)
    
    PSNR1 = 10 * log10( (255^2) / MSE1 );

end
