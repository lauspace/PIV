cd(path_images);

% Llegir la imatge i convertir-la en CbCrY

image2 = imread(dirImg(k).name);
imageCbCr = rgb2ycbcr(image2);

% Generar la màscara amb tots els valors a zero

cd(path_masks);
mask2 = zeros(size(image2,1), size(image2,2));

% Detectat quins píxels corresponen a pell i generem la màscara

for i = 1:1:size(image2,1)
    for j = 1:1:size(image2,2)
        if (histCbCr(imageCbCr(i,j,2), imageCbCr(i,j,3)) < 13000)
            mask2(i,j) = 1;
        end
    end
end

% Tractament de la imatge (si es necesari)

cd (path_scripts);
% mask_treat;