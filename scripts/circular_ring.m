% Generar matriu igual a la mida de la màscara

circ_ring = ones(size(mask2,1), size(mask2,2));

% Posar a 1 el centre del palmell

circ_ring(I_row, I_col) = 0; 

% Fer dues abertures per fer el cercle exterior i interior

se5 = strel('disk',round(sum_pixel_palm/2000),0);
se6 = strel('disk',round(sum_pixel_palm/1900),0);

% Erosionar el punt central mitjançant la composició d'elements
% estructurals
ext = imerode(circ_ring, se5);
int = imerode(circ_ring, se6);
for i = 1:1:5
    ext = imerode(ext, se5);
    int = imerode(int, se6);
end

circ_ring = imcomplement(logical(-1*(ext-int)));

% sup = circ_ring.*mask;

% Display_Images(sup)