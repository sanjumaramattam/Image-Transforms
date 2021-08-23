clear all
close all
I=imread('peppers_gray.bmp');
subplot(131)
imshow(I)
title('Original Image')
dim=size(I)
N=dim(1)
h=zeros(N,N);

%Compute Haar Matrix
for k=0:1:N-1
    if k>0
        p=fix(log2(k));
        q=mod(k,2^p)+1;
    end
   for z=0:1/N:(N-1)/N
       if(k==0)
           h(k+1,z*N+1)=1/sqrt(N);
       else           
           if z >=(q-1)/2^p && z<(q-0.5)/2^p
              h(k+1,z*N+1)=1/sqrt(N)*2^(p/2);
           elseif z >=(q-0.5)/2^p && z<(q)/2^p
              h(k+1,z*N+1)=1/sqrt(N)*-2^(p/2);
           else
              h(k+1,z*N+1)=0;
           end
       end
   end
   
end

%Compute Haar transform
h_t=h*double(I)*h';
subplot(132)
imshow(uint8(h_t))
title('Haar Transform ')
 
%Image Reconstruction
r_i=h'*h_t*h
subplot(133)
imshow(uint8(r_i),[])
title('Reconstructed Image')