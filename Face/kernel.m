function k=kernel(x,y,i,var);
%定义核函数
if i==1
   k=exp((-norm(x-y)^2)/(2*var^2));  %i=1时，使用高斯核
end
if i==2
   k=(sum(x.*y)+1)^var;  %i=1时，使用2阶多项式核
end