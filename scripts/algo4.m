clear all
close all

tic

% Creem variables amb els path per modificar-los fàcilment
% Editar path segons la direcció del teu ordinador
path = '/home/laura/Desktop/Adria-Laura';
path_scripts = [path '/Scripts'];
% Modificar Training-Dataset, Validation-Dataset o Test-Dataset
path_masks_ideal = [path '/Test-Dataset/Masks-Ideal'];
path_masks = [path '/Test-Dataset/Masks'];
path_images = [path '/Test-Dataset/Images'];

% Guardem els directoris en variables per extreure'n dades
dirMask = dir(path_masks_ideal);
dirImg = dir(path_images);

% Cridem als algoritmes 1 i 3
algo1; % Genera l'histograma
algo3; % Genera les màscares

% Directori on estan guardades les mascares
dirMasks = dir(path_masks);

% Inicialització de variables per calcular F-Score
true_positive = 0;
positive = 0;
true_param = 0;

% Recorrer les màscares i comparar amb les ideals per càlcular el F-Score
for m = 3:1:numMask
    
    % Màscara Ideal
    cd(path_masks_ideal);
    original_mask = imread(dirMask(m).name);
    
    % Màscara generada per nosaltres
    cd(path_masks);
    generated_mask = imread(dirMasks(m).name);

    true_param = true_param + sum(sum(~original_mask));
    positive = positive + sum(sum(~generated_mask));
    % Comparació de la màscara obtinguda amb la original
    for n = 1:1:size(original_mask,1)
        for o = 1:1:size(original_mask,2)
            if (original_mask(n,o) == 0 && generated_mask(n,o) == 0)
                true_positive = true_positive + 1;
            end
        end
    end
end


% Càlcul dels paràmetres "Precision" i "Recall"
precision = true_positive / positive;
recall = true_positive / true_param;

% Càlcul del F-Score
f_score = 2 * (precision * recall) / (precision + recall)

toc
cd(path_scripts);

