clc;
clear;
close all;

%% -----------ͼ��ȥ���㷨----------------
%% ����ͼƬ
[img,map] = imread('5.jpg');
%% ȥ��&&����
De_img_Equalization = RemoveFogByEqualization(img);
imwrite(De_img_Equalization,'ֱ��ͼ���⻯.jpg'); 
De_img_Retinex = RemoveFogByRetinex(img,2);
imwrite(De_img_Retinex,'Retinex.jpg'); 
De_img_Wavelet = RemoveFogByWavelet(img,map);
imwrite(De_img_Wavelet,'С���任.jpg'); 
