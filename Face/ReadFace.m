function [f_matrix,realclass]=ReadFace(n_persons,flag)
%ORL�����⡣pgm��ʽ��ͼƬ��40�ˣ�ÿ��10��ͼ��ͼ���СΪ112*92���ء�
%ÿ������10����Ƭ��ǰ5������ѵ��������5���������Լ�
%
%�������flag:
%   flag��һ����ʶ����
%   ��flagΪ0ʱ����ʾ����Ϊѵ������flagΪ1ʱ����ʾ����Ϊ���Լ�
%
%�������n_persons��
%   n_persons��־������Ҫʶ�����������
%
%�������realclass��
%   realclass��һ��n_person*5�У�1�е���������
%   realclass�������ݵı�ǩ������ѵ�������Լ��������˱�ǩ����
%
%�������f_matrix:
%   f_matrix��һ��n_person*5�У�112*92�еľ���
%   ÿһ�б���ÿһ��ͼƬ�ĻҶ�����
%   ��ÿһ��ͼƬ�������ų�һ����������ת�õõ�����f_matrix���е���

imgrow=112;imgcol=92;
global imgrow;   %����ͼƬ����
global imgcol;    %����ͼƬ����
realclass=zeros(n_persons*5,1);
f_matrix=zeros(n_persons*5,imgrow*imgcol);
for i=1:n_persons
    %·������
    %����num2str(i)˵����������ת��Ϊ�ַ�
    facepath=strcat('F:\MATLAB����ʶ��\Face\facedata\s',num2str(i),'\');  %·����ͬ�������
    cachepath=facepath;
    for j=1:5
        facepath=cachepath;
        if flag==0
            %����strcat(a,b,...)˵��:�������ַ�a,b...���ӳɵ����ַ�
            facepath=strcat(facepath,num2str(j));
        else
            facepath=strcat(facepath,num2str(j+5));
        end
        realclass((i-1)*5+j)=i;
        facepath=strcat(facepath,'.pgm');
        %����imread˵������ȡ����·����ͼƬ����ÿ�����ػҶ�ֵ����������ľ�����
        img=imread(facepath);
        f_matrix((i-1)*5+j,:)=img(:)';
    end
end
end