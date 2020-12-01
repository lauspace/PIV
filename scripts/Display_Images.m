function Display_Images(varargin)
% DISPLAY_IMAGES  Normalized display of 1, 2, 3 or 4 intensity images
%
%  Display_Images(im1, im2, im3, ...) displays the intensity images 
%  im1, im2, ... using subimage and imshow.
%  Each displayed image is normalized for display between its 
%  minimum and maximum intensity values
%
%  See also IMSHOW, SUBIMAGE
%
%  Alternativa: Display_Images(im1, [min,max], ...), on [min,max] són els
%  valors mínim i màxim (marge dinàmic) de la represetació de la imatge.
%
% JRC Feb98, josep@gps.tsc.upc.es. Versió 2, juny16.

nvar=length(varargin);

qim=[];
for i=1:nvar
    if ~([size(varargin{i},1),size(varargin{i},2)]==[1,2]); qim=[qim,i]; end
end
N=length(qim);
for i=1:N
    switch i
        case 1
            im1=varargin{qim(1)}; mM1=[];
            if nvar>qim(1), aux=varargin{qim(1)+1};
                if [size(aux,1),size(aux,2)]==[1,2]; mM1=aux; end
            end
        case 2
            im2=varargin{qim(2)}; mM2=[];
            if nvar>qim(2), aux=varargin{qim(2)+1};
                if [size(aux,1),size(aux,2)]==[1,2]; mM2=aux; end
            end
        case 3
            im3=varargin{qim(3)}; mM3=[];
            if nvar>qim(3), aux=varargin{qim(3)+1};
                if [size(aux,1),size(aux,2)]==[1,2]; mM3=aux; end
            end
        case 4
            im4=varargin{qim(4)}; mM4=[];
            if nvar>qim(4), aux=varargin{qim(4)+1};
                if [size(aux,1),size(aux,2)]==[1,2]; mM4=aux; end
            end
    end
end

samesize=1;
dim1(1)=size(im1,1); dim1(2)=size(im1,2);

switch N
    case 4
        ha(1)=subplot(2,2,1); imshow(im1,mM1); title('Image 1');
        ha(2)=subplot(2,2,2); imshow(im2,mM2); title('Image 2');
        if prod(dim1==[size(im2,1),size(im2,2)])==0, samesize=0; end
        ha(3)=subplot(2,2,3); imshow(im3,mM3); title('Image 3');
        if prod(dim1==[size(im3,1),size(im3,2)])==0, samesize=0; end
        ha(4)=subplot(2,2,4); imshow(im4,mM4); title('Image 4');
        if prod(dim1==[size(im4,1),size(im4,2)])==0, samesize=0; end
    case 3
        ha(1)=subplot(1,3,1); imshow(im1,mM1); title('Image 1');
        ha(2)=subplot(1,3,2); imshow(im2,mM2); title('Image 2');
        if prod(dim1==[size(im2,1),size(im2,2)])==0, samesize=0; end
        ha(3)=subplot(1,3,3); imshow(im3,mM3); title('Image 3');
        if prod(dim1==[size(im3,1),size(im3,2)])==0, samesize=0; end
    case 2
        ha(1)=subplot(1,2,1); imshow(im1,mM1); title('Image 1');
        ha(2)=subplot(1,2,2); imshow(im2,mM2); title('Image 2');
        if prod(dim1==[size(im2,1),size(im2,2)])==0, samesize=0; end
    case 1
        ha(1)=subplot(1,1,1); imshow(im1,mM1); title('Image 1');
    otherwise
        error('You can only visualize 1, 2, 3 or 4 images with this function');
end
set(gcf,'visible','off')

linkaxes, zoom on
set(gcf,'units','normalized','outerposition',[0 0 1 1],'visible','on')
if samesize==0, linkaxes(ha,'off'), end

impixelinfo