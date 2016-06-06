% developed by Baihan Lin and Xinxin Zhang
% June 2016

clear all;
close all;

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
pixNum = length(pixs);

[~,keyList] = system(['find ' pathKey ' -type f -name "*.jpg"']);
keys = strsplit(keyList);
keys = unique(keys);
keys = keys(~cellfun('isempty',keys));
keyNum = length(keys);

pixw = 10;
pixh = 10;
keyw = 100;
keyh = 100;

pixspace = zeros(pixNum, 3);

for pindex = 1 : pixNum
    
    origin = imread(pixs{pindex});
    I = imresize(origin,[pixw pixh],'bilinear');
    I = double(I);
    avgrgb = mean(mean(I));
    avgr = avgrgb(:,:,1);
    avgg = avgrgb(:,:,2);
    avgb = avgrgb(:,:,3);
    pixspace(pindex,:) = [avgr, avgg, avgb];
    
end

for kindex = 1 : keyNum
    
    origin = imread(keys{kindex});
    I = imresize(origin,[keyw keyh],'bilinear');
    I = double(I);
    dim = size(I);
    w = dim(1);
    h = dim(2);
    r = I(:,:,1);
    g = I(:,:,2);
    b = I(:,:,3);
    keyspace = zeros(w, h, 1);
    outspace = zeros(w * pixw, h * pixh, 3);
    
    for wind = 1:w
        for hind = 1:h
            keyrgb = [r(wind, hind) g(wind, hind) b(wind, hind)];
            keyspace(w, h, 1) = knnsearch(pixspace, keyrgb);
            for pindw = 1:pixw
                for pindh = 1:pixh
                    origin = imread(pixs{keyspace(w, h, 1)});
                    I = imresize(origin,[pixw pixh],'bilinear');
                    outspace((w-1)*pixw+pindw,(h-1)*pixh+pindh,:) = I(pindw,pindh,:);
                end
            end
        end
    end
    figure, imshow(outspace);
end
