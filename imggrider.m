% developed by Baihan Lin
% June 2016




prompt = 'Where is your pixel folder?: ';
disp('e.g.  /Users/DoerLBH/Dropbox/git/Indie_imageGrider/test');
path = input(prompt,'s');

% /Users/DoerLBH/Dropbox/git/Indie_imageGrider/test

disp(path);
disp(date);

pathPix = strcat(path, '/pixel');
pathKey = strcat(path, '/key');
pathOut = strcat(path, '/out-', date);

[~,pixList] = system(['find ' pathPix ' -type f -name "*.jpg"']);
pixs = strsplit(pixList);
pixs = unique(pixs);
pixs = pixs(~cellfun('isempty',pixs));
pixelNum = length(pixs);

[~,keyList] = system(['find ' pathKey ' -type f -name "*.jpg"']);
keys = strsplit(keyList);
keys = unique(keys);
keys = keys(~cellfun('isempty',keys));
keyNum = length(keys);

for pindex = 1 : length(pixs)


% I = imread('circuit.tif');
% avgrgb = mean(mean(I))
% 
% J = imresize(I,[10 10],'bilinear');
% 
% figure, imshow(K);
% 

end

for kindex = 1 : length(keys)

% I = imread('circuit.tif');
% avgrgb = mean(mean(I))
% 
% J = imresize(I,[10 10],'bilinear');
% 
% figure, imshow(K);
% 

end
