function visualize( B )  
%��ʾ���������任�ռ��еĻ�����������λ����������  
%���룺B����ÿ���Ǹ����ɷַ�������ʾ�ľ��ǵ�ά��ÿ������ɵ�ͼ��  
%     k�������ɷֵ�ά��  
global imgrow;  
global imgcol;  
figure  
img=zeros(imgrow,imgcol);  
for i=1:20  
    img(:)=B(:,i);  
    subplot(4,5,i);  
    imshow(img,[])  
end  
end  