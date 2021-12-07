
function In = RemoveFogByEqualization(I)

[~, ~, z] = size(I);

%转换为灰度图
if z>1
    I = rgb2gray(I);
end
In = histeq(I);
figure;
subplot(2, 2, 1); imshow(I); title('原图像', 'FontWeight', 'Bold');
subplot(2, 2, 2); imshow(In); title('直方图均衡化后的图像', 'FontWeight', 'Bold');
subplot(2, 2, 3); imhist(I); title('原灰度直方图', 'FontWeight', 'Bold');
subplot(2, 2, 4); imhist(In); title('直方图均衡化后的灰度直方图', 'FontWeight', 'Bold');
end
