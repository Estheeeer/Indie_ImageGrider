% developed by Baihan Lin
% June 2016

% origin = imread('/Users/DoerLBH/Dropbox/git/Indie_imageGrider/test/key/happy-dog.jpg');
% I = imresize(origin,[100 100],'bilinear');
% avgrgb = mean(mean(I));
% avgr = avgrgb(:,:,1);
% avgg = avgrgb(:,:,2);
% avgb = avgrgb(:,:,3);

origin = imread('/Users/DoerLBH/Dropbox/git/Indie_imageGrider/test/key/happy-dog.jpg');
I = imresize(origin,[100 100],'bilinear');
% I = double(I);

r = I(:,:,1);
g = I(:,:,2);
b = I(:,:,3);

dim = size(I);
w = dim(1);
h = dim(2);

pixspace = zeros(10, 3);
pixspace(2,:) = [170 100 134];
pixspace(1,:) = [1 120 34];
pixspace(3,:) = [190 12 3];
pixspace(4,:) = [100 1 234];
pixspace(5,:) = [10 230 24];
pixspace(6,:) = [10 230 24];
pixspace(7,:) = [120 130 140];
pixspace(8,:) = [220 130 14];
pixspace(9,:) = [220 230 230];

% knnsearch(pixspace, [220 130 13])

keyspace = zeros(w, h, 1);
outspace = zeros(w, h, 3);

for wind = 1:w
    for hind = 1:h
        keyrgb = [r(wind, hind) g(wind, hind) b(wind, hind)];
        keyspace(w, h, 1) = knnsearch(pixspace, keyrgb);
        outspace(w, h, :) = keyrgb;
    end
end

% imshow(I)
imshow(outspace)
