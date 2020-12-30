% Generar matriu igual a la mida de la màscara

circ_ring = ones(size(mask2,1), size(mask2,2));

% Posar a 1 el centre del palmell

circ_ring(I_row, I_col) = 0; 

% Crear dos elements estructurals amb forma de disc per
% generar el cercle exterior i interior

se5 = strel('disk',round(sum_pixel_palm/2050),0);
se6 = strel('disk',round(sum_pixel_palm/1950),0);

% Erosionar el punt central mitjançant la composició d'elements
% estructurals

ext = imerode(circ_ring, se5);
int = imerode(circ_ring, se6);
for i = 1:1:5
    ext = imerode(ext, se5);
    int = imerode(int, se6);
end

% Restar els cercles i invertir els colors de la imatge per 
% poder comparar-la amb la màscara de la mà

circ_ring = imcomplement(logical(-1*(ext-int)));

% Generar la superposició per comprovar el correcte funcionament

sup = circ_ring.*mask2;