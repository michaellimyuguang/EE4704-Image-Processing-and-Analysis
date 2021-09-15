%%%%% Section A %%%%%
% This m file is used to test your code for Section A
% Ensure that when you run this script file, the output images are generated and displayed correctly
%--- 1. Display the thresholded image and the threshold
I = imread('test1.bmp');
[T, IT] = intermeans(I);
imshow(IT); % display image IT
output = T; % display the intermeans threshold
disp('T = ');
disp(T);

%--- 2. Display the measured feature values
[P, A, C, xbar, ybar, phione] = features(IT)