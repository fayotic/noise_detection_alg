% Implements the noise detection algorithm from part 4.
% Produces a binary mask Mask and saves Lena_detected_noise.jpg (mask * 255).
% Optionally returns parameters used (threshold T, method used).

function noiseReduc = Noise_Detection()

%Reads the image w/ noise
L = imread('Lena_noise.jpg');
%Size of image
[m,n] = size(L);
%Array where we will store the coordinates of the pixels identified as
%noise
coords = [];

%For loop that saves all the coordinates that contain the salt/pepper
%pixels

for i=1: m -1
    for j=1: n -1
        if(L(i,j) == 255 || L(i,j) == 0)
            coords = [coords; i, j];
        end
    end
end

%Turns every value that is not black or white to a medium gray
for i=1: m
    for j=1: n
        if(L(i,j) ~= 255 && L(i,j) ~= 0)
            L(i,j) = 128;
     
        end
    end
end
        
%disp(coords); (used for testing)
figure;
imshow(L) %shows all the noise of the image.