% Generar les màscares de totes les imatges
for k = 3:1:numMask
    num = k;
    cd('/home/laura/Desktop/Adria-Laura/Scripts/');
    algo2;

    % Guardem la imatge amb el nom desitjat
    imwrite(mask2, dirImg(num).name);
end

cd('/home/laura/Desktop/Adria-Laura/Scripts/');