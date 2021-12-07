function  In = RemoveFogByWavelet(img, map)
% 用WaveletR实现图像去雾
% 输入参数：
%  img——图像矩阵
%  map——索引图
%  In——结果图像
% 使用haar对X进行尺度为2的分解
[c,s] = wavedec2(img,2,'haar');
sizec = size(c);
% 对分解系数进行处理以突出轮廓部分，弱化细节部分
tempsmall=0;
tempbig=0;
for i = 1:sizec(2)
    if(c(i) > 200)
        tempbig =tempbig+1;
        c(i) = 1.2 * c(i);
    else 
        tempsmall =tempsmall+1;
        c(i) = 1* c(i);
    end
end
% 从小波分解结构[c,s]进行尺度为1和2时的低频重构
a1 = wrcoef2('a',c,s,'haar',1); 
a2 = wrcoef2('a',c,s,'haar',2); 

% 从小波分解结构[c,s]在尺度为2时重构高频
% 'h' 是水平方向
% 'v' 是垂直方向
% 'd' 是对角方向
hd1 = wrcoef2('h',c,s,'haar',1); 
vd1 = wrcoef2('v',c,s,'haar',1); 
dd1 = wrcoef2('d',c,s,'haar',1);
hd2 = wrcoef2('h',c,s,'haar',2); 
vd2 = wrcoef2('v',c,s,'haar',2); 
dd2 = wrcoef2('d',c,s,'haar',2);
aa= 1.2;
bb= 0.5;
cc= 0.;
dd= 0.3;
limage=idwt2(aa*a1,bb*hd2,cc*vd2,dd*dd2,'haar');
figure;
subplot(1,2,1);
imshow(img);
colormap(map);
title('原始图像');
subplot(1,2,2)
output1 = uint8(limage);
In = output1;
imshow(output1);
colormap(map);
title('小波变换去雾图像')