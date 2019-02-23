clc,clear  
npersons=40;%ѡȡ40���˵���  
global imgrow;  
global imgcol;  
imgrow=112;  
imgcol=92;  
  
disp('��ȡѵ������...')  
f_matrix=ReadFace(npersons,0);%��ȡѵ������  
nfaces=size(f_matrix,1);%��������������  
disp('.................................................')  
%��ά�ռ��ͼ����(nperson*5)*k�ľ���ÿ�д���һ�����ɷ�����ÿ����20ά����  
  
disp('ѵ������PCA������ȡ...')  
mA=mean(f_matrix);  
k=20;%��ά��20ά  
[pcaface,V]=fastPCA(f_matrix,k,mA);%���ɷַ�����������ȡ  
disp('.................................................')  
  
disp('��ʾ���ɷ���...')  
visualize(V)%��ʾ��������  
disp('.................................................')  
  
disp('ѵ���������ݹ淶��...')  
disp('.................................................')  
lowvec=min(pcaface);  
upvec=max(pcaface);  
scaledface = scaling( pcaface,lowvec,upvec);  
  
disp('SVM����ѵ��...')  
disp('.................................................')  
gamma=0.0078;  
c=128;  
multiSVMstruct=multiSVMtrain( scaledface,npersons,gamma,c);  
  
disp('��ȡ��������...')  
disp('.................................................')  
[testface,realclass]=ReadFace(npersons,1);  
  
disp('��������������ά...')  
disp('.................................................')  
m=size(testface,1);  
for i=1:m  
    testface(i,:)=testface(i,:)-mA;  
end  
pcatestface=testface*V;  
  
disp('�����������ݹ淶��...')  
disp('.................................................')  
scaledtestface = scaling( pcatestface,lowvec,upvec);  
  
disp('SVM��������...')  
disp('.................................................')  
class= multiSVM(scaledtestface,multiSVMstruct,npersons);  
  
accuracy=sum(class==realclass)/length(class);  
display(['��ȷ�ʣ�',num2str(accuracy)])  