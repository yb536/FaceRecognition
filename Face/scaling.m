function [ scaledface] = scaling( faceMat,lowvec,upvec )  
%�������ݹ淶��  
%���ǽ�ͬһ�������еĲ�ͬά�ȹ�һ��
%��Ϊ��Ϊ���ڲ�ͬ�����ԣ��������һ���ǲ����бȽ��Եģ����߲���һ��������
%���롪��faceMat��Ҫ���й淶����ͼ�����ݣ�  
%                lowvecԭ��ͼ�������е���Сֵ  
%                upvecԭ��ͼ�������е����ֵ  
upnew=1;  
lownew=-1;  
[m,n]=size(faceMat);  
scaledface=zeros(m,n);  
for i=1:m  
    scaledface(i,:)=lownew+(faceMat(i,:)-lowvec)./(upvec-lowvec)*(upnew-lownew);  
    %��ͼ��������һ�������Ĳ�ͬά�ȵ�ֵ����Сֵ�����ֵ�淶��-1��1������ֵ�������淶����-1,1��
end  
end 