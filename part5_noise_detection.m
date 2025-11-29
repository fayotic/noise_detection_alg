% Implements a noise detection algorithm on Lena_noise.jpg
% Detects black (0) and white (255) pixels as salt-and-pepper noise
% Handles all pixels and records coordinates of detected noise
% Produces a visualization image highlighting noise pixels

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

for i=1: m 
    for j=1: n 
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
