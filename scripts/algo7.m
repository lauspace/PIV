estim_correctes = 0;

for i = 3:1:numMask
    cd(path_fingers)
    
    % Guardar valor obtingut per nosaltres
    
    FileName = sprintf('%d.txt', k);
    docID = fopen(FileName, 'r');
    my_num = fscanf(docID, '%d');
    fclose(docID);
    
    % Guardar valor real
    
    cd(path_images);
    
    file_name = dirImg(i).name;
    
    if (startsWith(file_name, num2str(my_num)))
        estim_correctes = estim_correctes + 1;
    end
end

accuracy = estim_correctes / size(dirMask,1);

