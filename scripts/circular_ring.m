% Generar matriu igual a la mida de la màscara

circ_ring = ones(size(mask,1), size(mask,2));

% Posar a 1 el centre del palmell

circ_ring(I_row, I_col) = 0; 

% Fer dues abertures per fer el cercle exterior i interior

se5 = strel('disk',round(sum_pixel_palm/400),0);
se6 = strel('disk',round(sum_pixel_palm/350),0);
ext = imerode(circ_ring, se5);
int = imerode(circ_ring, se6);

circ_ring = imcomplement(logical(-1*(ext-int)));

sup = circ_ring.*mask;

Display_Images(sup)