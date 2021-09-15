%To compute the features
%input is the binary thresholded image
%outputs are the feature values
function [P, A, C, xbar, ybar, phione] = features(Iin)

biggest_Iin = bwareafilt(Iin, 1); %filter to get the largest boundary

%find area
struct_A = regionprops(biggest_Iin, 'Area');
A = struct_A.Area;

%find perimeter
struct_P = regionprops(biggest_Iin, 'Perimeter');
P = struct_P.Perimeter;

%find compactness
C = P^2 / (4 * pi * A);

%find centroid
[r, c] = size(Iin);
m = zeros(r, c);
B = flip(Iin); %flip matrix to make sure origin follow xy plane
for i = 0:1 
    for j = 0:1 
        for y = 1:r 
            for x = 1:c
                m(i+1, j+1) = m(i+1, j+1) + ((x-1)^i*(y-1)^j*B(y,x));
            end
        end
    end
end
xbar = m(2,1)/m(1,1);
ybar = m(1,2)/m(1,1);

%first invariant moment
u = [ 0 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0]; 
for i = 0:3 
    for j = 0:3 
        for y = 1:r 
            for x = 1:c 
                u(i+1, j+1) = u(i+1, j+1) + ((x-1-xbar)^i*(y-1-ybar)^j*B(y,x)); 
            end
        end
    end
end

n = [ 0 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0];
for i=0:3 
    for j=0:3 
        n(i+1, j+1) = u(i+1, j+1) / (u(1,1)^(1+(i+j)/2)); 
    end
end

phione = n(3,1)+ n(1,3); %n20 + n02

end

