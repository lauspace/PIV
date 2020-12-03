% algo4;

% cd(path_masks);

% mask2 = im2bw(imread(dirMasks(4).name));

% Obtenim la mascara només de la mà (sense braç)
hand_palm_mask = mask2/max(max(mask));

for i = 1:size(hand_palm_mask,1)
    for j = 1:round(0.25*size(hand_palm_mask,2))
        hand_palm_mask(i,j) = 1;
    end
end

sum_pixel_palm = size(mask2,1)*size(mask2,2) - sum(sum(hand_palm_mask));

% Distance transform

dist_tran = bwdist(hand_palm_mask);

% Trobar les coordenades del valor màxim de dist_tran

[M,I] = max(dist_tran(:));
[I_row, I_col] = ind2sub(size(dist_tran),I);

% Fer un anell circular (de mida proporcional al numero de píxels de la mà)

cd(path_scripts);
circular_ring;

% Buscar els punts de la mask que es creuen amb l'anell

creuaments = or(mask2, circ_ring);

% Etiquetar les components connectades

cc = bwconncomp(imcomplement(creuaments));

% Eliminar les més petites que puguin correspondre a píxels random

num_dits = cc.NumObjects;

for p = 1:1:cc.NumObjects
    if (size(cc.PixelIdxList{p},1) <= 100)
        num_dits = num_dits - 1;
    end
end

% Restar una component connectada que correspon al braç

num_dits = num_dits - 1;

cd(path_scripts);