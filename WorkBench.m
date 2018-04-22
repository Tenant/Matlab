%% treasures
imaqfind
imaqhwinfo
bwarea(I1)/(size(I1,1)*size(I1,2))
%% read image and calculate Histogram
% image=imread('s3.jpg');
image=rgb2gray(image);
imhist(image)
figure
imshow(image)
%% to BW image
I7=im2bw(image,237/255); % 184 need to be changed
figure;imshow(I7)
%% get the Boundary
BW=edge(I3,'canny',0.1);
%% main function of the hand gesture recognition
clear all; clc; close all;
vid=videoinput('winvideo',1);
src = getselectedsource(vid);
figure(1);
pause(2);
IM1=getsnapshot(vid);IM1=ycbcr2rgb(IM1);IM1=rgb2gray(IM1);
figure(1);subplot(3,3,1);imshow(IM1);title('Background');
pause(2);                                                                
IM2=getsnapshot(vid);IM2=ycbcr2rgb(IM2);IM2=rgb2gray(IM2);                                                 
figure(1);subplot(3,3,2);imshow(IM2);title('Gesture');
IM3=IM2-IM1;
figure(1);subplot(3,3,3);imshow(IM3);title('Subtracted');
IM4=255-IM3;
figure(1);subplot(3,3,4);imshow(IM4);title('Inversed');

tic
lvl = graythresh(IM3);
IM3 = im2bw(IM3, lvl);                                                     
figure(1);subplot(3,3,5);imshow(IM3);title('Black&White')
IM3 = bwareaopen(IM3, 100);
IM3 = imfill(IM3,'holes');
% figure(1);subplot(3,3,6);imshow(IM3);title('Small Areas removed & Holes  Filled');
IM3 = imerode(IM3,strel('disk',5));                                       
IM3 = imdilate(IM3,strel('disk',5));                                       
IM3 = medfilt2(IM3, [3 3]);                                                 
% figure(1);subplot(3,3,7);imshow(IM3);title('Eroded,Dilated & Median  Filtered');  
IM3 = bwareaopen(IM3, 100); 
elapsedTime = toc;
figure(1);subplot(3,3,8);imshow(IM3);title('Processed');
IM3 = flipdim(IM3,1);                                                       
figure(1);subplot(3,3,9);imshow(IM3);title('Flip Image');

%% ¶ÏÖ¸ÐÞ¸´

 IM2=imdilate(IM2,strel('disk',10)); %%% this parameter can be tuned, the last is 10
 IM2=imerode(IM2,strel('disk',5));
  IM2=imdilate(IM2,strel('disk',5)); %%% this parameter can be tuned, the last is 10
 IM2=imerode(IM2,strel('disk',5));
  IM2 = bwareaopen(IM2, 1900);
imshow(IM2)
%%
IM3 = bwdist(~IM2); % IM3:Distance Transform Image
figure();
subplot(1,2,1); imshow(IM3);
IM3=imfill(IM3,'holes');
subplot(1,2,2); imshow(IM3);
%% delete this section
%  IM3=imerode(IM3,strel('disk',3)); %%% this parameter can be tuned, the last is 10
%  IM3=imdilate(IM3,strel('disk',10)); %%% this parameter can be tuned, the last is 10
%  IM3=imerode(IM3,strel('disk',5));
%   IM3=imdilate(IM3,strel('disk',5)); %%% this parameter can be tuned, the last is 10
%  IM3=imerode(IM3,strel('disk',5));
 imshow(IM3)
 %%
    % Threshold the EDT image at 110 since that's how wide the fingers are.
    IM4 = IM3 >16; % IM4: palm mask image , initial parameter: 30, 10, li: 15; 
    IM4=imfill(IM4,'holes');
    imshow(IM4)
    %%
    IM5 = IM1; % Initialize
    IM5(~IM4) = 0; % Erase everything outside the mask. IM5: maskedImage
