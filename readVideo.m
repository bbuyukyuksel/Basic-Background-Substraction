v = VideoReader('vtest.avi');
video = read(v,[1 20]);

[x,y,ch,f] = size(video);

for i=1:1:f
   figure(1);
   imshow(video(:,:,:,i));
   
end

temp_channel = zeros(3,f);
temp = zeros(x,y,ch);

for i=1:1:x
    for j=1:1:y
        for k=1:1:f
            temp_channel(1,k) = video(i,j,1,k);
            temp_channel(2,k) = video(i,j,2,k);
            temp_channel(3,k) = video(i,j,3,k);
        end
        R = mode(temp_channel(1,:));
        G = mode(temp_channel(2,:));
        B = mode(temp_channel(3,:));
%         R = floor(sum(temp_channel(1,:)) / f);
%         G = floor(sum(temp_channel(2,:)) / f);
%         B = floor(sum(temp_channel(3,:)) / f);
        
        temp(i,j,1) = R; 
        temp(i,j,2) = G; 
        temp(i,j,3) = B; 
    end
end
temp = uint8(temp);
imwrite(temp,'background.bmp');
imwrite(video(:,:,:,1),'frame1.bmp');

figure(1);
imshow(temp);



