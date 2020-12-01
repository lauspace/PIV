cd(path_masks);

test = mask2;

% Interior mans
se1 = ones(12,12);
% Erosió + Dilatació
se2 = ones(6,6);
% Linies
se3 = ones(1,8);
se4 = ones(8,1);

mask2 = imclose(mask2,se2);

mask2 = imerode(test,se1);
% mask21 = imopen(mask2,se3);
% mask22 = imopen(mask2,se4);
% mask2 = and(mask21, mask22);

% Ungles
mask2 = bwareaopen(mask2,5000);

mask2 = imdilate(mask2,se1);

% Display_Images(test,[0,255], opening1,[0,255]);  

cd(path_scripts);

