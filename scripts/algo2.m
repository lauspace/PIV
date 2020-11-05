cd('/home/laura/Desktop/Adria-Laura/Training-Dataset/Images');
image2 = imread(dirImg(num).name);
imageCbCr = rgb2ycbcr(image2);

% Generem la màscara amb tots els valors a zero
cd('/home/laura/Desktop/Adria-Laura/Training-Dataset/Masks');
mask2 = zeros(size(image,1), size(image,2));

% Detectem quins píxels corresponen a pell i generem la màscara
for i = 1:1:size(image2,1)
    for j = 1:1:size(image2,2)
        % Valor óptim entre 8500-9000
        if (histCbCr(imageCbCr(i,j,2), imageCbCr(i,j,3)) < 8500)
            mask2(i,j) = 1;
        end
    end
end

% Tractament de la imatge (si es necesari)
% cd ('/home/laura/Desktop/Adria-Laura/Scripts/');
% mask_treat;