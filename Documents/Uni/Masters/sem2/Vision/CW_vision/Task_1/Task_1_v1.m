%% Clear and load
clc
clear 
close all

cwd = pwd;
files_jpg = dir(fullfile(cwd, '*.jpg'));

if(isempty(files_jpg))
    files_zip = dir(fullfile(cwd, '*.zip'));
    unzip(files_zip.name)
    files_jpg = dir(fullfile(cwd, '*.jpg'));
end

i=5;
Img = imread(files_jpg(i).name);

%% Task1.1
Img_gry = rgb2gray(Img);
Img_R = Img(:,:,1); [rcount,rvalues]=imhist(Img_R);
Img_G = Img(:,:,2); [gcount,gvalues]=imhist(Img_G);
Img_B = Img(:,:,3); [bcount,bvalues]=imhist(Img_B);
tcount=bcount+gcount+rcount;

figure(1)
subplot(3,3,2),imshow(Img),  title("Original image")
subplot(3,3,4),imshow(Img_R),title("Red Channel")
subplot(3,3,5),imshow(Img_G),title("Green Channel")
subplot(3,3,6),imshow(Img_B),title("Blue Channel")
subplot(3,3,7),bar(rvalues, rcount);
subplot(3,3,8),bar(gvalues, gcount);
subplot(3,3,9),bar(bvalues, bcount);

figure(2)
x = 0:255; % Assuming you want to plot histogram bins from 0 to 255
area(x, tcount, 'FaceColor', 'y', 'FaceAlpha', 0.07, 'EdgeColor', 'y', 'LineWidth', 1.5);
hold on
area(x, gcount, 'FaceColor', 'g', 'FaceAlpha', 0.07, 'EdgeColor', 'g', 'LineWidth', 1.5);
area(x, bcount, 'FaceColor', 'b', 'FaceAlpha', 0.07, 'EdgeColor', 'b', 'LineWidth', 1.5);
area(x, rcount, 'FaceColor', 'r', 'FaceAlpha', 0.07, 'EdgeColor', 'r', 'LineWidth', 1.5);
title("RGB image histogram")
xlabel("Intensity")
ylabel("Number of pixels")
xlim([1, 255]);

%% Task1.2

Jr = histeq(Img_R);
Jg = histeq(Img_G);
Jb = histeq(Img_B);
Jgry = histeq(Img_gry);

figure(4)
subplot(2,2,1)
imshowpair(Img_R,Jr,'montage')
axis off
subplot(2,2,2)
imshowpair(Img_G,Jg,'montage')
axis off
subplot(2,2,3)
imshowpair(Img_B,Jb,'montage')
axis off
subplot(2,2,4)
imshowpair(Img_gry,Jgry,'montage')
axis off
