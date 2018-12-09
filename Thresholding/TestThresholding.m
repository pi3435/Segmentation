%Upload image;
Ir = imread('C:\Users\Yuan\Desktop\Study\Github\Segmentation\Thresholding\word.jpg');
Ird = im2double(rgb2gray(Ir));

%FindThresholding;
T = FindGlobalThresholding(Ird,0.0001);

[row,col] = size(Ird);
Ird_n = zeros(row,col);


for i = 1:1:row
    for j = 1:1:col
        if Ird(i,j) >= T
            Ird_n(i,j) = 1;
        else
            Ird_n(i,j) = 0;
        end
    end
end

Ird_nd = imdilate(Ird_n,[1 1 1;1 1 1; 1 1 1]);
Ird_ne = imerode(Ird_nd,[1 1 1;1 1 1; 1 1 1]);

figure(1);
subplot(2,2,1),imagesc(Ird);
subplot(2,2,2),imagesc(Ird_n);
subplot(2,2,3),imagesc(Ird_nd);
subplot(2,2,4),imagesc(Ird_ne);
colormap('gray');
