function [eigenvalue,kl,eigenvectors,project_invectors,le,leiji,tt]=kpca(x,getpercent,var,sign)
%kpca进行数据提取的函数
psize=size(x);
m=psize(1);
n=psize(2);
l=ones(m,m);
for i=1:m
    for j=1:m
       k(i,j)=kernel(x(i,:),x(j,:),sign,var); %计算核矩阵k
    end
end
kl=k-l*k/m-k*l/m+l*k*l/(m*m);  %计算kl
[v,e]=eig(kl); %求特征值和特征向量
e=diag(e);
v=v';    %此时每一行对应的是特征向量
%将特征向量单位正交化得到B
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

sign=[e B]; %将特征值和特征向量合并成一个矩阵 ，第一列为特征值，后面为对应的特征向量

[signsort,ix]=sort(sign,1,'descend');  %按照特征值由大到小排列矩阵
for i=1:m
    for j=2:m+1
        signsort(i,j)=sign(ix(i,1),j);  %将特征向量作适当调整与特征值对齐
    end
end
%save '..\\kpcaproject.m' signsort -ascii 
pp=sum(signsort(:,1)); %特征值总的和
for i=1:m
    le(i)=signsort(i,1)/pp; %特征值贡献率大小
end
leiji(1)=le(1);
for i=2:m     %计算累计贡献率
    leiji(i)=leiji(i-1)+le(i);   
end
tt=1;
for i=1:m
    if leiji(i)>=getpercent %提取主分量
        tt=i;        
        break;
    end
end
eigenvectors=signsort(1:tt,2:m+1)';  %求出提取出的主成分
if tt==1    
    project_invectors(1,:)=signsort(1,2:m+1)*kl;
    project_invectors(2,:)=ones(1,psize(1));
else    
   project_invectors=kl*eigenvectors;   %计算在特征空间向量上的投影 
end  
eigenvalue=signsort(:,1);
%end of the function




