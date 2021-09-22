RGB = imread('https://www.traveldailymedia.com/assets/2021/05/shutterstock_1031949604-2.jpg');
imshow(RGB)
L = superpixels(RGB,500);
f = drawrectangle(gca,'Position',[100 128 350 150],'Color','g');
foreground = createMask(f,RGB);
b1 = drawrectangle(gca,'Position',[130 30 40 30],'Color','r');
b2 = drawrectangle(gca,'Position',[6 368 500 10],'Color','r');
background = createMask(b1,RGB) + createMask(b2,RGB);
BW = lazysnapping(RGB,L,foreground,background);
imshow(labeloverlay(RGB,BW,'Colormap',[0 1 0]))
maskedImage = RGB;
maskedImage(repmat(~BW,[1 1 3])) = 0;
imshow(maskedImage)
