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

[~,list] = system(['find ' path ' -type f -name "*.rhd"']);
