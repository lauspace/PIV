% Generar matriu igual a la mida de la màscara

circ = ones(size(mask2,1), size(mask2,2));

% Posar a 1 el centre del palmell

circ(I_row, I_col) = 0; 

% Crear un element estructural amb forma de disc

se7 = strel('disk',round(sum_pixel_palm/2000),0);

% Erosionar el punt central mitjançant la composició d'elements
% estructurals

circ = imerode(circ, se7);
for i = 1:1:5
    circ = imerode(circ, se7);
end

% Invertir els colors de la imatge per poder comparar-la amb la
% màscara de la mà

circ = imcomplement(logical(-1*(circ)));