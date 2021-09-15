%To calculate the intermeans threshold;
%input is the gray level image test1 .
%output is the threshold value T and the binary thresholded image Iout.

function [T ,Iout] = intermeans(Iin)

[h, g] = imhist(Iin);
h = h.';
T = round(mean2(Iin)); %initial threshold value
T_prev = NaN;

while T_prev ~= T
    T_prev = T;
    g_low = g(1):1:T_prev; 
    mean_low = sum(g_low .* h(1:1:length(g_low))) / sum(h(1:1:length(g_low))); %u1
    
    g_high = T_prev+1:1:g(end);
    mean_high = sum(g_high .* h(length(g_low)+1:1:g(end)+1)) / sum(h(length(g_low)+1:1:g(end)+1)); %u2
    T = floor((mean_low + mean_high) / 2); %update threshold
end

T_norm = (T - g(1)) / (g(end) - g(1)); %normalize threshold for im2bw
Iout = im2bw(Iin, T_norm);

end

