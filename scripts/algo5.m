cd(path_masks);

mask = im2bw(imread(dirMasks(7).name));

% Obtenim la mascara només de la mà (sense braç)
hand_palm_mask = mask/max(max(mask));

for i = 1:size(hand_palm_mask,1)
    for j = 1:round(0.25*size(hand_palm_mask,2))
        hand_palm_mask(i,j) = 1;
    end
end

sum_pixel_palm = size(mask,1)*size(mask,2) - sum(sum(hand_palm_mask));

% Distance transform

dist_tran = bwdist(hand_palm_mask);

% Trobar les coordenades del valor màxim de dist_tran

[M,I] = max(dist_tran(:));
[I_row, I_col] = ind2sub(size(dist_tran),I);

% Fer un cercle (de mida proporcional al numero pixels de la mà)



% hand_palm_mask - cercle

% Veure quants elements independents tenim
% Tenint en compte que podem tenir petites mascares negres

% Display_Images(dist_tran)

cd(path_scripts)
