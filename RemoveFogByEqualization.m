
function In = RemoveFogByEqualization(I)

[~, ~, z] = size(I);

%ת��Ϊ�Ҷ�ͼ
if z>1
    I = rgb2gray(I);
end
In = histeq(I);
figure;
subplot(2, 2, 1); imshow(I); title('ԭͼ��', 'FontWeight', 'Bold');
subplot(2, 2, 2); imshow(In); title('ֱ��ͼ���⻯���ͼ��', 'FontWeight', 'Bold');
subplot(2, 2, 3); imhist(I); title('ԭ�Ҷ�ֱ��ͼ', 'FontWeight', 'Bold');
subplot(2, 2, 4); imhist(In); title('ֱ��ͼ���⻯��ĻҶ�ֱ��ͼ', 'FontWeight', 'Bold');
end
