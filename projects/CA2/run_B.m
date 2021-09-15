%%%%% Section B %%%%%
% This m file is used to test your code for Section B
% Ensure that when you run this script file, the output images are generated and displayed correctly
%--- 1.
I = imread('test2.bmp');
[T, IT] = intermeans(I);
figure(1);
imshow(IT); % display image IT
output = T; % display the intermeans threshold
disp('T = ');
disp(T);

figure(2);
imhist(I); % use histogram to predict Iopt
title('histogram to predict Iopt');

%--- 2
% display the measured feature values
[P, A, C, xbar, ybar, phione] = features(IT)

%--- 3
Topt = 40;
Iopt = I >= Topt; % threshold J with Topt = 40
figure(3);
imshow(Iopt) % display image Iopt
disp('Topt = ');
disp(Topt);
% display the measured feature values
[P, A, C, xbar, ybar, phione] = features(Iopt)