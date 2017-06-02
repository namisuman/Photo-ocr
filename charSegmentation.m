 function charSegmentation(str)
BW=str;
BW=~BW;
s=regionprops(BW);
bb=round(reshape([s.BoundingBox],4,[]).');
chars=cell(1,numel(s));
for idx=1:numel(s)
  chars{idx}=BW(bb(idx,2):bb(idx,2)+bb(idx,4)-1,bb(idx,1):bb(idx,1)+bb(idx,3)-1);
end;
X=ones(numel(s),400);
for idx=1:numel(s),
  img=~chars{idx};
  [r,c,channels]=size(img);
  if channels>1
  img=rgb2gray(img);
endif;
  img=imresize(img,[20,20]);
  img=reshape(img,1,400);
  X(idx,:)=img;
end;
save imageChar.mat X;
TestDataTesting(X);