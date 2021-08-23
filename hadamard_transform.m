clear all
close all

I=imread('peppers_gray.bmp');
subplot(131)
imshow(I)
title('Original Image')

%Compute hadamard matrix
dim=size(I)
n=log2(dim(1))
h1=[1 1;1 -1];
h=h1
for i=2:n
    h=[h h;h -h]
end
 f=(1/sqrt(2^n))*h

%Compute Hadamard transform
h_t=f*double(I)*f;
subplot(132)
imshow(uint8(h_t))
title('Hadamard Transform ')
 
%Image Reconstruction
r_i=f*h_t*f
subplot(133)
imshow(uint8(r_i),[])
title('Reconstructed Image')