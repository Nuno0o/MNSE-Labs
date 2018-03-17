function segmentBB (inputImage, outputImage)
% this function receives an input image (with a blue background)
% and an output image. It extracts objects in the foreground of 
% the input image and adds them onto the output image
image=imread(inputImage);

% get image dimensions: an RGB image has three planes
% reshaping puts the RGB layers next to each other generating
% a two dimensional grayscale image

[height, width, planes] = size(image); %obtain the dimensions of the matrix
%rgb = reshape(image, height, width * planes);

%imagesc(rgb);                   % visualize RGB planes
%colorbar on                     % display colorbar

r = image(:, :, 1);             % red channel
g = image(:, :, 2);             % green channel
b = image(:, :, 3);             % blue channel

figure, imshow([r g b]), title('RGB components');

%%%%%%%%%%%%%%%%
%First approach using only the Blue channel values
%%%%%%%%%%%%%%%%
% write here the code to plot the histogram 
figure,imhist(b), title(' B channel histogram');
threshold=input('Which threshold?'); % ask the user for a threshold

%threshold = 100;                % threshold value
%imagesc(b < threshold);         % display the binarized image

% write here the code to generate a new matrix with dimensions "height" and
% "width" with white pixels in the locations corresponding to the locations in the B matrix with low values 
c=zeros(height, width);
for i=1:height
    for j=1:width
        if(b(i,j)<threshold) c(i,j)=255;
        end
    end
end
figure, imshow(c),title('B&W segmented object');

% here the code to obtain the full color representation of 
% the foreground objects
foregroundR=zeros(height, width);
foregroundG=zeros(height, width);
foregroundB=zeros(height, width);

for i=1:height
    for j=1:width
        if(b(i,j)<threshold) foregroundR(i,j)=r(i,j);foregroundG(i,j)=g(i,j);foregroundB(i,j)=b(i,j);
        end
    end
end
foregroundRGB=cat(3,uint8(foregroundR),uint8(foregroundG),uint8(foregroundB));
figure, imshow(foregroundRGB),title('coloured segmented object');
%%%%%%%%%%%%%
% alternative using the blueness factor
%%%%%%%%%%%%%
blueness = double(b) - max(double(r), double(g));
imshow(uint8(blueness));  % visualize the blueness image
%decide the threshold
imhist(uint8(blueness));
threshold=input('Which threshold?'); % ask the user for a threshold

foregroundObjects=blueness<threshold;
figure, imshow(foregroundObjects), title('segmented image using blueness');;
% here the code to obtain the full color representation of 
% the foreground objects
foregroundR=zeros(height, width);
foregroundG=zeros(height, width);
foregroundB=zeros(height, width);

for i=1:height
    for j=1:width
        if(b(i,j)<threshold) foregroundR(i,j)=r(i,j);foregroundG(i,j)=g(i,j);foregroundB(i,j)=b(i,j);
        end
    end
end
foregroundRGB=cat(3,uint8(foregroundR),uint8(foregroundG),uint8(foregroundB));
figure, imshow(foregroundRGB),title('coloured segmented object');

%%%%%%%%%%%%%%
% creating a new image by superimposing the segmentated objects
%%%%%%%%%%%%%%

secondImage=input('insert the name of the new background image');