imshow(IM5)
%
 IM6=im2bw(IM5,graythresh(IM5)); % masked binary Image
    IM6 = imdilate(IM6,strel('disk',10)); %%% this parameter can be tuned, 30
     IM6 = bwareaopen(IM6, 600);
    imshow(IM6);
    %
    REG=regionprops(IM6,'all');
    origin= REG(1).Centroid;
    %
    IM7=IM2-IM6; % IM7: finger binary Image, the last is IM2
    IM7=imerode(IM7,strel('disk',5)); %%% this parameter can be tuned, 10
    IM7=imdilate(IM7,strel('disk',5)); %%% this parameter can be tuned, 10
%      IM7=imerode(IM7,strel('disk',12));
    imshow(IM7);
    %
    IM7 = bwareaopen(IM7, 600); %%% this parameter can be tuned
    %
    REG=regionprops(IM7,'all');   
    [B, L, N, A] = bwboundaries(IM7,'noholes');
    
    for k=1:length(B)
        center=REG(k). Centroid;
        x(k)=center(1);
        y(k)=center(2);
    end
    
    % plot
    figure;subplot(1,2,1);imshow(IM);
    IM60=imerode(IM6,strel('disk',10)); %%% this parameter can be tuned
    IM8=IM60+IM7;
    X=bwlabel(IM8);
    RGB=label2rgb(X, @summer, 'k');
    subplot(1,2,2);imshow(RGB+1,'InitialMagnification','fit')
    hold on
    plot(origin(1),origin(2),'*');
    for k=1:length(B)
        plot(x(k),y(k),'*');
        line([x(k), origin(1)],[y(k), origin(2)]);
    end
    
    % calulate the eigenvalues
    eigen=zeros(2,5);
    for k=1:length(B)
        eigen(1,k)=x(k)-origin(1);
        eigen(2,k)=y(k)-origin(2);
    end
    %% 
    L = medfilt2(J,[5 5]);
    immorph
    [H,T,R] = hough(BW);
%%
clearvars;
m = 1000;
n = 2;
X = -2 + 4*rand([m, n]);
Y = 2*(sum(abs(X), 2) <= 1) - 1;
sigma = 1;
C = 1;
[ alpha, b ] = trainSVM( X, Y, C, sigma);
hold all
plot(X(Y>=0,1), X(Y>=0,2), '.');
plot(X(Y<0,1), X(Y<0,2), '.');
title('True targets');

%%
for ii=1:100
    ii
    result=svmClassify(kfun, sv, xdata(ii,:), alpha, bias,ScaleData,  KernelFunctionArgs)
    group{ii}
    fprintf('\n')
end
%%
subplot(3,3,1);
imshow(bgd0(:,:,1));
subplot(3,3,2);
imshow(bgd0(:,:,2));
subplot(3,3,3);
imshow(bgd0(:,:,3));
subplot(3,3,4);
imshow(im_in(:,:,1));
subplot(3,3,5);
imshow(im_in(:,:,2));
subplot(3,3,6);
imshow(im_in(:,:,3));
subplot(3,3,7);
contour(im_in(:,:,1)-bgd0(:,:,1));
subplot(3,3,8);
contour(im_in(:,:,2)-bgd0(:,:,2));
subplot(3,3,9);
contour(im_in(:,:,3)-bgd0(:,:,3));
%%
folder=fullfile(matlabroot, '\toolbox\images\imdemos');
movieFullFileName=fullfile(folder, 'rhinos.avi');
videoObject=VideoReader(movieFullFileName);
numberOfFrames=videoObject.NumberOfFrames;
vidHeight=videoObject.Height;
vidWidth=videoObject.Width;
numberOfFramesWritten=0;
figure;
[folder, baseFileName, extensions]=fileparts(movieFullFileName);
folder=pwd;
outputFolder=sprintf('%s/Movie Frames from %s', folder, baseFileName);
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end
%%

    