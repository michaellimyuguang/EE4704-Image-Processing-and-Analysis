%To compute the r-theta plot
%input is a boundary image 'test3.bmp'
%output is the array containing the rtheta value
function [r, theta] = rtheta(Iin)

Iin = im2bw(Iin);
[rows, cols] = size(Iin);
m = zeros(rows, cols);
B = flip(Iin); %flip matrix to make sure origin follow xy plane
for i = 0:1 
    for j = 0:1 
        for y = 1:rows 
            for x = 1:cols
                m(i+1, j+1) = m(i+1, j+1) + ((x-1)^i*(y-1)^j*B(y,x));
            end
        end
    end
end
xbar = m(2,1)/m(1,1);
ybar = m(1,2)/m(1,1);
radius = []; %store the radius
theta = []; %store the theta
for y = 1:rows
    for x = 1:cols
        if B(y,x) == 1
            temp_radius = sqrt((x - 1 - xbar) ^ 2 + (y - 1 - ybar) ^ 2);
            temp_theta = atan2d(y - 1 - ybar, x - 1 - xbar) + (360 *((y - 1 - ybar) < 0)); %if y-axis is negative value, add 360 to make it positive
            radius(end+1) = temp_radius;
            theta(end+1) = temp_theta;
        end
    end
end
r = radius;
end



