function I_main = main(I,threshValue)

I2 = segmentGlove(I);
imshow(I);
[I_skin,I_noskin] = segmentSkin(I2);
identifyStains(I_skin,I,2);
I_stains = segmentStains(I_noskin,threshValue);
identifyStains(I_stains,I,1);
