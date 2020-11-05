% Omplir buits blancs de l'interior de la mà
int = false;
cont_ver_dalt = 0;
cont_ver_baix = 0;
cont_hor_dret = 0;
cont_hor_esq = 0;
for a=1:1:size(image2,1)
    for b=1:1:size(image2,2)
        if (mask2(a,b) == 1)
            cont_ver_dalt = 0;
            cont_ver_baix = 0;
            cont_hor_esq = 0;
            cont_hor_dret = 0;
            for c=1:1:a-1
                cont_ver_dalt = cont_ver_dalt + mask2(c,b);
            end
            for c=a+1:1:size(image2,1)
                cont_ver_baix = cont_ver_baix + mask2(c,b);
            end
            for d=1:1:b-1
                cont_hor_esq = cont_hor_esq + mask2(a,d);
            end
            for d=b+1:1:size(image2,2)
                cont_hor_dret = cont_hor_dret + mask2(a,d);
            end
            if (cont_hor_dret ~= b-1)
                if (cont_hor_esq ~= (size(image2,2)-b))
                    if (cont_ver_dalt ~= a-1)
                        if (cont_ver_baix ~= (size(image2,1)-a))
                            if (histCbCr(imageCbCr(a,b,2), imageCbCr(a,b,3)) ~= 0)
                                mask2(a,b) = 0;
                            end
                        end
                    end
                end
            end
        end
    end
end

% Eliminar conjunts de píxels negres dispersos
% white = 0;
% black = 0;
% for i=1:1:size(image2,1)
%     for j=1:1:size(image2,2)
%         if (mask2(i,j) == 0)
%             for k=i-3:1:i+3
%                 for l=j-3:1:j+3
%                     if (k < 1 || l < 1)
%                         white = white;
%                     elseif (k >= size(image2,1) || l >= size(image2,2))
%                         black = black;
%                     elseif (mask2(k,l) == 1) 
%                         white = white + 1;
%                     else 
%                         black = black + 1;
%                     end
%                 end
%             end
%             if (white > black)
%                 mask2(i,j) = 1;
%             end
%             white = 0;
%             black = 0;
%         end
%     end
% end
