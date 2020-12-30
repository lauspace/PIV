% Generar les màscares de totes les imatges

for k = 3:1:numMask
    cd(path_scripts);
    algo2;

    % Guardar la imatge amb el nom desitjat
    
    cd(path_masks);
    imwrite(mask2, dirImg(k).name);
end

cd(path_scripts);