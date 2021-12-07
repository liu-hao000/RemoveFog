clc;
clear;
close all;

%% -----------图像去雾算法----------------
%% 加载图片
[img,map] = imread('5.jpg');
%% 去雾&&保存
De_img_Equalization = RemoveFogByEqualization(img);
imwrite(De_img_Equalization,'直方图均衡化.jpg'); 
De_img_Retinex = RemoveFogByRetinex(img,2);
imwrite(De_img_Retinex,'Retinex.jpg'); 
De_img_Wavelet = RemoveFogByWavelet(img,map);
imwrite(De_img_Wavelet,'小波变换.jpg'); 
