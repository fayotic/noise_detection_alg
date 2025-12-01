%Loads metrics from part1 and part6 (MSE1, MSE4, etc.).
% Computes differences and percent differences, fills Table 2 variables.
% Produces printed output and a small text file Table1_Table2.txt or results_summary.txt.

% Compute Metrics

%Loads variables from part 1 and part 6
load('part1_metrics.mat');
load('part6_apply_median_on_detected.mat');

%Calculates difference and difference percentage
MSEdiff = MSE1 - MSE4;
MSEpercent = MSEdiff/MSE1 * 100;

SNRdiff = SNR4 - SNR1;
SNRpercent = SNRdiff / SNR1 * 100;

PSNRdiff = PSNR4 - PSNR1;
PSNRpercent = PSNRdiff / PSNR1 * 100;

%Displays data
disp(MSEdiff)
disp(MSEpercent)
disp(SNRdiff)
disp(SNRpercent)
disp(PSNRdiff)
disp(PSNRpercent)