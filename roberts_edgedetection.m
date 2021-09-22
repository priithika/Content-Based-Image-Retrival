img = imread('lenna.png');
img = uint8(input_image);
figure, imshow(input_image); title('Input Image');
img = rgb2gray(input_image);
  
img = double(input_image);
 filtered_image = zeros(size(input_image));
  Mx = [1 0; 0 -1];
My = [0 1; -1 0];
for i = 1:size(input_image, 1) - 1
    for j = 1:size(input_image, 2) - 1
          Gx = sum(sum(Mx.*input_image(i:i+1, j:j+1)));
        Gy = sum(sum(My.*input_image(i:i+1, j:j+1)));
                  filtered_image(i, j) = sqrt(Gx.^2 + Gy.^2);
         
    end
end  
thresholdValue = 100; % varies between [0 255]
output_image = max(filtered_image, thresholdValue);
output_image(output_image == round(thresholdValue)) = 0;
 output_image = im2bw(output_image);
figure, imshow(output_image); title('Edge Detected Image');
