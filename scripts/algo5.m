% Llegir la màscara a analitzar

cd(path_masks_ideal);    
mask2 = imread(dirMask(k).name);

% Obtenir la mascara només de la mà (sense braç)

hand_palm_mask = mask2/max(max(mask2));

for i = 1:round(size(hand_palm_mask,1))
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

% Descomentar la opció triada:
% 1- Fer un anell circular (de mida proporcional al numero de píxels de la mà)
% 2- Fer un cercle (de mida proporcional al numero de píxels de la mà)

cd(path_scripts);
% circular_ring;
circle;

% Buscar els punts de la màscara que es creuen amb l'anell o el cercle.
% Descomentar la opció seleccionada.

% creuaments = or(mask2, circ_ring);
creuaments = or(mask2, circ);

% Etiquetar les components connectades

cc = bwconncomp(imcomplement(creuaments));

% Eliminar les components més petites que puguin correspondre a píxels 
% externs a la mà

num_dits = cc.NumObjects;

for p = 1:1:cc.NumObjects
    if (size(cc.PixelIdxList{p},1) <= 100)
        num_dits = num_dits - 1;
    end
end

% Restar una component que correspon al braç

num_dits = num_dits - 1;

% Control d'errors: Evitar tenir valors per sota del zero

if (num_dits <= -1) num_dits = 0; end