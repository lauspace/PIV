algo1;
algo3;

dirMasks = dir('/home/laura/Desktop/Adria-Laura/Training-Dataset/Masks');

total_pixel_num = 0;
true_negative = 0;
true_positive = 0;
false_negative = 0;
false_positive = 0;

for k = 1:1:numMask
    cd('/home/laura/Desktop/Adria-Laura/Training-Dataset/Masks-Ideal');
    original_mask = imread(dirMask(num).name);
    
    cd('/home/laura/Desktop/Adria-Laura/Training-Dataset/Masks');
    generated_mask = imread(dirMasks(num).name);

    % Comparem la màscara obtinguda amb la original
    for i = 1:1:size(image2,1)
        for j = 1:1:size(image2,2)
            total_pixel_num = total_pixel_num + 1;
            if (original_mask(i,j) == generated_mask(i,j) == 1)
                true_positive = true_positive + 1;
            end
            if (original_mask(i,j) == generated_mask(i,j) == 0)
                true_negative = true_negative + 1;
            end
            if (original_mask(i,j) == 1 && generated_mask(i,j) == 0)
                false_negative = false_negative + 1;
            end
            if (original_mask(i,j) == 0 && generated_mask(i,j) == 1)
                false_positive = false_positive + 1;
            end
        end
    end
end


% Càlcul dels paràmetres "Precision" i "Recall"
precision = true_positive / (true_positive + false_positive);
recall = true_positive / (true_positive + false_negative);

% Càlcul del F-Score
f_score = 2 * (precision * recall) / (precision + recall)
