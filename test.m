% developed by Baihan Lin
% June 2016

Origin = imread('/Users/DoerLBH/Dropbox/git/Indie_imageGrider/test/key/happy-dog.jpg');
I = imresize(Origin,[100 100],'bilinear');
avgrgb = mean(mean(I));
avgr = avgrgb(:,:,1);
avgg = avgrgb(:,:,2);
avgb = avgrgb(:,:,3);

figure, imshow(I);


