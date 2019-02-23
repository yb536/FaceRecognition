function [eigenvalue,kl,eigenvectors,project_invectors,le,leiji,tt]=kpca(x,getpercent,var,sign)
%kpca����������ȡ�ĺ���
psize=size(x);
m=psize(1);
n=psize(2);
l=ones(m,m);
for i=1:m
    for j=1:m
       k(i,j)=kernel(x(i,:),x(j,:),sign,var); %����˾���k
    end
end
kl=k-l*k/m-k*l/m+l*k*l/(m*m);  %����kl
[v,e]=eig(kl); %������ֵ����������
e=diag(e);
v=v';    %��ʱÿһ�ж�Ӧ������������
%������������λ�������õ�B
B(1,:)=v(1,:);
for i=2:m  
   for j=1:i-1
        B(i,:)=v(i,:)-(sum(v(i,:).*B(j,:))/sum(B(j,:).*B(j,:)))*B(j,:);
    end
end

for i=1:m
    s=0;
    for j=1:m
       s=s+B(i,j)*B(i,j);
    end
    B(i,:)=B(i,:)/sqrt(s);
end

sign=[e B]; %������ֵ�����������ϲ���һ������ ����һ��Ϊ����ֵ������Ϊ��Ӧ����������

[signsort,ix]=sort(sign,1,'descend');  %��������ֵ�ɴ�С���о���
for i=1:m
    for j=2:m+1
        signsort(i,j)=sign(ix(i,1),j);  %�������������ʵ�����������ֵ����
    end
end
%save '..\\kpcaproject.m' signsort -ascii 
pp=sum(signsort(:,1)); %����ֵ�ܵĺ�
for i=1:m
    le(i)=signsort(i,1)/pp; %����ֵ�����ʴ�С
end
leiji(1)=le(1);
for i=2:m     %�����ۼƹ�����
    leiji(i)=leiji(i-1)+le(i);   
end
tt=1;
for i=1:m
    if leiji(i)>=getpercent %��ȡ������
        tt=i;        
        break;
    end
end
eigenvectors=signsort(1:tt,2:m+1)';  %�����ȡ�������ɷ�
if tt==1    
    project_invectors(1,:)=signsort(1,2:m+1)*kl;
    project_invectors(2,:)=ones(1,psize(1));
else    
   project_invectors=kl*eigenvectors;   %�����������ռ������ϵ�ͶӰ 
end  
eigenvalue=signsort(:,1);
%end of the function




