im = imread('test3.bmp');

[h, g] = imhist(im); %Where for a uint8 image im: D(1)=0 and D(end)=255. h is the height of the histogram
h = h.'; %Transpose of vector h
thres = round(mean2(im)); %Initial threshold value
thres_prev = NaN; %can change to thres_prev = Nan;

while thres_prev ~= thres
    thres_prev = thres;
    g_low = g(1):1:thres_prev; %Computing gray-levels for μ1 DLow = D(1):1:thres_prev should work as well
    mean_low = sum(g_low .* h(1:1:length(g_low))) / sum(h(1:1:length(g_low))); %Computing μ1
    g_high = thres_prev+1:1:g(end); %Computing gray-levels for μ2
    mean_high = sum(g_high .* h(length(g_low)+1:1:g(end)+1)) / sum(h(length(g_low)+1:1:g(end)+1)); %Computing μ2
    thres = floor((mean_low + mean_high) / 2); %Updating threshold value
end

thres_norm = (thres - g(1)) / (g(end) - g(1)); %Normalizing threshold value: N_x=(x−min)/(max−min)
Iout = im2bw(im, thres_norm);

%disp(thres);
%imshow(Iout);
%disp(Iout);

% Iout = bwperim(Iout, 8);
disp(Iout);
% Iout = [
%     0 0 0 0;
%     0 1 1 0;
%     0 1 1 0;
%     0 0 0 0;];
% 
% img = imfill(Iout);
% disp(img);
% % Get complement of image, with a border round it in case the
% % blob is at the boundary
% notimg = true(size(img)+2);
% notimg(2:end-1, 2:end-1) = ~img;
% disp(notimg);
% % Find locations where a non-zero pixel is adjacent to a zero pixel,
% % for each cardinal direction in turn
% topedges = img & notimg(1:end-2, 2:end-1);
% leftedges = img & notimg(2:end-1, 1:end-2);
% bottomedges = img & notimg(3:end, 2:end-1);
% rightedges = img & notimg(2:end-1, 3:end);
% % Sum each set of locations separately, then add to get total perimeter
% perim = sum(topedges(:)) + sum(leftedges(:)) + ...
%     + sum(bottomedges(:)) + sum(rightedges(:));
% % print result
% fprintf('Perimeter is %d\n', perim);


%tutorial testing
% Iout = [
%     1 1 0 0;
%     1 1 0 0;
%     1 1 0 0;
%     1 1 0 0;
%     1 1 1 1;
%     1 1 1 1];
% 
% 
% boundary_img = bwperim(Iout, 4);
% [m,n] = size(boundary_img); %6x4
% 
% count_horizontal = 0;
% count_vertical = 0;
% count_diagonal = 0;
% 
% for row = 1:m
%     for col = 1:n
%         pixel_1 = boundary_img(row, col);
%         if pixel_1 == 0
%             continue
%         end
%         
%         %check right pixel
%         if col ~= n
%             pixel_right = boundary_img(row, col+1);
%             if pixel_right == 1
%                 count_horizontal = count_horizontal + 1;
%             end
%         end
%         %check top right pixel
%         if row ~= 1 && col ~= n && boundary_img(row-1, col) == 0 && boundary_img(row, col+1) == 0
%             pixel_top_right = boundary_img(row-1, col+1);
%             if pixel_top_right == 1
%                 count_diagonal = count_diagonal + 1;
%             end
%         end
%         %check btm right pixel
%         if row ~= m && col ~= n && boundary_img(row+1, col) == 0 && boundary_img(row, col+1) == 0
%             pixel_btm_right = boundary_img(row+1, col+1);
%             if pixel_btm_right == 1
%                 count_diagonal = count_diagonal + 1;
%             end
%         end
%         %check btm pixel
%         if row ~= m
%             pixel_btm = boundary_img(row+1, col);
%             if pixel_btm == 1
%                 count_vertical = count_vertical + 1;
%             end
%         end
%     end
% end
% 
% 
% disp(count_horizontal);
% disp(count_vertical);
% disp(count_diagonal);
% P = count_horizontal + count_vertical + count_diagonal*sqrt(2);
% disp(P);
%Perimeter
% Iout_P4 = bwperim(Iout, 4);
% P = sum(Iout_P4(:));
% disp(P);

% 
% %Area
% A = sum(Iout(:));
% disp(A);
% 
% %Compactness
% C = P^2 / (4 * pi * A);
% disp(C);
% 
% 
% % stats = regionprops(Iout, 'Centroid');
% % disp(stats);
% 
% %Centroid
% [r, c] = size(Iout);
% m = zeros(r, c);
% B = flip(Iout);
% for i = 0:1 
%     for j = 0:1 
%         for y = 1:r 
%             for x = 1:c
%                 m(i+1, j+1) = m(i+1, j+1) + ((x-1)^i*(y-1)^j*B(y,x));
%             end
%         end
%     end
% end
% 
% xbar = m(2,1)/m(1,1);
% ybar = m(1,2)/m(1,1);
% 
% disp(xbar);
% disp(ybar);
% 
% %show centroid on plot
% % figure(1);
% % imshow(Iout);
% % hold;
% % plot(xbar, ybar, 'r*');
% % hold;
% 
% %first invariant moment
% u = [ 0 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0]; 
% for i = 0:3 
%     for j = 0:3 
%         for y = 1:r 
%             for x = 1:c 
%                 u(i+1, j+1) = u(i+1, j+1) + ((x-1-xbar)^i*(y-1-ybar)^j*B(y,x)); 
%             end
%         end
%     end
% end
% 
% n = [ 0 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0];
% for i=0:3 
%     for j=0:3 
%         n(i+1, j+1) = u(i+1, j+1) / (u(1,1)^(1+(i+j)/2)); 
%     end
% end
%  
% phione = n(3,1)+ n(1,3);
% 
% disp(phione);






