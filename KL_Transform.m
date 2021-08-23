clear all
close all

I=imread('peppers_gray.bmp');
subplot(131)
imshow(I)
title('Original Image')
I=double(I)

% Compute KL Transform Matrix 
cov_I=I*I';
[v,d]=eig(cov_I);

%Compute KL Transform
f=v'*I*v;
subplot(132)
imshow(uint8(f))
title('KL Transform')

% Image Reconstruction
r_i=v*f*v';
subplot(133)
imshow(uint8(r_i))
title('Reconstructed Image')
