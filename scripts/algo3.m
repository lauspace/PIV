% Correr només l'algorisme 4

% Generar les màscares de totes les imatges
for k = 3:1:numMask
    cd(path_scripts);
    algo2;

    % Guardem la imatge amb el nom desitjat
    imwrite(mask2, dirImg(k).name);
end

cd(path_scripts);