clear all
close all

I=imread('peppers_gray.bmp');
I=uint8(I)
subplot(131)
imshow(I)
title('Original Image')
dim=size(I)
N=dim(1)
n=log2(N)

%Compute the Slant Transform Matrix
S=1/sqrt(2)*[1 1; 1 -1];
a=1
for i=2:n
    b=1/sqrt(1+4*a^2)
    a=2*b*a
    if i==2
        %%
        % 
        % $$e^{\pi i} + 1 = 0$$
        % 
        % $$e^{\pi i} + 1 = 0$$
        % 
        % 
        S=(1/sqrt(2))*[[1 0; a b]  [1 0;-a b];
                       [0 1;-b a]  [0 -1;b,a]]*[S zeros(size(S));zeros(size(S)),S]
    else
        S=(1/sqrt(2))*[[1 0;a b]           [zeros(2,(2^i-4)/2)]  [1 0;-a b]            [zeros(2,(2^i-4)/2)];
                      [zeros((2^i-4)/2,2)] [eye((2^i-4)/2)]      [zeros((2^i-4)/2,2)] [eye((2^i-4)/2)];
                      [0 1;-b a]           [zeros(2,(2^i-4)/2)] [0 -1;b,a]           [zeros(2,(2^i-4)/2)];
                      [zeros((2^i-4)/2,2)] [eye((2^i-4)/2)]      [zeros((2^i-4)/2,2)] [-eye((2^i-4)/2)]      ]*[S zeros(size(S));zeros(size(S)),S]
    end
end

%Compute Slant transform
S_t=S*double(I)*S';
subplot(132)
imshow(uint8(S_t),[])
title('Slant Transform ')
 
%Image Reconstruction
r_i=S'*S_t*S
subplot(133)
imshow(r_i,[])
title('Reconstructed Image')