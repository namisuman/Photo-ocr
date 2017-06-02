pkg load image;
s=input("Enter an existing image for ocr\n","s");
I=imread(s);
%convert image to grayscale
 [r,c,channels]=size(I);
  if channels>1
  I=rgb2gray(I);
endif;
%perform canny edge detection
c=edge(I,'canny');
distanceImage=bwdist(c);
skeletonImage=bwmorph(c,'thin',inf);
strokeWidthImage=distanceImage;
strokeWidthImage(~skeletonImage)=0;
BW=im2bw(I);
connComp=bwconncomp(BW);
afterStrokeWidthTextMask=BW;
for i=1:connComp.NumObjects
  strokewidths=strokeWidthImage(connComp.PixelIdxList{i});
  if (std(strokewidths)/mean(strokewidths))>0.35
    afterStrokeWidthTextMask(connComp.PixelIdxList{i})=0;
  end;
end;
charSegmentation(afterStrokeWidthTextMask);
 
