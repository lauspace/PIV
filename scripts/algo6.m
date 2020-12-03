clear all
close all

tic

% Creem variables amb els path per modificar-los fàcilment
% Editar path segons la direcció del teu ordinador
path = '/home/laura/Desktop/Adria-Laura';
path_scripts = [path '/Scripts'];
% Modificar Training-Dataset, Validation-Dataset o Test-Dataset
path_masks_ideal = [path '/Prog0-2/Training-Dataset/Masks-Ideal'];
path_masks = [path '/Prog0-2/Training-Dataset/Masks'];
path_images = [path '/Prog0-2/Training-Dataset/Images'];
path_fingers = [path '/Prog0-2/Training-Dataset/Fingers'];

% Guardem els directoris en variables per extreure'n dades
dirMask = dir(path_masks_ideal);
dirImg = dir(path_images);
dirMasks = dir(path_masks);
dirFing = dir(path_fingers);

% Generem l'histograma
algo1;

% Generem les mascares amb l'algo2
% Aplicant el càlcul del número de dits de l'algo5

for k = 3:1:numMask
    cd(path_scripts);
    algo2;
    
    % Guardem la imatge amb el nom desitjat
    cd(path_masks);
    imwrite(mask2, dirImg(k).name);
    
    cd(path_scripts);    
    algo5;
    
    % Guardem el número de dits en el corresponent fitxer
    cd(path_fingers);
    
    FileName = sprintf('%d.txt', k-2);
    docID = fopen(FileName, 'wt');
    fprintf(docID,'%d',num_dits);
end

cd(path_scripts)