function  In = RemoveFogByWavelet(img, map)
% ��WaveletRʵ��ͼ��ȥ��
% ���������
%  img����ͼ�����
%  map��������ͼ
%  In�������ͼ��
% ʹ��haar��X���г߶�Ϊ2�ķֽ�
[c,s] = wavedec2(img,2,'haar');
sizec = size(c);
% �Էֽ�ϵ�����д�����ͻ���������֣�����ϸ�ڲ���
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
% ��С���ֽ�ṹ[c,s]���г߶�Ϊ1��2ʱ�ĵ�Ƶ�ع�
a1 = wrcoef2('a',c,s,'haar',1); 
a2 = wrcoef2('a',c,s,'haar',2); 

% ��С���ֽ�ṹ[c,s]�ڳ߶�Ϊ2ʱ�ع���Ƶ
% 'h' ��ˮƽ����
% 'v' �Ǵ�ֱ����
% 'd' �ǶԽǷ���
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
title('ԭʼͼ��');
subplot(1,2,2)
output1 = uint8(limage);
In = output1;
imshow(output1);
colormap(map);
title('С���任ȥ��ͼ��')