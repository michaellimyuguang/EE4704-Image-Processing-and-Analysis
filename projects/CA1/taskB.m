%q1 & q2
%load image test2 and obtain the fourier spectrum
test2 = imread('test2.bmp');

fft2_test2 = fft2(test2);
fftshift_test2 = fftshift(abs(fft2_test2));
Y = uint8(255 / log10(double(1 + max(fftshift_test2(:)))) * log10(double(1 + fftshift_test2)));

figure(1);
imshow(Y);
title('test2');
%% 

%q3
%add gaussian noise sigma = 10 to test2, giving test2a
test2a = imnoise(test2, 'gaussian', 0, (10^2)/(256^2));

fft2_test2a = fft2(test2a);
fftshift_test2a = fftshift(abs(fft2_test2a));
X = uint8(255 / log10(double(1 + max(fftshift_test2a(:)))) * log10(double(1 + fftshift_test2a)));

figure(2);
imshow(X);
title('test2a');

figure(3);
imshow(test2a);
title('test2a before fourier spectrum');

