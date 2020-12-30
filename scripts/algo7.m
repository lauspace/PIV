% El fitxer error.txt mostra els fitxers on el número de dits no s'ha 
% encertat. Per tant cada cop que s'executa l'algo7 s'elimina l'anterior

cd(path_fingers);
delete('error.txt');

% Definir el nom del fitxer d'error

FileNameError = sprintf('error.txt');

% Generar un vector amb les respostes correctes de Test

respostes = [2, 4, 5, 1, 3, 4, 3, 4, 3, 2, 1, 1, 2, 1, 3, 2, 2, 3, 1, 5, 4, 2, 2, 2, 5, 5, 5, 4, 3, 2, 1, 1, 3, 3, 4, 4, 5, 5, 3, 4, 2, 1, 5, 5, 1, 2, 1, 5, 5, 5, 1, 1, 2, 3, 3, 2, 3, 4, 4, 4, 0, 2, 1, 5, 1, 0, 3, 3, 4, 5, 0, 2, 2, 4, 4, 1, 0, 5, 5, 3, 1, 5, 5, 2, 3, 0, 1, 4, 4, 3, 1, 2, 2, 3, 4]; 

% Inicialitzar els paràmetres d'estimacions correctes, true positive,
% positive i true.

estim_correctes = 0;

true_pos_0 = 0;
true_pos_1 = 0;
true_pos_2 = 0;
true_pos_3 = 0;
true_pos_4 = 0;
true_pos_5 = 0;

true_0 = 0;
true_1 = 0;
true_2 = 0;
true_3 = 0;
true_4 = 0;
true_5 = 0;

positive_0 = 0;
positive_1 = 0;
positive_2 = 0;
positive_3 = 0;
positive_4 = 0;
positive_5 = 0;

% Iterar per cada màscara i obtenir l'evaluació

for i = 3:1:numMask
    cd(path_fingers)
    
    % Guardar el valor obtingut per nosaltres
    
    FileName = sprintf('%d.txt', i-2);
    docID = fopen(FileName, 'r');
    my_num = fscanf(docID, '%d');
    fclose(docID);
    
    % Guardar el valor real
    
    cd(path_masks_ideal);
    
    file_name = dirMask(i).name;
    
    cd(path_fingers);
   
    % Càlcul de les estimacions fetes correctament
    
    if (my_num == respostes(i-2))
        estim_correctes = estim_correctes + 1;
   
    % Guardar les màscares amb dits mal contats
    
    else
        docID = fopen(FileNameError, 'a');
        fprintf(docID, 'Fitxer: %s: ', file_name);
        fprintf(docID, 'Dits detectats: %d, ', my_num);
        fclose(docID);
    end
    
    % Guardar el numero de trues i true positives
    
    % Si tenim 0 dits
    if (respostes(i-2) == 0)
        true_0 = true_0 + 1;
        if (respostes(i-2) == my_num)
            true_pos_0 = true_pos_0 + 1;
        end
    end
    
    % Si tenim 1 dit
    if (respostes(i-2) == 1)
        true_1 = true_1 + 1;
        if (respostes(i-2) == my_num)
            true_pos_1 = true_pos_1 + 1;
        end
    end
    
    % Si tenim 2 dits
    if (respostes(i-2) == 2)
        true_2 = true_2 + 1;
        if (respostes(i-2) == my_num)
            true_pos_2 = true_pos_2 + 1;
        end
    end 
    
    % Si tenim 3 dits
    if (respostes(i-2) == 3)
        true_3 = true_3 + 1;
        if (respostes(i-2) == my_num)
            true_pos_3 = true_pos_3 + 1;
        end
    end
    
    % Si tenim 4 dits
    if (respostes(i-2) == 4)
        true_4 = true_4 + 1;
        if (respostes(i-2) == my_num)
            true_pos_4 = true_pos_4 + 1;
        end
    end
    
    % Si tenim 5 dits
    if (respostes(i-2) == 5)
        true_5 = true_5 + 1;
        if (respostes(i-2) == my_num)
            true_pos_5 = true_pos_5 + 1;
        end
    end
    
    % Guardar el número de positius
    if (my_num == 0) 
        positive_0 = positive_0 + 1; 
    end
    if (my_num == 1) 
        positive_1 = positive_1 + 1; 
    end
    if (my_num == 2)
        positive_2 = positive_2 + 1;
    end
    if (my_num == 3)
        positive_3 = positive_3 + 1;
    end
    if (my_num == 4)
        positive_4 = positive_4 + 1;
    end
    if (my_num == 5)
        positive_5 = positive_5 + 1;
    end
end

% Càlcul del F-Score per cada número de dits

% Per 0 dits
precision_0 = true_pos_0/positive_0;
recall_0 = true_pos_0/true_0;
F_Score_0 = 2*(precision_0 * recall_0)/(precision_0 + recall_0);

if (isnan(F_Score_0))
    F_Score_0 = 0;
end

% Per 1 dit
precision_1 = true_pos_1/positive_1;
recall_1 = true_pos_1/true_1;
F_Score_1 = 2*(precision_1 * recall_1)/(precision_1 + recall_1);

if (isnan(F_Score_1))
    F_Score_1 = 0;
end

% Per 2 dits
precision_2 = true_pos_2/positive_2;
recall_2 = true_pos_2/true_2;
F_Score_2 = 2*(precision_2 * recall_2)/(precision_2 + recall_2);

if (isnan(F_Score_2))
    F_Score_2 = 0;
end

% Per 3 dits
precision_3 = true_pos_3/positive_3;
recall_3 = true_pos_3/true_3;
F_Score_3 = 2*(precision_3 * recall_3)/(precision_3 + recall_3);

if (isnan(F_Score_3))
    F_Score_3 = 0;
end

% Per 4 dits
precision_4 = true_pos_4/positive_4;
recall_4 = true_pos_4/true_4;
F_Score_4 = 2*(precision_4 * recall_4)/(precision_4 + recall_4);

if (isnan(F_Score_4))
    F_Score_4 = 0;
end

% Per 5 dits
precision_5 = true_pos_5/positive_5;
recall_5 = true_pos_5/true_5;
F_Score_5 = 2*(precision_5 * recall_5)/(precision_5 + recall_5);

if (isnan(F_Score_5))
    F_Score_5 = 0;
end

% Càlcul F-Score i Accuracy totals
F_Score = (true_0 * F_Score_0 + true_1 * F_Score_1 + true_2 * F_Score_2 + true_3 * F_Score_3 + true_4 * F_Score_4 + true_5 * F_Score_5) / (size(dirMask,1)-2);

Accuracy = estim_correctes / (size(dirMask,1)-2);