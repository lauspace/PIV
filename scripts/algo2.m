% Correr només l'algorisme 4

cd(path_images);
image2 = imread(dirImg(k).name);
imageCbCr = rgb2ycbcr(image2);

% Generem la màscara amb tots els valors a zero
cd(path_masks);
mask2 = zeros(size(image2,1), size(image2,2));

% Detectem quins píxels corresponen a pell i generem la màscara
for i = 1:1:size(image2,1)
    for j = 1:1:size(image2,2)
        % Valor óptim entre 8500-9000
        if (histCbCr(imageCbCr(i,j,2), imageCbCr(i,j,3)) < 13000)
            mask2(i,j) = 1;
        end
    end
end

% Tractament de la imatge (si es necesari)
cd (path_scripts);
mask_treat;