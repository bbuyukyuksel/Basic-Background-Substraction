clc; close all; clear
% Frame = imread('frame1.bmp');
Background = imread('background.bmp');
Test = imread('test.jpg');  

v = VideoReader('vtest.avi');
video = read(v,[1 Inf]);
[x,y,ch,f] = size(video);

kernel = ones(7);
Test_ = zeros(x,y,3);

pause();
for i=1:1:f
    Frame = video(:,:,:,i);
    diff = Background - Frame;
    temp = diff > 90;
    temp = (temp(:,:,1) == 1 | temp(:,:,2) == 1 | temp(:,:,3) == 1);
    temp = imclose(temp,kernel);
    temp = imclose(temp,kernel);
    temp_renk = (temp == 0);
   
    Test_(:,:,1) = Test(:,:,1) .* uint8(temp_renk);
    Test_(:,:,2) = Test(:,:,2) .* uint8(temp_renk);
    Test_(:,:,3) = Test(:,:,3) .* uint8(temp_renk);
    Test_ = uint8(Test_);

    newFrame = uint8(temp) .* Frame; 
    figure(1);
    imshow(Frame);
    figure(2);
    newFrame(:,:,2) = newFrame(:,:,2) + uint8(temp_renk); 
    imshow(newFrame + Test_);

    %figure(3);
    %imshow(temp);
end


