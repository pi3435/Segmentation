I = imread('C:\Users\Yuan\Desktop\Study\Github\Segmentation\Regiongrowing\word.jpg');
Ird = im2double(rgb2gray(I));

[g, NR, SI, TI] = RegionGrowing(Ird,1,0.1);

figure(1);
subplot(2,2,1),imagesc(Ird);
subplot(2,2,2),imagesc(SI);
subplot(2,2,3),imagesc(TI);
subplot(2,2,4),imagesc(imreconstruct(SI,TI));
colormap('gray');