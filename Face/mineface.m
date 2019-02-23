
imgrow=112;imgcol=92;
global imgrow;
global imgcol;
f_matrix=zeros(20,imgrow*imgcol);
for i=1:20
    facepath=strcat('F:\MATLAB人脸识别\Face\facedata\s',num2str(i),'\1.pgm');
   % subplot(4,5,i);
   %imshow(facepath);
    img=imread(facepath);
    f_matrix(i,:)=img(:)';    
end

meanface=zeros(imgrow,imgcol);
%for i=1:92
%    meanrow=mean(f_matrix);  
 %   meancol=meanrow';
 %   meanface(:,i)=meancol((i-1)*112+1:i*112,1);
%end
meanface=reshape(mean(f_matrix),imgrow,imgcol);
imshow(meanface,[]);

 facepath1=strcat('F:\MATLAB人脸识别\Face\facedata\s1\1.pgm');
 face1=imread(facepath1);
 face1=double(face1);
 diff_face=(face1-meanface)./20;
 
 subplot(1,3,1);
 imshow(face1,[]);
 subplot(1,3,2);
 imshow(meanface,[]);
 subplot(1,3,3);
 imshow(diff_face,[]);
 


