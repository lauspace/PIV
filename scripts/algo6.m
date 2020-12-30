clear all;
close all;
clc;

% Crear variables amb els path per modificar-los fàcilment
% Editar path segons la direcció del teu ordinador

path = '';
path_scripts = [path '/Scripts'];

% Modificar Training-Dataset, Validation-Dataset o Test-Dataset

path_masks_ideal = [path '/Prog0-2/Test-Prog2/Masks-Ideal'];
path_masks = [path '/Prog0-2/Test-Prog2/Masks'];
path_images = [path '/Prog0-2/Test-Prog2/Images'];
path_fingers = [path '/Prog0-2/Test-Prog2/Fingers'];

% Guardar els directoris en variables per extreure dades

dirMask = dir(path_masks_ideal);
dirImg = dir(path_images);
dirMasks = dir(path_masks);
dirFing = dir(path_fingers);

% Generar l'histograma

algo1;

% Iterar per generar les màscares amb l'algo2 i fer el càlcul del número 
% de dits amb l'algo5

for k = 3:1:numMask
    cd(path_scripts);
    algo2;
    
    % Guardar la imatge amb el nom desitjat
    
    cd(path_masks);
    imwrite(mask2, dirImg(k).name);   
    
    cd(path_scripts);    
    algo5;
    
    % Guardar el número de dits en el corresponent fitxer
    
    cd(path_fingers);
    
    FileName = sprintf('%d.txt', k-2);
    docID = fopen(FileName, 'wt');
    fprintf(docID,'%d',num_dits);
end

% Evaluació dels resultats

cd(path_scripts);
algo7;