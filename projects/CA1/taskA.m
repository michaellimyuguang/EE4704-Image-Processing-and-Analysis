%testing dataset
% A = [1 2 3; 4 2 6];
% 
% disp(A);
% histogram(A);

%q1
test1 = imread('test1.bmp');
%examine image test1 and its histogram
%disp(test1);

figure(1); %figure(n) finds a figure in which the Number property is equal to n, and makes it the current figure.
imshow(test1); %show the image in matlab
title('test1 image'); 

figure(2);
imhist(test1); %plot the histogram of the image
title('test1 histogram');

imtool(test1);
%% 

%q2(a)
%add gaussian noise sigma = 15 to test1 giving image test1a
test1a = imnoise(test1, 'gaussian', 0, (15^2)/(256^2)); %the variance must be normalized between [0 1]

figure(3);
imshow(test1a);
title('test1a image');

figure(4);
imhist(test1a);
title('test1a histogram');

[peaksnr_test1a, snr_test1a] = psnr(test1a, test1);
disp("SNR value of test1a:");
disp(snr_test1a);
%% 

%q2(b)
%add salt-and-pepper noise of probability (density) = 0.05 to test1 giving test1b
test1b = imnoise(test1, 'salt & pepper'); %the default noise density is 0.05

figure(5);
imshow(test1b);
title('test1b image');

figure(6);
imhist(test1b);
title('test1b histogram');

[peaksnr_test1b, snr_test1b] = psnr(test1b, test1);
disp("SNR value of test1b:");
disp(snr_test1b);

%% 

%q3(a)
%apply mean filter with 3x3 window
mean_3_filter = fspecial('average', 3); %create a 3x3 mean filter
mean_3_test1a = imfilter(test1a, mean_3_filter);

figure(7);
imshow(mean_3_test1a);
title('test1a image with 3x3 mean filter applied');

[peaksnr_mean_3_test1a, snr_mean_3_test1a] = psnr(mean_3_test1a, test1);
disp("SNR value of test1a with 3x3 mean filter applied:");
disp(snr_mean_3_test1a);

%apply mean filter with 7x7 window
mean_7_filter = fspecial('average', 7); %create a 7x7 mean filter
mean_7_test1a = imfilter(test1a, mean_7_filter);

figure(8);
imshow(mean_7_test1a);
title('test1a image with 7x7 mean filter applied');

[peaksnr_mean_7_test1a, snr_mean_7_test1a] = psnr(mean_7_test1a, test1);
disp("SNR value of test1a with 7x7 mean filter applied:");
disp(snr_mean_7_test1a);

x = [0 size(test1a, 2)];
y = [size(test1a,1)/2 size(test1a,1)/2];
a = improfile(mean_3_test1a, x, y);
b = improfile(mean_7_test1a, x, y);

figure(9)
subplot(2,2,1);
imshow(mean_3_test1a);
hold on;
plot(x,y,'r');

subplot(2,2,2);
imshow(mean_7_test1a);
hold on;
plot(x,y,'r');

subplot(2,2,3);
plot(a(:,1,1),'b');
hold on;

subplot(2,2,4);
plot(b(:,1,1),'b');


%% 

%q3(b)
%apply median filter with 3x3 window
median_3_test1a = medfilt2(test1a, [3 3]);

figure(10);
imshow(median_3_test1a);
title('test1a image with 3x3 median filter applied');

[peaksnr_median_3_test1a, snr_median_3_test1a] = psnr(median_3_test1a, test1);
disp("SNR value of test1a with 3x3 median filter applied:");
disp(snr_median_3_test1a);

%apply median filter with 7x7 window
median_7_test1a = medfilt2(test1a, [7 7]);

figure(11);
imshow(median_7_test1a);
title('test1a image with 7x7 median filter applied');

[peaksnr_median_7_test1a, snr_median_7_test1a] = psnr(median_7_test1a, test1);
disp("SNR value of test1a with 7x7 median filter applied:");
disp(snr_median_7_test1a);



%% 

%q4(a)
%apply mean filter with 3x3 window
mean_3_filter = fspecial('average', 3); %create a 3x3 mean filter
mean_3_test1b = imfilter(test1b, mean_3_filter);

figure(12);
imshow(mean_3_test1b);
title('test1b image with 3x3 mean filter applied');

[peaksnr_mean_3_test1b, snr_mean_3_test1b] = psnr(mean_3_test1b, test1);
disp("SNR value of test1b with 3x3 mean filter applied:");
disp(snr_mean_3_test1b);

%apply mean filter with 7x7 window
mean_7_filter = fspecial('average', 7); %create a 7x7 mean filter
mean_7_test1b = imfilter(test1b, mean_7_filter);

figure(13);
imshow(mean_7_test1b);
title('test1b image with 7x7 mean filter applied');

[peaksnr_mean_7_test1b, snr_mean_7_test1b] = psnr(mean_7_test1b, test1);
disp("SNR value of test1b with 7x7 mean filter applied:");
disp(snr_mean_7_test1b);

x = [0 size(test1b, 2)];
y = [size(test1b,1)/2 size(test1b,1)/2];
a = improfile(mean_3_test1b, x, y);
b = improfile(mean_7_test1b, x, y);

figure(14);
subplot(2,2,1);
imshow(mean_3_test1b);
hold on;
plot(x,y,'r');

subplot(2,2,2);
imshow(mean_7_test1b);
hold on;
plot(x,y,'r');

subplot(2,2,3);
plot(a(:,1,1),'b');
hold on;

subplot(2,2,4);
plot(b(:,1,1),'b');


%% 

%q4(b)
%apply median filter with 3x3 window
median_3_test1b = medfilt2(test1b, [3 3]);

figure(15);
imshow(median_3_test1b);
title('test1b image with 3x3 median filter applied');

[peaksnr_median_3_test1b, snr_median_3_test1b] = psnr(median_3_test1b, test1);
disp("SNR value of test1b with 3x3 median filter applied:");
disp(snr_median_3_test1b);

%apply median filter with 7x7 window
median_7_test1b = medfilt2(test1b, [7 7]);

figure(16);
imshow(median_7_test1b);
title('test1b image with 7x7 median filter applied');

[peaksnr_median_7_test1b, snr_median_7_test1b] = psnr(median_7_test1b, test1);
disp("SNR value of test1b with 7x7 median filter applied:");
disp(snr_median_7_test1b);


