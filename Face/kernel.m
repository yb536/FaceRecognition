function k=kernel(x,y,i,var);
%����˺���
if i==1
   k=exp((-norm(x-y)^2)/(2*var^2));  %i=1ʱ��ʹ�ø�˹��
end
if i==2
   k=(sum(x.*y)+1)^var;  %i=1ʱ��ʹ��2�׶���ʽ��
end